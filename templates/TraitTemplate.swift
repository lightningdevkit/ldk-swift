class TraitName {

    var cTrait: TraitType?;

    init() {

    	/* NATIVE_CALLBACKS_START */
		func methodNameCallback(pointer: UnsafeRawPointer?, native_arguments) -> Void {
			let instance: TraitName = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.callbackName(swift_callback_arguments);
		}
		/* NATIVE_CALLBACKS_END */

        self.cTrait = TraitType(this_arg: Bindings.instanceToPointer(instance: self), native_callback_instantiation_arguments)
    }

    /* SWIFT_CALLBACKS_START */
    func methodName(swift_arguments) -> Void {
    	/* EDIT ME */
    }
    /* SWIFT_CALLBACKS_END */

}
