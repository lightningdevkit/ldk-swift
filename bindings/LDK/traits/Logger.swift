class Logger {

    var cOpaqueStruct: LDKLogger?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func logCallback(pointer: UnsafeRawPointer?, record: UnsafePointer<UnsafePointer<Int8>>) -> Void {
			let instance: Logger = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.log(record: record);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Logger = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKLogger(this_arg: Bindings.instanceToPointer(instance: self), log: logCallback,
			free: freeCallback)
    }

    init(pointer: LDKLogger){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func log(record: UnsafePointer<UnsafePointer<Int8>>) -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}
