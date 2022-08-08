#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias NodeFeatures = Bindings.NodeFeatures

extension Bindings {

	public class NodeFeatures: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKNodeFeatures?


		/* DEFAULT_CONSTRUCTOR_START */
		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = NodeFeatures_known()
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKNodeFeatures){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKNodeFeatures, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public class func eq(a: NodeFeatures, b: NodeFeatures) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKNodeFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_eq(aPointer, bPointer)
}
};
		}

		public func clone() -> NodeFeatures {
			
			return NodeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_clone(origPointer)
});
		}

					internal func danglingClone() -> NodeFeatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func requires_unknown_bits() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_unknown_bits(this_argPointer)
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_NodeFeaturesDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_NodeFeaturesDecodeErrorZ(pointer: NodeFeatures_read(serWrapper.cOpaqueStruct!));
		}

		public func set_data_loss_protect_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_data_loss_protect_optional(this_argPointer);
		}

		public func set_data_loss_protect_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_data_loss_protect_required(this_argPointer);
		}

		public func supports_data_loss_protect() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_data_loss_protect(this_argPointer)
};
		}

		public func requires_data_loss_protect() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_data_loss_protect(this_argPointer)
};
		}

		public func set_upfront_shutdown_script_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_upfront_shutdown_script_optional(this_argPointer);
		}

		public func set_upfront_shutdown_script_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_upfront_shutdown_script_required(this_argPointer);
		}

		public func supports_upfront_shutdown_script() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_upfront_shutdown_script(this_argPointer)
};
		}

		public func requires_upfront_shutdown_script() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_upfront_shutdown_script(this_argPointer)
};
		}

		public func set_gossip_queries_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_gossip_queries_optional(this_argPointer);
		}

		public func set_gossip_queries_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_gossip_queries_required(this_argPointer);
		}

		public func supports_gossip_queries() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_gossip_queries(this_argPointer)
};
		}

		public func requires_gossip_queries() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_gossip_queries(this_argPointer)
};
		}

		public func set_variable_length_onion_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_variable_length_onion_optional(this_argPointer);
		}

		public func set_variable_length_onion_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_variable_length_onion_required(this_argPointer);
		}

		public func supports_variable_length_onion() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_variable_length_onion(this_argPointer)
};
		}

		public func requires_variable_length_onion() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_variable_length_onion(this_argPointer)
};
		}

		public func set_static_remote_key_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_static_remote_key_optional(this_argPointer);
		}

		public func set_static_remote_key_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_static_remote_key_required(this_argPointer);
		}

		public func supports_static_remote_key() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_static_remote_key(this_argPointer)
};
		}

		public func requires_static_remote_key() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_static_remote_key(this_argPointer)
};
		}

		public func set_payment_secret_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_payment_secret_optional(this_argPointer);
		}

		public func set_payment_secret_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_payment_secret_required(this_argPointer);
		}

		public func supports_payment_secret() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_payment_secret(this_argPointer)
};
		}

		public func requires_payment_secret() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_payment_secret(this_argPointer)
};
		}

		public func set_basic_mpp_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_basic_mpp_optional(this_argPointer);
		}

		public func set_basic_mpp_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_basic_mpp_required(this_argPointer);
		}

		public func supports_basic_mpp() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_basic_mpp(this_argPointer)
};
		}

		public func requires_basic_mpp() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_basic_mpp(this_argPointer)
};
		}

		public func set_wumbo_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_wumbo_optional(this_argPointer);
		}

		public func set_wumbo_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_wumbo_required(this_argPointer);
		}

		public func supports_wumbo() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_wumbo(this_argPointer)
};
		}

		public func requires_wumbo() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_wumbo(this_argPointer)
};
		}

		public func set_shutdown_any_segwit_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_shutdown_any_segwit_optional(this_argPointer);
		}

		public func set_shutdown_any_segwit_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_shutdown_any_segwit_required(this_argPointer);
		}

		public func supports_shutdown_anysegwit() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_shutdown_anysegwit(this_argPointer)
};
		}

		public func requires_shutdown_anysegwit() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_shutdown_anysegwit(this_argPointer)
};
		}

		public func set_channel_type_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_channel_type_optional(this_argPointer);
		}

		public func set_channel_type_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_channel_type_required(this_argPointer);
		}

		public func supports_channel_type() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_channel_type(this_argPointer)
};
		}

		public func requires_channel_type() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_channel_type(this_argPointer)
};
		}

		public func set_scid_privacy_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_scid_privacy_optional(this_argPointer);
		}

		public func set_scid_privacy_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_scid_privacy_required(this_argPointer);
		}

		public func supports_scid_privacy() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_scid_privacy(this_argPointer)
};
		}

		public func requires_scid_privacy() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_scid_privacy(this_argPointer)
};
		}

		public func set_zero_conf_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_zero_conf_optional(this_argPointer);
		}

		public func set_zero_conf_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_zero_conf_required(this_argPointer);
		}

		public func supports_zero_conf() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_zero_conf(this_argPointer)
};
		}

		public func requires_zero_conf() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_zero_conf(this_argPointer)
};
		}

		public func set_keysend_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_keysend_optional(this_argPointer);
		}

		public func set_keysend_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKNodeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return NodeFeatures_set_keysend_required(this_argPointer);
		}

		public func supports_keysend() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_keysend(this_argPointer)
};
		}

		public func requires_keysend() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_requires_keysend(this_argPointer)
};
		}

		internal func free() -> Void {
			
			return NodeFeatures_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> NodeFeatures {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeFeatures \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
