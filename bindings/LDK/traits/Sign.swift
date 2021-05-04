class Sign {

    var cOpaqueStruct: LDKSign?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.write();
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.clone();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKSign(this_arg: Bindings.instanceToPointer(instance: self), BaseSign: LDKBaseSign(),
			write: writeCallback,
			clone: cloneCallback,
			free: freeCallback)
    }

    init(pointer: LDKSign){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func write() -> Void {
    	/* EDIT ME */
    }

    func clone() -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}
