# Setup

This project is essentially a set of auto-generated decorators that call the C methods
defined in `lightning.h`. The wrappers for the most part take care of conveniences such
as conversion of Swift types into C types, and parsing C types back into Swift.

In `Bindings.swift`, there are various additional generic utility methods to aid the
developer in passing data back and forth.

The greatest effort on the part of users of this project comes in when dealing with
traits. All files located within `out/traits` are meant to be interpreted as
abstract classes. However, as Swift does not allow abstract classes, and using protocols
would shift both implementation and boilerplate burden on developers, I instead recommend
an override pattern, which I will describe in the next step.

This guide is essentially a conversion of the [Java guide](https://lightningdevkit.org/tutorials/build_a_node_in_java)
for Swift.

## Phase 1: Trait Overrides

The first set of steps we need to set up is create classes to override the trait classes.
In these example, we will simply be taking trait names such as `FeeEstimator` and
create classes inheriting from them prefixed with `My-`.

### FeeEstimator

First, define an inheriting class called `MyFeeEstimator`:

```swift
//  MyFeeEstimator.swift

import Foundation
import LightningDevKit

class MyFeeEstimator: FeeEstimator {

    override func getEstSatPer1000Weight(confirmationTarget: ConfirmationTarget) -> UInt32
        return 253
    }

}
```

Second, somewhere within the app initialization context, e.g. the app delegate's
`didFinishLaunchingWithOptions` method, instantiate the fee estimator:

```swift
// main context

let feeEstimator = MyFeeEstimator()
```

### Logger

Define the inheriting class:

```swift
//  MyLogger.swift

import Foundation
import LightningDevKit

class MyLogger: Logger {

    override func log(record: Record) {
        print("log event: \(record.getArgs())")
    }

}
```

Instantiate the value:

```swift
// main context (continued)

let logger = MyLogger()
```

### BroadcasterInterface

Define the subclass:

```swift
//  MyBroadcasterInterface.swift

import Foundation
import LightningDevKit

class MyBroadcasterInterface: BroadcasterInterface {

    override func broadcastTransactions(txs: [[UInt8]]) {
        // insert code to broadcast transaction
    }

}
```

Instantiate it:

```swift
// main context (continued)

let broadcaster = MyBroadcasterInterface()
```

### Persist

Define the subclass:

```swift
//  MyPersister.swift

import Foundation
import LightningDevKit

class MyPersister: Persist {

    override func persistNewChannel(channelId: Bindings.OutPoint, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
        let idBytes: [UInt8] = channelId.write()
        let monitorBytes: [UInt8] = data.write()

        // persist monitorBytes to disk, keyed by idBytes

        return .Completed
    }

    override func updatePersistedChannel(channelId: Bindings.OutPoint, update: Bindings.ChannelMonitorUpdate, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
        let idBytes: [UInt8] = channelId.write()
        let monitorBytes: [UInt8] = data.write()

        // modify persisted monitorBytes keyed by idBytes on disk

        return .Completed
    }

}
```

Instantiate it:

```swift
// main context (continued)

let persister = MyPersister()
```

### Filter

Define the subclass:

```swift
//  MyFilter.swift

import Foundation
import LightningDevKit

class MyFilter: Filter {

    override func registerTx(txid: [UInt8]?, scriptPubkey: [UInt8]) {
        // watch this transaction on-chain
    }

    override func registerOutput(output: WatchedOutput) {
        let scriptPubkeyBytes = output.getScriptPubkey()
        let outpoint = output.getOutpoint()
        let txid = outpoint.getTxid()
        let outputIndex = outpoint.getIndex()

        // watch for any transactions that spend this output on-chain
    }
}
```

Instantiate it:

```swift
// main context (continued)

let filter = MyFilter()
```

## Phase 2: Initializations

### ChainMonitor

```swift
// main context (continued)

let chainMonitor = ChainMonitor(chainSource: filter, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: persister)
```

### KeysManager

```swift
// main context (continued)

var keyData = Data(count: 32)
keyData.withUnsafeMutableBytes {
    // returns 0 on success
    let didCopySucceed = SecRandomCopyBytes(kSecRandomDefault, 32, $0.baseAddress!)
    assert(didCopySucceed == 0)
}
let seed = [UInt8](keyData)
let timestampSeconds = UInt64(NSDate().timeIntervalSince1970)
let timestampNanos = UInt32.init(truncating: NSNumber(value: timestampSeconds * 1000 * 1000))
let keysManager = KeysManager(seed: seed, startingTimeSecs: timestampSeconds, startingTimeNanos: timestampNanos)
```
### NetworkGraph

If you intend to use the LDK's built-in routing algorithm, you will need to instantiate
a `NetworkGraph` that can later be passed to the `ChannelManagerConstructor`:

```swift
// main context (continued)

let networkGraph = NetworkGraph(network: .Regtest, logger: logger)
```

### ChannelManager

To instantiate the channel manager, we need a couple minor prerequisites.

First, we need the current block height and hash. For the sake of this example, we'll just use
a random block at a height that does not exist at the time of this writing.

```swift
let latestBlockHash = [UInt8](Data(base64Encoded: "AAAAAAAAAAAABe5Xh25D12zkQuLAJQbBeLoF1tEQqR8=")!)
let latestBlockHeight = UInt32(700123)
```

Second, we also need to initialize a default user config, which we simply do like this:

```swift
let userConfig = UserConfig.initWithDefault()
```

Finally, we can proceed by instantiating the `ChannelManager` using `ChannelManagerConstructor`, for which we need `ChannelManagerConstructionParameters`.

```swift
// main context (continued)

let cmcParams = ChannelManagerConstructionParameters(config: userConfig, entropySource: keysManager.asEntropySource(), nodeSigner: keysManager.asNodeSigner(), signerProvider: keysManager.asSignerProvider(), feeEstimator: feeEstimator, chainMonitor: chainMonitor, txBroadcaster: broadcaster, logger: logger, enableP2PGossip: true)

let channelManagerConstructor = ChannelManagerConstructor(network: .Regtest, currentBlockchainTipHash: latestBlockHash, currentBlockchainTipHeight: latestBlockHeight, netGraph: networkGraph, params: cmcParams)

let channelManager = channelManagerConstructor.channelManager
```

#### Serializing and restoring a ChannelManager

If you need to serialize a channel manager, you can simply call its write method on itself:

```swift
let serializedChannelManager: [UInt8] = channelManager.write()
```

If you have a channel manager you previously serialized, you can restore it like this:

```swift
let serializedChannelManager: [UInt8] = [1, 1, 111, 226, 140, 10, 182, 241, 179, 114, 193, 166, 162, 70, 174, 99, 247, 79, 147, 30, 131, 101, 225, 90, 8, 156, 104, 214, 25, 0, 0, 0, 0, 0, 0, 10, 174, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 238, 87, 135, 110, 67, 215, 108, 228, 66, 226, 192, 37, 6, 193, 120, 186, 5, 214, 209, 16, 169, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 113, 1, 2, 0, 0, 3, 2, 0, 0, 5, 33, 2, 89, 251, 100, 20, 141, 129, 167, 164, 253, 12, 110, 225, 21, 14, 42, 17, 23, 170, 54, 168, 175, 191, 155, 92, 7, 230, 198, 17, 219, 93, 1, 98, 7, 32, 227, 238, 107, 153, 58, 23, 23, 190, 44, 19, 147, 84, 4, 108, 20, 65, 184, 73, 193, 61, 62, 208, 250, 205, 198, 250, 214, 79, 148, 156, 191, 174, 9, 0, 11, 32, 134, 110, 74, 49, 160, 200, 160, 145, 147, 82, 141, 56, 13, 26, 225, 152, 160, 215, 152, 117, 30, 242, 250, 8, 119, 235, 144, 54, 177, 235, 97, 60]
let serializedChannelMonitors: [[UInt8]] = []

let cmcParams = ChannelManagerConstructionParameters(
	config: config,
	entropySource: keysManager.asEntropySource(),
	nodeSigner: keysManager.asNodeSigner(),
	signerProvider: keysManager.asSignerProvider(),
	feeEstimator: feeEstimator,
	chainMonitor: chainMonitor,
	txBroadcaster: broadcaster,
	logger: logger
)

let channelManagerConstructor = try ChannelManagerConstructor(
	channelManagerSerialized: serializedChannelManager,
	channelMonitorsSerialized: serializedChannelMonitors,
	networkGraph: NetworkGraphArgument.instance(networkGraph),
	filter: filter,
	params: cmcParams
)

let channelManager = channelManagerConstructor.channelManager
```

### PeerHandler

Finally, let's get the peer handler. It has conveniently already been instantiated by the `ChannelManagerConstructor`.

```swift
// main context (continued)

let peerManager = channelManagerConstructor.peerManager
let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()
tcpPeerHandler.connect(address: "...", port: "...", theirNodeId: [..])
```
