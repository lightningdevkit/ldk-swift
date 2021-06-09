open class FeeEstimator {

    public var cOpaqueStruct: LDKFeeEstimator?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func get_est_sat_per_1000_weightCallback(pointer: UnsafeRawPointer?, confirmation_target: LDKConfirmationTarget) -> UInt32 {
			let instance: FeeEstimator = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "FeeEstimator.swift::get_est_sat_per_1000_weight")
			
			return instance.get_est_sat_per_1000_weight(confirmation_target: confirmation_target);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: FeeEstimator = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "FeeEstimator.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKFeeEstimator(this_arg: Bindings.instanceToPointer(instance: self), 
			get_est_sat_per_1000_weight: get_est_sat_per_1000_weightCallback,
			free: freeCallback)
    }

    public init(pointer: LDKFeeEstimator){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func get_est_sat_per_1000_weight(confirmation_target: LDKConfirmationTarget) -> UInt32 {
    	/* EDIT ME */
		return 0
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedFeeEstimator: FeeEstimator {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_est_sat_per_1000_weight(confirmation_target: LDKConfirmationTarget) -> UInt32 {
		
				return 
				self.cOpaqueStruct!.get_est_sat_per_1000_weight(self.cOpaqueStruct!.this_arg, confirmation_target)
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
