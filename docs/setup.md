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
    
    override func log(record: UnsafePointer<Int8>?) {
        if let record = record {
            let string = Bindings.UnsafeIntPointer_to_string(nativeType: record)
            print("record: \(string)")
        }
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
    
    override func broadcast_transaction(tx: LDKTransaction) {
        let txBytes: [UInt8] = Bindings.LDKTransaction_to_array(nativeType: tx)
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
    
    override func persist_new_channel(id: LDKOutPoint, data: UnsafePointer<LDKChannelMonitor>) -> Result_NoneChannelMonitorUpdateErrZ {
        let outPoint = OutPoint(pointer: id)
        let idBytes: [UInt8] = outPoint.write(obj: outPoint)
        
        let channelMonitor = ChannelMonitor(pointer: data.pointee)
        let monitorBytes: [UInt8] = channelMonitor.write(obj: channelMonitor)
        
        // persist monitorBytes to disk, keyed by idBytes
        
        return Result_NoneChannelMonitorUpdateErrZ(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ())
    }
    
    override func update_persisted_channel(id: LDKOutPoint, update: UnsafePointer<LDKChannelMonitorUpdate>, data: UnsafePointer<LDKChannelMonitor>) -> Result_NoneChannelMonitorUpdateErrZ {
        let outPoint = OutPoint(pointer: id)
        let idBytes: [UInt8] = outPoint.write(obj: outPoint)
        
        let channelMonitor = ChannelMonitor(pointer: data.pointee)
        let monitorBytes: [UInt8] = channelMonitor.write(obj: channelMonitor)
        
        // modify persisted monitorBytes keyed by idBytes on disk
        
        return Result_NoneChannelMonitorUpdateErrZ(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ())
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
    override func register_tx(txid: UnsafePointer<(UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)>?, script_pubkey: LDKu8slice) {
        let txidBytes = Bindings.tuple32_to_array(nativeType: txid!.pointee)
        let scriptPubkeyBytes = Bindings.LDKu8slice_to_array(nativeType: script_pubkey)
        
        // watch this transaction on-chain
    }
    
    override func register_output(output: LDKWatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
        let watchedOutput = WatchedOutput(pointer: output)
        let scriptPubkeyBytes = watchedOutput.get_script_pubkey()
        let outpoint = watchedOutput.get_outpoint()
        let txidBytes = Bindings.tuple32_to_array(nativeType: outpoint.get_txid())
        let outputIndex = outpoint.get_index()
        
        // watch for any transactions that spend this output on-chain
        
        let blockHashBytes = watchedOutput.get_block_hash()
        // TODO: if block hash bytes are not null, return any transaction spending the output that is found in the corresponding block along with its index
        
        return Option_C2Tuple_usizeTransactionZZ(pointer: LDKCOption_C2Tuple_usizeTransactionZZ())
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
