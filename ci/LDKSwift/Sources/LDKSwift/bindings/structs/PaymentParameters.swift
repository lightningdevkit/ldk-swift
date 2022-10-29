#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias PaymentParameters = Bindings.PaymentParameters

extension Bindings {

	public class PaymentParameters: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKPaymentParameters?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(payee_pubkey: [UInt8]) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = PaymentParameters_for_keysend(Bindings.new_LDKPublicKey(array: payee_pubkey))
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKPaymentParameters){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKPaymentParameters, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_payee_pubkey() -> [UInt8] {
			
			return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_payee_pubkey(this_ptrPointer)
});
		}

		public func set_payee_pubkey(val: [UInt8]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return PaymentParameters_set_payee_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
		}

		public func get_features() -> InvoiceFeatures {
			
			return InvoiceFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_features(this_ptrPointer)
});
		}

		public func set_features(val: InvoiceFeatures) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return PaymentParameters_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
		}

		public func get_route_hints() -> [RouteHint] {
			
			return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_route_hints(this_ptrPointer)
}, callerContext: "PaymentParameters::get_route_hints", deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHint(pointer: cOpaqueStruct)
						}
					;
		}

		public func set_route_hints(val: [RouteHint]) -> Void {
			
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
			return self.set_route_hints(val: valUnwrapped);
		}

		internal func set_route_hints(val: [LDKRouteHint]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_RouteHintZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
			return PaymentParameters_set_route_hints(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
		}

		public func get_expiry_time() -> Option_u64Z {
			
			return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_expiry_time(this_ptrPointer)
});
		}

		public func set_expiry_time(val: Option_u64Z) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return PaymentParameters_set_expiry_time(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
		}

		public func get_max_total_cltv_expiry_delta() -> UInt32 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_max_total_cltv_expiry_delta(this_ptrPointer)
};
		}

		public func set_max_total_cltv_expiry_delta(val: UInt32) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return PaymentParameters_set_max_total_cltv_expiry_delta(this_ptrPointer, val);
		}

		public func get_max_path_count() -> UInt8 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_max_path_count(this_ptrPointer)
};
		}

		public func set_max_path_count(val: UInt8) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return PaymentParameters_set_max_path_count(this_ptrPointer, val);
		}

		public func get_max_channel_saturation_power_of_half() -> UInt8 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_max_channel_saturation_power_of_half(this_ptrPointer)
};
		}

		public func set_max_channel_saturation_power_of_half(val: UInt8) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return PaymentParameters_set_max_channel_saturation_power_of_half(this_ptrPointer, val);
		}

		public func get_previously_failed_channels() -> [UInt64] {
			
			return Bindings.LDKCVec_u64Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_get_previously_failed_channels(this_ptrPointer)
}, callerContext: "PaymentParameters::get_previously_failed_channels");
		}

		public func set_previously_failed_channels(val: [UInt64]) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKPaymentParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_u64ZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
			return PaymentParameters_set_previously_failed_channels(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
		}

		public func clone() -> PaymentParameters {
			
			return PaymentParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_clone(origPointer)
});
		}

					internal func danglingClone() -> PaymentParameters {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func hash() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_hash(oPointer)
};
		}

		public class func eq(a: PaymentParameters, b: PaymentParameters) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPaymentParameters>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_eq(aPointer, bPointer)
}
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPaymentParameters>) in
PaymentParameters_write(objPointer)
}, callerContext: "PaymentParameters::write");
		}

		public class func read(ser: [UInt8]) -> Result_PaymentParametersDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_PaymentParametersDecodeErrorZ(pointer: PaymentParameters_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return PaymentParameters_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> PaymentParameters {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing PaymentParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PaymentParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
