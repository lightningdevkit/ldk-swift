open class Filter {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKFilter?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func register_txCallback(pointer: UnsafeRawPointer?, txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, script_pubkey: LDKu8slice) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Filter.swift::register_tx")
			
								var txid: [UInt8]? = nil
								if let txidUnwrapped = txidPointer {
									txid = Bindings.tuple32_to_array(nativeType: txidUnwrapped.pointee)
								}
							
			return instance.register_tx(txid: txid, script_pubkey: Bindings.LDKu8slice_to_array(nativeType: script_pubkey))
		}

		func register_outputCallback(pointer: UnsafeRawPointer?, output: LDKWatchedOutput) -> LDKCOption_C2Tuple_usizeTransactionZZ {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Filter.swift::register_output")
			
			return instance.register_output(output: WatchedOutput(pointer: output)).cOpaqueStruct!
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Filter.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKFilter(this_arg: Bindings.instanceToPointer(instance: self), 
			register_tx: register_txCallback,
			register_output: register_outputCallback,
			free: freeCallback)
    }

    public init(pointer: LDKFilter){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKFilter, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Filter {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Filter \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Filter \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) -> Void {
    	/* EDIT ME */
		
    }

    open func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
    	/* EDIT ME */
		return Option_C2Tuple_usizeTransactionZZ(pointer: LDKCOption_C2Tuple_usizeTransactionZZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedFilter: Filter {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) -> Void {
		
				withUnsafePointer(to: Bindings.array_to_tuple32(array: txid!)) { (txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.register_tx(self.cOpaqueStruct!.this_arg, txidPointer, Bindings.new_LDKu8slice(array: script_pubkey).cOpaqueStruct!)
				
}
			
	}

	public override func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
		
				return 
				Option_C2Tuple_usizeTransactionZZ(pointer: self.cOpaqueStruct!.register_output(self.cOpaqueStruct!.this_arg, output.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
