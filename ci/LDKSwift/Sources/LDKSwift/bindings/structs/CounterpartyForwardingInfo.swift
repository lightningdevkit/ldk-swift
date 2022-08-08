#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias CounterpartyForwardingInfo = Bindings.CounterpartyForwardingInfo

extension Bindings {

	public class CounterpartyForwardingInfo: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCounterpartyForwardingInfo?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(fee_base_msat_arg: UInt32, fee_proportional_millionths_arg: UInt32, cltv_expiry_delta_arg: UInt16) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = CounterpartyForwardingInfo_new(fee_base_msat_arg, fee_proportional_millionths_arg, cltv_expiry_delta_arg)
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCounterpartyForwardingInfo){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCounterpartyForwardingInfo, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_fee_base_msat() -> UInt32 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
CounterpartyForwardingInfo_get_fee_base_msat(this_ptrPointer)
};
		}

		public func set_fee_base_msat(val: UInt32) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKCounterpartyForwardingInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return CounterpartyForwardingInfo_set_fee_base_msat(this_ptrPointer, val);
		}

		public func get_fee_proportional_millionths() -> UInt32 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
CounterpartyForwardingInfo_get_fee_proportional_millionths(this_ptrPointer)
};
		}

		public func set_fee_proportional_millionths(val: UInt32) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKCounterpartyForwardingInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return CounterpartyForwardingInfo_set_fee_proportional_millionths(this_ptrPointer, val);
		}

		public func get_cltv_expiry_delta() -> UInt16 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
CounterpartyForwardingInfo_get_cltv_expiry_delta(this_ptrPointer)
};
		}

		public func set_cltv_expiry_delta(val: UInt16) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKCounterpartyForwardingInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return CounterpartyForwardingInfo_set_cltv_expiry_delta(this_ptrPointer, val);
		}

		public func clone() -> CounterpartyForwardingInfo {
			
			return CounterpartyForwardingInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
CounterpartyForwardingInfo_clone(origPointer)
});
		}

					internal func danglingClone() -> CounterpartyForwardingInfo {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
CounterpartyForwardingInfo_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_CounterpartyForwardingInfoDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_CounterpartyForwardingInfoDecodeErrorZ(pointer: CounterpartyForwardingInfo_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CounterpartyForwardingInfo_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> CounterpartyForwardingInfo {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CounterpartyForwardingInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CounterpartyForwardingInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
