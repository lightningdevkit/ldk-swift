import LDKHeaders

open class Access {

    public var cOpaqueStruct: LDKAccess?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func get_utxoCallback(pointer: UnsafeRawPointer?, genesis_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, short_channel_id: UInt64) -> LDKCResult_TxOutAccessErrorZ {
			let instance: Access = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Access.swift::get_utxo")
			
								var genesis_hash: [UInt8]? = nil
								if let genesis_hashUnwrapped = genesis_hashPointer {
									genesis_hash = Bindings.tuple32_to_array(nativeType: genesis_hashUnwrapped.pointee)
								}
							
			return instance.get_utxo(genesis_hash: genesis_hash, short_channel_id: short_channel_id).cOpaqueStruct!;
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Access = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Access.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKAccess(this_arg: Bindings.instanceToPointer(instance: self), 
			get_utxo: get_utxoCallback,
			free: freeCallback)
    }

    public init(pointer: LDKAccess){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func get_utxo(genesis_hash: [UInt8]?, short_channel_id: UInt64) -> Result_TxOutAccessErrorZ {
    	/* EDIT ME */
		return Result_TxOutAccessErrorZ(pointer: LDKCResult_TxOutAccessErrorZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedAccess: Access {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_utxo(genesis_hash: [UInt8]?, short_channel_id: UInt64) -> Result_TxOutAccessErrorZ {
		
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: genesis_hash!)) { (genesis_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_TxOutAccessErrorZ(pointer: self.cOpaqueStruct!.get_utxo(self.cOpaqueStruct!.this_arg, genesis_hashPointer, short_channel_id))
				
}
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
