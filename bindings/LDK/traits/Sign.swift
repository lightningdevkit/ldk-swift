open class Sign {

    public var cOpaqueStruct: LDKSign?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			
			return Bindings.new_LDKCVec_u8Z(array: instance.write());
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer? {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.clone();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKSign(this_arg: Bindings.instanceToPointer(instance: self), 
			BaseSign: LDKBaseSign(),
			BaseSign_clone: nil,
			write: writeCallback,
			clone: cloneCallback,
			free: freeCallback)
    }

    public init(pointer: LDKSign){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func write() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func clone() -> UnsafeMutableRawPointer {
    	/* EDIT ME */
		return UnsafeMutableRawPointer(bitPattern: 0)!
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedSign: Sign {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func write() -> [UInt8] {
		
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.write(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
