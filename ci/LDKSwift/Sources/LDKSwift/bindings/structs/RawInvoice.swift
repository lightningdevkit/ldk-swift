#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias RawInvoice = Bindings.RawInvoice

extension Bindings {

	public class RawInvoice: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKRawInvoice?


		

		public init(pointer: LDKRawInvoice){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKRawInvoice, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_data() -> RawDataPart {
			
			return RawDataPart(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_get_data(this_ptrPointer)
});
		}

		public func set_data(val: RawDataPart) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKRawInvoice>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return RawInvoice_set_data(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
		}

		public class func eq(a: RawInvoice, b: RawInvoice) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRawInvoice>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_eq(aPointer, bPointer)
}
};
		}

		public func clone() -> RawInvoice {
			
			return RawInvoice(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_clone(origPointer)
});
		}

					internal func danglingClone() -> RawInvoice {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func hash() -> [UInt8] {
			
			return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_hash(this_argPointer)
});
		}

		public func payment_hash() -> Sha256 {
			
			return Sha256(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payment_hash(this_argPointer)
});
		}

		public func description() -> Description {
			
			return Description(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_description(this_argPointer)
});
		}

		public func payee_pub_key() -> PayeePubKey {
			
			return PayeePubKey(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payee_pub_key(this_argPointer)
});
		}

		public func description_hash() -> Sha256 {
			
			return Sha256(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_description_hash(this_argPointer)
});
		}

		public func expiry_time() -> ExpiryTime {
			
			return ExpiryTime(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_expiry_time(this_argPointer)
});
		}

		public func min_final_cltv_expiry() -> MinFinalCltvExpiry {
			
			return MinFinalCltvExpiry(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_min_final_cltv_expiry(this_argPointer)
});
		}

		public func payment_secret() -> [UInt8] {
			
			return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payment_secret(this_argPointer)
});
		}

		public func features() -> InvoiceFeatures {
			
			return InvoiceFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_features(this_argPointer)
});
		}

		public func private_routes() -> [PrivateRoute] {
			
			return Bindings.LDKCVec_PrivateRouteZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_private_routes(this_argPointer)
})
						
						.map { (cOpaqueStruct) in
							PrivateRoute(pointer: cOpaqueStruct)
						}
					;
		}

		public func amount_pico_btc() -> Option_u64Z {
			
			return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_amount_pico_btc(this_argPointer)
});
		}

		public func currency() -> LDKCurrency {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_currency(this_argPointer)
};
		}

		internal func free() -> Void {
			
			return RawInvoice_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> RawInvoice {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing RawInvoice \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RawInvoice \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
