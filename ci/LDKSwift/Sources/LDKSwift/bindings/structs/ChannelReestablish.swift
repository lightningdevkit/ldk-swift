#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ChannelReestablish = Bindings.ChannelReestablish

extension Bindings {

	public class ChannelReestablish: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKChannelReestablish?


		

		public init(pointer: LDKChannelReestablish){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKChannelReestablish, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_channel_id() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_channel_id(this_ptrPointer)
}.pointee);
		}

		public func set_channel_id(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelReestablish>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelReestablish_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
		}

		public func get_next_local_commitment_number() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_next_local_commitment_number(this_ptrPointer)
};
		}

		public func set_next_local_commitment_number(val: UInt64) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelReestablish>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelReestablish_set_next_local_commitment_number(this_ptrPointer, val);
		}

		public func get_next_remote_commitment_number() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_next_remote_commitment_number(this_ptrPointer)
};
		}

		public func set_next_remote_commitment_number(val: UInt64) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelReestablish>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return ChannelReestablish_set_next_remote_commitment_number(this_ptrPointer, val);
		}

		public func clone() -> ChannelReestablish {
			
			return ChannelReestablish(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_clone(origPointer)
});
		}

					internal func danglingClone() -> ChannelReestablish {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_ChannelReestablishDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_ChannelReestablishDecodeErrorZ(pointer: ChannelReestablish_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return ChannelReestablish_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ChannelReestablish {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelReestablish \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelReestablish \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
