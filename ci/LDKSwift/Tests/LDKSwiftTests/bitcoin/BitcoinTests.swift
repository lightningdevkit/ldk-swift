//
//  BitcoinTests.swift
//  DirectBindingsAppTests
//
//  Created by Arik Sosman on 3/29/22.
//

#if os(Linux)
import LDKSwift
import LDKHeaders
#endif
import XCTest

public class BitcoinTests: XCTestCase {

    func testVarInt() throws {
        do {
            let varInt = BTCVarInt(0xfc)
            let serialization = varInt.serialize()
            XCTAssertEqual(serialization, [0xfc])
        }

        do {
            let varInt = BTCVarInt(0xfd)
            let serialization = varInt.serialize()
            XCTAssertEqual(serialization, [0xfd, 0xfd, 0])
        }

        do {
            let varInt = BTCVarInt(0xfe)
            let serialization = varInt.serialize()
            XCTAssertEqual(serialization, [0xfd, 0xfe, 0])
        }
    }

    func testBlockHashing() throws {
        let block = BTCBlock()
        block.version = 1
        block.previousBlockHash = [129, 205, 2, 171, 126, 86, 158, 139, 205, 147, 23, 226, 254, 153, 242, 222, 68, 212, 154, 178, 184, 133, 27, 164, 163, 8, 0, 0, 0, 0, 0, 0]
        block.merkleRoot = [227, 32, 182, 194, 255, 252, 141, 117, 4, 35, 219, 139, 30, 185, 66, 174, 113, 14, 149, 30, 215, 151, 247, 175, 252, 136, 146, 176, 241, 252, 18, 43]
        block.timestamp = 1305998791
        block.difficultyTarget = 440711666
        block.nonce = 2504433986
        let hash = block.calculateHash();

        for i in 1...8 {
            // verify that the hash worked correctly with enough trailing 0s
            XCTAssertEqual(hash[hash.count - i], 0)
        }

        // sanity check that the hash is not all 0s
        XCTAssertNotEqual(hash[hash.count - 9], 0)

        // verify that the leading byte is nonzero
        XCTAssertNotEqual(hash[0], 0)
    }

    func testBlockSerialization() throws {
        let block = BTCBlock()
        block.version = 2
        block.previousBlockHash = BTCHashing.SHA_ZERO_HASH
        block.merkleRoot = BTCHashing.SHA_ZERO_HASH
        block.timestamp = 42
        block.difficultyTarget = 0
        block.nonce = 0

        let serialization = block.serialize()
        XCTAssertEqual(serialization, [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    }

    func testTxSerialization() throws {
        let tx = BTCTransaction()
        tx.version = 1
        let input = BTCTransaction.Input(
            previousTransactionHash: BTCHashing.SHA_ZERO_HASH,
            previousOutputIndex: 0xffffffff, // coinbase transaction has a u32::MAX prev output index
            script: []
        )
        tx.inputs = [input]
        tx.setWitnessForInput(inputIndex: 0, witness: BTCTransaction.Witness(stackElements: [[1]]))

        let output = BTCTransaction.Output(value: 100000, script: [0, 32, 214, 232, 96, 182, 226, 231, 42, 33, 219, 246, 121, 242, 58, 123, 110, 124, 118, 63, 70, 117, 109, 247, 0, 58, 172, 198, 127, 254, 216, 194, 41, 14])
        tx.outputs = [output]
        let txSerialization = tx.serialize()
        XCTAssertEqual(txSerialization.count, 99)
        XCTAssertEqual(txSerialization, [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, 255, 255, 255, 255, 1, 160, 134, 1, 0, 0, 0, 0, 0, 34, 0, 32, 214, 232, 96, 182, 226, 231, 42, 33, 219, 246, 121, 242, 58, 123, 110, 124, 118, 63, 70, 117, 109, 247, 0, 58, 172, 198, 127, 254, 216, 194, 41, 14, 1, 1, 1, 0, 0, 0, 0])

        let block = BTCBlock()
        block.version = 2
        block.previousBlockHash = BTCHashing.SHA_ZERO_HASH
        block.merkleRoot = BTCHashing.SHA_ZERO_HASH
        block.timestamp = 42
        block.difficultyTarget = 0
        block.nonce = 0
        block.transactions = [tx]
        let blockSerialization = block.serialize()
        XCTAssertEqual(blockSerialization, [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, 255, 255, 255, 255, 1, 160, 134, 1, 0, 0, 0, 0, 0, 34, 0, 32, 214, 232, 96, 182, 226, 231, 42, 33, 219, 246, 121, 242, 58, 123, 110, 124, 118, 63, 70, 117, 109, 247, 0, 58, 172, 198, 127, 254, 216, 194, 41, 14, 1, 1, 1, 0, 0, 0, 0])
    }

    #if !os(Linux)
    @available(iOS 15.0, *)
	func testRpcCalls() async throws {
		let username = ProcessInfo.processInfo.environment["BITCOIN_REGTEST_RPC_USERNAME"] ?? "polaruser" // "alice"
		let password = ProcessInfo.processInfo.environment["BITCOIN_REGTEST_RPC_PASSWORD"] ?? "polarpass" // "DONT_USE_THIS_YOU_WILL_GET_ROBBED"
		let port = NumberFormatter().number(from: ProcessInfo.processInfo.environment["BITCOIN_REGTEST_RPC_PORT"] ?? "") ?? 18443
		let rpcInterface = try RegtestBlockchainManager(rpcProtocol: .http, rpcDomain: "localhost", rpcPort: (port as! UInt), rpcUsername: username, rpcPassword: password)
		let chaintipHeight = try await rpcInterface.getChaintipHeight()
		XCTAssertGreaterThanOrEqual(chaintipHeight, 0)
		let chaintipHashImplicit = try await rpcInterface.getBlockHashHex(height: chaintipHeight)
		let chaintipHashExplicit = try await rpcInterface.getChaintipHashHex()
		XCTAssertEqual(chaintipHashImplicit, chaintipHashExplicit)
		let blockDetails = try await rpcInterface.getBlock(hash: chaintipHashExplicit)
		XCTAssertEqual(blockDetails.height, chaintipHeight)

		let chainInfo = try await rpcInterface.getChainInfo()

		let genesisHash = try await rpcInterface.getBlockHashHex(height: 1)
		let genesisDetails = try await rpcInterface.getBlock(hash: genesisHash)
		let genesisBinary = try await rpcInterface.getBlockBinary(hash: genesisHash)
		let genesisHeader = try await rpcInterface.getBlockHeader(hash: genesisHash)

		let genesisCoinbaseTxHash = genesisDetails.tx.first!
		let genesisCoinbaseTx = try await rpcInterface.getTransaction(hash: genesisCoinbaseTxHash)


		// try? await rpcInterface.submitTransaction(transaction: modifiedCoinbaseTx)

		// let address = try await rpcInterface.generateAddress()
		// let details = try await rpcInterface.mineBlocks(number: 1, coinbaseDestinationAddress: address)
		let helpDetails = try await rpcInterface.getHelp()
		// print(helpDetails)

		let exampleFundingTx: [UInt8] = [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, 255, 255, 255, 255, 1, 160, 134, 1, 0, 0, 0, 0, 0, 34, 0, 32, 15, 45, 153, 123, 98, 37, 242, 142, 113, 51, 126, 45, 206, 175, 66, 247, 173, 2, 141, 2, 27, 84, 38, 188, 34, 74, 82, 164, 28, 229, 39, 139, 1, 1, 1, 0, 0, 0, 0]

		// try? await rpcInterface.submitTransaction(transaction: exampleFundingTx)


		class Listener: BlockchainListener {
			var initializationComplete = false
			var newBlocksDetected = 0
			var blocksLost = 0

			func blockConnected(block: [UInt8], height: UInt32) {
				if self.initializationComplete {
					self.newBlocksDetected += 1
				}
				let blockHash = LDKSwiftTests.bytesToHexString(bytes: BTCHashing.doubleSha256(block))
				// print("block connected at height \(height): \(blockHash)")
			}

			func blockDisconnected(header: [UInt8]?, height: UInt32) {
				self.blocksLost += 1
				// print("block disconnected from height \(height): \(header)")
			}
		}

		var listener = Listener()
		rpcInterface.registerListener(listener)

		try await rpcInterface.preloadMonitor();
		// async let monitor = try rpcInterface.monitorBlockchain()
		listener.initializationComplete = true

		let testAddress = try await rpcInterface.generateAddress()
		let exampleOutputScript: [UInt8] = [0, 32, 200, 194, 75, 55, 227, 33, 251, 71, 196, 33, 177, 196, 155, 145, 17, 78, 244, 226, 155, 141, 216, 230, 180, 183, 149, 172, 116, 249, 56, 6, 118, 255]
		let scriptInfo = try await rpcInterface.decodeScript(script: exampleOutputScript)
		let outputAddress = (scriptInfo["addresses"] as! [String]).first!
		try await rpcInterface.mineBlocks(number: 1, coinbaseDestinationAddress: testAddress)
		try await rpcInterface.mineBlocks(number: 1, coinbaseDestinationAddress: outputAddress)

		// sleep for six seconds
		// try await Task.sleep(nanoseconds: 6_000_000_000)
		try await rpcInterface.reconcileChaintips()
		XCTAssertEqual(listener.newBlocksDetected, 2)
		XCTAssertEqual(listener.blocksLost, 0)

		do {
			let testAddress = try await rpcInterface.generateAddress()
			let chaintip = try await rpcInterface.getChaintipHeight()
			let penultimateBlockHash = try await rpcInterface.getBlockHashHex(height: chaintip - 1)
			try await rpcInterface.unmineBlock(hash: penultimateBlockHash)
			try await rpcInterface.mineBlocks(number: 1, coinbaseDestinationAddress: testAddress)

			try await rpcInterface.reconcileChaintips()
			XCTAssertEqual(listener.newBlocksDetected, 3)
			XCTAssertEqual(listener.blocksLost, 2)
		}

		do {
			let testAddress = try await rpcInterface.generateAddress()
			let chaintipHash = try await rpcInterface.getChaintipHashHex()
			print("chaintip: \(chaintipHash)")
			try await rpcInterface.unmineBlock(hash: chaintipHash)
			try await rpcInterface.mineBlocks(number: 2, coinbaseDestinationAddress: testAddress)

			try await rpcInterface.reconcileChaintips()
			XCTAssertEqual(listener.newBlocksDetected, 5)
			XCTAssertEqual(listener.blocksLost, 3)
		}

		do {
			let chaintipHash = try await rpcInterface.getChaintipHashHex()
			print("chaintip: \(chaintipHash)")
			try await rpcInterface.unmineBlock(hash: chaintipHash)

			try await rpcInterface.reconcileChaintips()
			XCTAssertEqual(listener.newBlocksDetected, 5)
			XCTAssertEqual(listener.blocksLost, 4)
		}
	}
    #endif

}
