#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias UpdateFailHTLC = Bindings.UpdateFailHTLC

extension Bindings {

	public class UpdateFailHTLC: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKUpdateFailHTLC?


		

		public init(pointer: LDKUpdateFailHTLC){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKUpdateFailHTLC, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_channel_id() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_get_channel_id(this_ptrPointer)
}.pointee);
		}

		public func set_channel_id(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateFailHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
		}

		public func get_htlc_id() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_get_htlc_id(this_ptrPointer)
};
		}

		public func set_htlc_id(val: UInt64) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return UpdateFailHTLC_set_htlc_id(this_ptrPointer, val);
		}

		public func clone() -> UpdateFailHTLC {
			
			return UpdateFailHTLC(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_clone(origPointer)
});
		}

					internal func danglingClone() -> UpdateFailHTLC {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func eq(a: UpdateFailHTLC, b: UpdateFailHTLC) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKUpdateFailHTLC>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_eq(aPointer, bPointer)
}
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_write(objPointer)
}, callerContext: "UpdateFailHTLC::write");
		}

		public class func read(ser: [UInt8]) -> Result_UpdateFailHTLCDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_UpdateFailHTLCDecodeErrorZ(pointer: UpdateFailHTLC_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return UpdateFailHTLC_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> UpdateFailHTLC {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing UpdateFailHTLC \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UpdateFailHTLC \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
