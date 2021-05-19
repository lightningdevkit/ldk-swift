open class TraitName {

    public var cOpaqueStruct: TraitType?;

    public init() {

    	/* NATIVE_CALLBACKS_START */
		func methodNameCallback(pointer: UnsafeRawPointer?, native_arguments) -> Void {
			let instance: TraitName = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.callbackName(swift_callback_arguments);
		}
		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = TraitType(this_arg: Bindings.instanceToPointer(instance: self), native_callback_instantiation_arguments)
    }

    public init(pointer: TraitType){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */
    open func methodName(public_swift_argument_list) -> Void {
    	/* EDIT ME */
    }
    /* SWIFT_CALLBACKS_END */

}
