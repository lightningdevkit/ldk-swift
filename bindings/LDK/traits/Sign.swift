class Sign {

    var cOpaqueStruct: LDKSign?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return Bindings.new_LDKCVec_u8Z(array: instance.write());
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.clone();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKSign(this_arg: Bindings.instanceToPointer(instance: self), 
			BaseSign: LDKBaseSign(),
			write: writeCallback,
			clone: cloneCallback,
			free: freeCallback)
    }

    init(pointer: LDKSign){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func write() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    func clone() -> UnsafeMutableRawPointer {
    	/* EDIT ME */
		return UnsafeMutableRawPointer(bitPattern: 0)!
    }

    func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
