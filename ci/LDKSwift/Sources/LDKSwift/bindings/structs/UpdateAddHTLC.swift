#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias UpdateAddHTLC = Bindings.UpdateAddHTLC

extension Bindings {

	public class UpdateAddHTLC: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKUpdateAddHTLC?


		

		public init(pointer: LDKUpdateAddHTLC){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKUpdateAddHTLC, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_channel_id() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_get_channel_id(this_ptrPointer)
}.pointee);
		}

		public func set_channel_id(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateAddHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateAddHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
		}

		public func get_htlc_id() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_get_htlc_id(this_ptrPointer)
};
		}

		public func set_htlc_id(val: UInt64) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateAddHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateAddHTLC_set_htlc_id(this_ptrPointer, val);
		}

		public func get_amount_msat() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_get_amount_msat(this_ptrPointer)
};
		}

		public func set_amount_msat(val: UInt64) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateAddHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateAddHTLC_set_amount_msat(this_ptrPointer, val);
		}

		public func get_payment_hash() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_get_payment_hash(this_ptrPointer)
}.pointee);
		}

		public func set_payment_hash(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateAddHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateAddHTLC_set_payment_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
		}

		public func get_cltv_expiry() -> UInt32 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_get_cltv_expiry(this_ptrPointer)
};
		}

		public func set_cltv_expiry(val: UInt32) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateAddHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateAddHTLC_set_cltv_expiry(this_ptrPointer, val);
		}

		public func clone() -> UpdateAddHTLC {
			
			return UpdateAddHTLC(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_clone(origPointer)
});
		}

					internal func danglingClone() -> UpdateAddHTLC {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func eq(a: UpdateAddHTLC, b: UpdateAddHTLC) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKUpdateAddHTLC>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_eq(aPointer, bPointer)
}
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateAddHTLC>) in
UpdateAddHTLC_write(objPointer)
}, callerContext: "UpdateAddHTLC::write");
		}

		public class func read(ser: [UInt8]) -> Result_UpdateAddHTLCDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_UpdateAddHTLCDecodeErrorZ(pointer: UpdateAddHTLC_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return UpdateAddHTLC_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> UpdateAddHTLC {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing UpdateAddHTLC \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UpdateAddHTLC \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
