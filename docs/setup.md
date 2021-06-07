# Setup

This project is essentially a set of auto-generated decorators that call the C methods
defined in lightning.h. The wrappers for the most part take care of conveniences such
as conversion of Swift types into C types, and parsing C types back into Swift.

In Bindings.swift, there are various additional generic utility methods to aid the 
developer in passing data back and forth.

The greatest effort on the part of users of this project comes in when dealing with 
traits. All files located within `bindings/LDK/traits` are meant to be interpreted as
abstract classes. However, as Swift does not allow abstract classes, and using protocols
would shift both implementation and boilerplate burden on developers, I instead recommend
an override pattern, which I will describe in the next step.

This guide is essentially a conversion of the [Java guide](https://lightningdevkit.org/docs/build_node)
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

class MyFeeEstimator: FeeEstimator {
    
    override func get_est_sat_per_1000_weight(confirmation_target: LDKConfirmationTarget) -> UInt32 {
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

class MyLogger: Logger {
    
    override func log(record: String?) {
        print("record: \(record)")
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

class MyBroadcasterInterface: BroadcasterInterface {
    
    override func broadcast_transaction(tx: [UInt8]) {
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

class MyPersister: Persist {
    
    override func persist_new_channel(id: OutPoint, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
        let idBytes: [UInt8] = id.write(obj: id)
        let monitorBytes: [UInt8] = data.write(obj: data)
        
        // persist monitorBytes to disk, keyed by idBytes
        
        // simplified result instantiation calls coming shortly!
        return Result_NoneChannelMonitorUpdateErrZ()
    }
    
    override func update_persisted_channel(id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
        let idBytes: [UInt8] = id.write(obj: id)
        let monitorBytes: [UInt8] = data.write(obj: data)
        
        // modify persisted monitorBytes keyed by idBytes on disk
        
        // simplified result instantiation calls coming shortly!
        return Result_NoneChannelMonitorUpdateErrZ()
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

class MyFilter: Filter {
    
    override func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) {
        // watch this transaction on-chain
    }
    
    override func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
        let scriptPubkeyBytes = output.get_script_pubkey()
        let outpoint = output.get_outpoint()
        let txid = outpoint.get_txid()
        let outputIndex = outpoint.get_index()
        
        // watch for any transactions that spend this output on-chain
        
        let blockHashBytes = output.get_block_hash()
        // if block hash bytes are not null, return any transaction spending the output that is found in the corresponding block along with its index
        
        return Option_C2Tuple_usizeTransactionZZ(value: nil)
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

let chainMonitor = ChainMonitor.init(chain_source: filter, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: persister)
```

### KeysManager

```swift
// main context (continued)

var keyData = Data(count: 32)
keyData.withUnsafeMutableBytes {
	SecRandomCopyBytes(kSecRandomDefault, 32, $0.baseAddress!)
}
let seed = [UInt8](keyData)
let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
let timestamp_nanos = UInt32.init(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
let keysManager = KeysManager(seed: seed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)
```

We will keep needing to pass around a keysInterface instance, and we will also need to 
pass its node secret to the peer manager initialization, so let's prepare it right here:

```swift
let keysInterface = keysManager.as_KeysInterface()
let nodeSecret = self.keysInterface.get_node_secret()
```

This is a bit inelegant, but we will be providing simpler casting methods for user-provided types shortly.

### ChannelManager

To instantiate the channel manager, we need a couple minor prerequisites.

First, we need the current block height and hash. For the sake of this example, we'll just use
a random block at a height that does not exist at the time of this writing.

```swift
let bestBlock = BestBlock(block_hash: [UInt8](Data(base64Encoded: "AAAAAAAAAAAABe5Xh25D12zkQuLAJQbBeLoF1tEQqR8=")!), height: 700123)
let chainParameters = ChainParameters(network_arg: LDKNetwork_Bitcoin, best_block_arg: bestBlock)
```

Second, we also need to initialize a default user config, which we simply do like this:

```swift
let userConfig = UserConfig.init()
```

Finally, we can proceed by instantiating the ChannelManager.

```swift
// main context (continued)

let channelManager = ChannelManager.init(fee_est: feeEstimator, chain_monitor: chainMonitor.as_Watch(), tx_broadcaster: broadcaster, logger: logger, keys_manager: keysInterface, config: userConfig, params: chainParameters)
```

#### Serializing and restoring a ChannelManager

If you need to serialize a channel manager, you can simply call its write method on itself:

```swift
let serializedChannelManager: [UInt8] = channelManager.write(obj: channelManager)
```

If you have a channel manager you previously serialized, you can restore it like this:

```swift
let serialized_channel_manager: [UInt8] = [2, 1, 111, 226, 140, 10, 182, 241, 179, 114, 193, 166, 162, 70, 174, 99, 247, 79, 147, 30, 131, 101, 225, 90, 8, 156, 104, 214, 25, 0, 0, 0, 0, 0, 0, 10, 174, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 238, 87, 135, 110, 67, 215, 108, 228, 66, 226, 192, 37, 6, 193, 120, 186, 5, 214, 209, 16, 169, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] // <insert bytes you would have written in following the later step "Persist channel manager">
let serializedChannelMonitors: [[UInt8]] = []
let channel_manager_constructor = try ChannelManagerConstructor(channel_manager_serialized: serialized_channel_manager, channel_monitors_serialized: serializedChannelMonitors, keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, filter: filter, tx_broadcaster: broadcaster, logger: logger)

let channel_manager = channel_manager_constructor.channelManager;
```

### NetGraphMsgHandler

If you intend to use the LDK's built-in routing algorithm, you will need to instantiate
a graph message handler:

```swift
// main context (continued)

let networkGraph = NetworkGraph(genesis_hash: [UInt8](Data(base64Encoded: "AAAAAAAZ1micCFrhZYMek0/3Y65GoqbBcrPxtgqM4m8=")!))
let router = NetGraphMsgHandler(chain_access: nil, logger: logger, network_graph: networkGraph)
```

Note that a network graph instance needs to be provided upon initialization, which in turn requires the genesis block hash.

### PeerHandler

Finally, let's instantiate the peer handler. It requires a seed for ephemeral key generation,
as well as a hybrid message handler for routing and channel events.

Let's first set up the seed:

```swift
var keyData2 = Data(count: 32)
keyData2.withUnsafeMutableBytes {
	SecRandomCopyBytes(kSecRandomDefault, 32, $0.baseAddress!)
}
let peerManagerSeed = [UInt8](keyData2)
```

Next, let's prepare the combined message handler:

```swift
let messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: router.as_RoutingMessageHandler())
```

And finally, let's instantiate the peer manager itself:

```swift
// main context (continued)

let peerManager = PeerManager(message_handler: messageHandler, our_node_secret: nodeSecret, ephemeral_random_data: peerManagerSeed, logger: logger)
```

Now, all that remains is setting up the actual syscalls that are necessary within
the host environment, and route them to the appropriate LDK objects.
