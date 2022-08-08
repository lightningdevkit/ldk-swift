#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias InitFeatures = Bindings.InitFeatures

extension Bindings {

	public class InitFeatures: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKInitFeatures?


		/* DEFAULT_CONSTRUCTOR_START */
		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = InitFeatures_known()
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKInitFeatures){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKInitFeatures, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public class func eq(a: InitFeatures, b: InitFeatures) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKInitFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_eq(aPointer, bPointer)
}
};
		}

		public func clone() -> InitFeatures {
			
			return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_clone(origPointer)
});
		}

					internal func danglingClone() -> InitFeatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func requires_unknown_bits() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_unknown_bits(this_argPointer)
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_InitFeaturesDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_InitFeaturesDecodeErrorZ(pointer: InitFeatures_read(serWrapper.cOpaqueStruct!));
		}

		public func set_data_loss_protect_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_data_loss_protect_optional(this_argPointer);
		}

		public func set_data_loss_protect_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_data_loss_protect_required(this_argPointer);
		}

		public func supports_data_loss_protect() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_data_loss_protect(this_argPointer)
};
		}

		public func requires_data_loss_protect() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_data_loss_protect(this_argPointer)
};
		}

		public func set_initial_routing_sync_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_initial_routing_sync_optional(this_argPointer);
		}

		public func set_initial_routing_sync_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_initial_routing_sync_required(this_argPointer);
		}

		public func initial_routing_sync() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_initial_routing_sync(this_argPointer)
};
		}

		public func set_upfront_shutdown_script_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_upfront_shutdown_script_optional(this_argPointer);
		}

		public func set_upfront_shutdown_script_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_upfront_shutdown_script_required(this_argPointer);
		}

		public func supports_upfront_shutdown_script() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_upfront_shutdown_script(this_argPointer)
};
		}

		public func requires_upfront_shutdown_script() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_upfront_shutdown_script(this_argPointer)
};
		}

		public func set_gossip_queries_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_gossip_queries_optional(this_argPointer);
		}

		public func set_gossip_queries_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_gossip_queries_required(this_argPointer);
		}

		public func supports_gossip_queries() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_gossip_queries(this_argPointer)
};
		}

		public func requires_gossip_queries() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_gossip_queries(this_argPointer)
};
		}

		public func set_variable_length_onion_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_variable_length_onion_optional(this_argPointer);
		}

		public func set_variable_length_onion_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_variable_length_onion_required(this_argPointer);
		}

		public func supports_variable_length_onion() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_variable_length_onion(this_argPointer)
};
		}

		public func requires_variable_length_onion() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_variable_length_onion(this_argPointer)
};
		}

		public func set_static_remote_key_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_static_remote_key_optional(this_argPointer);
		}

		public func set_static_remote_key_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_static_remote_key_required(this_argPointer);
		}

		public func supports_static_remote_key() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_static_remote_key(this_argPointer)
};
		}

		public func requires_static_remote_key() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_static_remote_key(this_argPointer)
};
		}

		public func set_payment_secret_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_payment_secret_optional(this_argPointer);
		}

		public func set_payment_secret_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_payment_secret_required(this_argPointer);
		}

		public func supports_payment_secret() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_payment_secret(this_argPointer)
};
		}

		public func requires_payment_secret() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_payment_secret(this_argPointer)
};
		}

		public func set_basic_mpp_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_basic_mpp_optional(this_argPointer);
		}

		public func set_basic_mpp_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_basic_mpp_required(this_argPointer);
		}

		public func supports_basic_mpp() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_basic_mpp(this_argPointer)
};
		}

		public func requires_basic_mpp() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_basic_mpp(this_argPointer)
};
		}

		public func set_wumbo_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_wumbo_optional(this_argPointer);
		}

		public func set_wumbo_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_wumbo_required(this_argPointer);
		}

		public func supports_wumbo() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_wumbo(this_argPointer)
};
		}

		public func requires_wumbo() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_wumbo(this_argPointer)
};
		}

		public func set_shutdown_any_segwit_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_shutdown_any_segwit_optional(this_argPointer);
		}

		public func set_shutdown_any_segwit_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_shutdown_any_segwit_required(this_argPointer);
		}

		public func supports_shutdown_anysegwit() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_shutdown_anysegwit(this_argPointer)
};
		}

		public func requires_shutdown_anysegwit() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_shutdown_anysegwit(this_argPointer)
};
		}

		public func set_channel_type_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_channel_type_optional(this_argPointer);
		}

		public func set_channel_type_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_channel_type_required(this_argPointer);
		}

		public func supports_channel_type() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_channel_type(this_argPointer)
};
		}

		public func requires_channel_type() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_channel_type(this_argPointer)
};
		}

		public func set_scid_privacy_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_scid_privacy_optional(this_argPointer);
		}

		public func set_scid_privacy_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_scid_privacy_required(this_argPointer);
		}

		public func supports_scid_privacy() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_scid_privacy(this_argPointer)
};
		}

		public func requires_scid_privacy() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_scid_privacy(this_argPointer)
};
		}

		public func set_zero_conf_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_zero_conf_optional(this_argPointer);
		}

		public func set_zero_conf_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKInitFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return InitFeatures_set_zero_conf_required(this_argPointer);
		}

		public func supports_zero_conf() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_zero_conf(this_argPointer)
};
		}

		public func requires_zero_conf() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_requires_zero_conf(this_argPointer)
};
		}

		internal func free() -> Void {
			
			return InitFeatures_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> InitFeatures {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing InitFeatures \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InitFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
