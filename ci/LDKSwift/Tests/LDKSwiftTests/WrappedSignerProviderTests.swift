//
//  LDK
//
//  Created by Arik Sosman on 7/27/23.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif
import XCTest

class WrappedSignerProviderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Bindings.setLogThreshold(severity: .DEBUG)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChannelManagerConstruction() {
        let feeEstimator = TestFeeEstimator()
        let logger = TestLogger()
        let broadcaster = TestBroadcasterInterface()
        let persister = TestPersister()
        let filter = TestFilter()

        let chainMonitor = ChainMonitor(chainSource: filter, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: persister)

        let seed = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestampSeconds = UInt64(NSDate().timeIntervalSince1970)
        let timestampNanos = UInt32.init(truncating: NSNumber(value: timestampSeconds * 1000 * 1000))
        let myKeysManager = MyKeysManager(seed: seed, startingTimeSecs: timestampSeconds, startingTimeNanos: timestampNanos)

        let handshakeConfig = ChannelHandshakeConfig.initWithDefault()
        handshakeConfig.setMinimumDepth(val: 1)
        handshakeConfig.setAnnouncedChannel(val: false)

        let handshakeLimits = ChannelHandshakeLimits.initWithDefault()
        handshakeLimits.setForceAnnouncedChannelPreference(val: false)

        let userConfig = UserConfig.initWithDefault()
        userConfig.setChannelHandshakeConfig(val: handshakeConfig)
        userConfig.setChannelHandshakeLimits(val: handshakeLimits)
        userConfig.setAcceptInboundChannels(val: true)

        let network = Network.Testnet
        let netGraph = NetworkGraph(network: network, logger: logger)

        let params = ProbabilisticScoringParameters.initWithDefault()
        let probabilisticScorer = ProbabilisticScorer(params: params, networkGraph: netGraph, logger: logger)
        let score = probabilisticScorer.asScore()
        let scorer = MultiThreadedLockableScore(score: score)

        let channelManagerConstructionParameters = ChannelManagerConstructionParameters(config: userConfig, entropySource: myKeysManager.entropySource, nodeSigner: myKeysManager.nodeSigner, signerProvider: myKeysManager.signerProvider, feeEstimator: feeEstimator, chainMonitor: chainMonitor, txBroadcaster: broadcaster, logger: logger, enableP2PGossip: true, scorer: scorer)

        let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
        let reversedGenesisHash = LDKSwiftTests.hexStringToBytes(hexString: reversedGenesisHashHex)!
        let latestBlockHash = reversedGenesisHash
        let channelManagerConstructor = ChannelManagerConstructor(network: network, currentBlockchainTipHash: latestBlockHash, currentBlockchainTipHeight: 0, netGraph: netGraph, params: channelManagerConstructionParameters)
        
        let channelManager = channelManagerConstructor.channelManager
    }

    class MyKeysManager {
        let keysManager: KeysManager
        let nodeSigner: MyNodeSigner
        let entropySource: MyEntropySource
        let signerProvider: MySignerProvider

        init(seed: [UInt8], startingTimeSecs: UInt64, startingTimeNanos: UInt32) {
            self.keysManager = KeysManager(seed: seed, startingTimeSecs: startingTimeSecs, startingTimeNanos: startingTimeNanos)
            nodeSigner = MyNodeSigner()
            entropySource = MyEntropySource()
            signerProvider = MySignerProvider()
            nodeSigner.myKeysManager = self
            entropySource.myKeysManager = self
            signerProvider.myKeysManager = self
        }
    }

    class MyNodeSigner: NodeSigner {
        weak var myKeysManager: MyKeysManager?
        override func ecdh(recipient: Bindings.Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Bindings.Result_SharedSecretNoneZ {
            print("entering wrapper: ecdh()")
            return myKeysManager!.keysManager.asNodeSigner().ecdh(recipient: recipient, otherKey: otherKey, tweak: tweak)
        }

        override func getNodeId(recipient: Bindings.Recipient) -> Bindings.Result_PublicKeyNoneZ {
            print("entering wrapper: getNodeId()")
            let nodeId = myKeysManager!.keysManager.asNodeSigner().getNodeId(recipient: recipient)
            return nodeId
        }

        override func getInboundPaymentKeyMaterial() -> [UInt8] {
            print("entering wrapper: getInboundPaymentKeyMaterial()")
            return myKeysManager!.keysManager.asNodeSigner().getInboundPaymentKeyMaterial()
        }

        override func signGossipMessage(msg: Bindings.UnsignedGossipMessage) -> Bindings.Result_SignatureNoneZ {
            print("entering wrapper: signGossipMessage()")
            return myKeysManager!.keysManager.asNodeSigner().signGossipMessage(msg: msg)
        }

        override func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], recipient: Bindings.Recipient) -> Bindings.Result_RecoverableSignatureNoneZ {
            print("entering wrapper: signInvoice()")
            return myKeysManager!.keysManager.asNodeSigner().signInvoice(hrpBytes: hrpBytes, invoiceData: invoiceData, recipient: recipient)
        }
    }

    class MyEntropySource: EntropySource {
        weak var myKeysManager: MyKeysManager?
        override func getSecureRandomBytes() -> [UInt8] {
            print("entering wrapper: getSecureRandomBytes()")
            return myKeysManager!.keysManager.asEntropySource().getSecureRandomBytes()
        }
    }

    class MySignerProvider: SignerProvider {
        weak var myKeysManager: MyKeysManager?
        override func deriveChannelSigner(channelValueSatoshis: UInt64, channelKeysId: [UInt8]) -> Bindings.WriteableEcdsaChannelSigner {
            print("entering wrapper: deriveChannelSigner()")
            return myKeysManager!.keysManager.asSignerProvider().deriveChannelSigner(channelValueSatoshis: channelValueSatoshis, channelKeysId: channelKeysId)
        }

        override func generateChannelKeysId(inbound: Bool, channelValueSatoshis: UInt64, userChannelId: [UInt8]) -> [UInt8] {
            print("entering wrapper: generateChannelKeysId()")
            return myKeysManager!.keysManager.asSignerProvider().generateChannelKeysId(inbound: inbound, channelValueSatoshis: channelValueSatoshis, userChannelId: userChannelId)
        }

        override func readChanSigner(reader: [UInt8]) -> Bindings.Result_WriteableEcdsaChannelSignerDecodeErrorZ {
            print("entering wrapper: readChanSigner()")
            return myKeysManager!.keysManager.asSignerProvider().readChanSigner(reader: reader)
        }

        override func getDestinationScript() -> [UInt8] {
            print("entering wrapper: getDestinationScript()")
            return myKeysManager!.keysManager.asSignerProvider().getDestinationScript()
        }

        override func getShutdownScriptpubkey() -> Bindings.ShutdownScript {
            print("entering wrapper: getShutdownScriptpubkey()")
            let scriptPubkey = myKeysManager!.keysManager.asSignerProvider().getShutdownScriptpubkey()
            return scriptPubkey
        }
    }

}
