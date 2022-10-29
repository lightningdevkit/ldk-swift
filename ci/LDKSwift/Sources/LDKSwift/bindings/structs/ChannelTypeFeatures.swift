#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ChannelTypeFeatures = Bindings.ChannelTypeFeatures

extension Bindings {

	public class ChannelTypeFeatures: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKChannelTypeFeatures?


		/* DEFAULT_CONSTRUCTOR_START */
		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = ChannelTypeFeatures_empty()
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKChannelTypeFeatures){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKChannelTypeFeatures, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public class func eq(a: ChannelTypeFeatures, b: ChannelTypeFeatures) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKChannelTypeFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_eq(aPointer, bPointer)
}
};
		}

		public func clone() -> ChannelTypeFeatures {
			
			return ChannelTypeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_clone(origPointer)
});
		}

					internal func danglingClone() -> ChannelTypeFeatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func requires_unknown_bits() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_requires_unknown_bits(this_argPointer)
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_write(objPointer)
}, callerContext: "ChannelTypeFeatures::write");
		}

		public class func read(ser: [UInt8]) -> Result_ChannelTypeFeaturesDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_ChannelTypeFeaturesDecodeErrorZ(pointer: ChannelTypeFeatures_read(serWrapper.cOpaqueStruct!));
		}

		public func set_static_remote_key_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKChannelTypeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelTypeFeatures_set_static_remote_key_optional(this_argPointer);
		}

		public func set_static_remote_key_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKChannelTypeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelTypeFeatures_set_static_remote_key_required(this_argPointer);
		}

		public func supports_static_remote_key() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_supports_static_remote_key(this_argPointer)
};
		}

		public func requires_static_remote_key() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_requires_static_remote_key(this_argPointer)
};
		}

		public func set_scid_privacy_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKChannelTypeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelTypeFeatures_set_scid_privacy_optional(this_argPointer);
		}

		public func set_scid_privacy_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKChannelTypeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelTypeFeatures_set_scid_privacy_required(this_argPointer);
		}

		public func supports_scid_privacy() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_supports_scid_privacy(this_argPointer)
};
		}

		public func requires_scid_privacy() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_requires_scid_privacy(this_argPointer)
};
		}

		public func set_zero_conf_optional() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKChannelTypeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelTypeFeatures_set_zero_conf_optional(this_argPointer);
		}

		public func set_zero_conf_required() -> Void {
			
							let this_argPointer = UnsafeMutablePointer<LDKChannelTypeFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelTypeFeatures_set_zero_conf_required(this_argPointer);
		}

		public func supports_zero_conf() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_supports_zero_conf(this_argPointer)
};
		}

		public func requires_zero_conf() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTypeFeatures>) in
ChannelTypeFeatures_requires_zero_conf(this_argPointer)
};
		}

		internal func free() -> Void {
			
			return ChannelTypeFeatures_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ChannelTypeFeatures {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelTypeFeatures \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelTypeFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
