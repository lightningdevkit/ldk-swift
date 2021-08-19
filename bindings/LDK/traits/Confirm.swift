open class Confirm {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKConfirm?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func transactions_confirmedCallback(pointer: UnsafeRawPointer?, headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Confirm.swift::transactions_confirmed")
			
								var header: [UInt8]? = nil
								if let headerUnwrapped = headerPointer {
									header = Bindings.tuple80_to_array(nativeType: headerUnwrapped.pointee)
								}
							
			return instance.transactions_confirmed(header: header, txdata: Bindings.LDKCVec_C2Tuple_usizeTransactionZZ_to_array(nativeType: txdata), height: height)
		}

		func transaction_unconfirmedCallback(pointer: UnsafeRawPointer?, txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Confirm.swift::transaction_unconfirmed")
			
								var txid: [UInt8]? = nil
								if let txidUnwrapped = txidPointer {
									txid = Bindings.tuple32_to_array(nativeType: txidUnwrapped.pointee)
								}
							
			return instance.transaction_unconfirmed(txid: txid)
		}

		func best_block_updatedCallback(pointer: UnsafeRawPointer?, headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, height: UInt32) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Confirm.swift::best_block_updated")
			
								var header: [UInt8]? = nil
								if let headerUnwrapped = headerPointer {
									header = Bindings.tuple80_to_array(nativeType: headerUnwrapped.pointee)
								}
							
			return instance.best_block_updated(header: header, height: height)
		}

		func get_relevant_txidsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_TxidZ {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Confirm.swift::get_relevant_txids")
			
			
					let returnWrapper = Bindings.new_LDKCVec_TxidZWrapper(array: instance.get_relevant_txids())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.cOpaqueStruct!
				
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Confirm.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKConfirm(this_arg: Bindings.instanceToPointer(instance: self), 
			transactions_confirmed: transactions_confirmedCallback,
			transaction_unconfirmed: transaction_unconfirmedCallback,
			best_block_updated: best_block_updatedCallback,
			get_relevant_txids: get_relevant_txidsCallback,
			free: freeCallback)
    }

    public init(pointer: LDKConfirm){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKConfirm, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Confirm {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Confirm \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Confirm \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func transactions_confirmed(header: [UInt8]?, txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32) -> Void {
    	/* EDIT ME */
		
    }

    open func transaction_unconfirmed(txid: [UInt8]?) -> Void {
    	/* EDIT ME */
		
    }

    open func best_block_updated(header: [UInt8]?, height: UInt32) -> Void {
    	/* EDIT ME */
		
    }

    open func get_relevant_txids() -> [LDKTxid] {
    	/* EDIT ME */
		return [LDKTxid]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedConfirm: Confirm {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func transactions_confirmed(header: [UInt8]?, txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32) -> Void {
		
				withUnsafePointer(to: Bindings.array_to_tuple80(array: header!)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.transactions_confirmed(self.cOpaqueStruct!.this_arg, headerPointer, txdataWrapper.cOpaqueStruct!, height)
				
}
			
	}

	public override func transaction_unconfirmed(txid: [UInt8]?) -> Void {
		
				withUnsafePointer(to: Bindings.array_to_tuple32(array: txid!)) { (txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.transaction_unconfirmed(self.cOpaqueStruct!.this_arg, txidPointer)
				
}
			
	}

	public override func best_block_updated(header: [UInt8]?, height: UInt32) -> Void {
		
				withUnsafePointer(to: Bindings.array_to_tuple80(array: header!)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				self.cOpaqueStruct!.best_block_updated(self.cOpaqueStruct!.this_arg, headerPointer, height)
				
}
			
	}

	public override func get_relevant_txids() -> [LDKTxid] {
		
				return 
				Bindings.LDKCVec_TxidZ_to_array(nativeType: self.cOpaqueStruct!.get_relevant_txids(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
