#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Invoice = Bindings.Invoice

extension Bindings {

	public class Invoice: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKInvoice?


		

		public init(pointer: LDKInvoice){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKInvoice, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public class func eq(a: Invoice, b: Invoice) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKInvoice>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKInvoice>) in
Invoice_eq(aPointer, bPointer)
}
};
		}

		public func clone() -> Invoice {
			
			return Invoice(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoice>) in
Invoice_clone(origPointer)
});
		}

					internal func danglingClone() -> Invoice {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func hash() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKInvoice>) in
Invoice_hash(oPointer)
};
		}

		public func into_signed_raw() -> SignedRawInvoice {
			
			return SignedRawInvoice(pointer: Invoice_into_signed_raw(self.danglingClone().cOpaqueStruct!));
		}

		public func check_signature() -> Result_NoneSemanticErrorZ {
			
			return Result_NoneSemanticErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_check_signature(this_argPointer)
});
		}

		public class func from_signed(signed_invoice: SignedRawInvoice) -> Result_InvoiceSemanticErrorZ {
			
			return Result_InvoiceSemanticErrorZ(pointer: Invoice_from_signed(signed_invoice.danglingClone().cOpaqueStruct!));
		}

		public func timestamp() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_timestamp(this_argPointer)
};
		}

		public func duration_since_epoch() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_duration_since_epoch(this_argPointer)
};
		}

		public func payment_hash() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_payment_hash(this_argPointer)
}.pointee);
		}

		public func payee_pub_key() -> [UInt8] {
			
			return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_payee_pub_key(this_argPointer)
});
		}

		public func payment_secret() -> [UInt8] {
			
			return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_payment_secret(this_argPointer)
}.pointee);
		}

		public func features() -> InvoiceFeatures {
			
			return InvoiceFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_features(this_argPointer)
});
		}

		public func recover_payee_pub_key() -> [UInt8] {
			
			return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_recover_payee_pub_key(this_argPointer)
});
		}

		public func expiry_time() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_expiry_time(this_argPointer)
};
		}

		public func is_expired() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_is_expired(this_argPointer)
};
		}

		public func would_expire(at_time: UInt64) -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_would_expire(this_argPointer, at_time)
};
		}

		public func min_final_cltv_expiry() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_min_final_cltv_expiry(this_argPointer)
};
		}

		public func private_routes() -> [PrivateRoute] {
			
			return Bindings.LDKCVec_PrivateRouteZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_private_routes(this_argPointer)
}, callerContext: "Invoice::private_routes")
						
						.map { (cOpaqueStruct) in
							PrivateRoute(pointer: cOpaqueStruct)
						}
					;
		}

		public func route_hints() -> [RouteHint] {
			
			return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_route_hints(this_argPointer)
}, callerContext: "Invoice::route_hints")
						
						.map { (cOpaqueStruct) in
							RouteHint(pointer: cOpaqueStruct)
						}
					;
		}

		public func currency() -> LDKCurrency {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_currency(this_argPointer)
};
		}

		public func amount_milli_satoshis() -> Option_u64Z {
			
			return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_amount_milli_satoshis(this_argPointer)
});
		}

		public class func from_str(s: String) -> Result_InvoiceParseOrSemanticErrorZ {
			
			return Result_InvoiceParseOrSemanticErrorZ(pointer: Invoice_from_str(Bindings.new_LDKStr(string: s, chars_is_owned: true)));
		}

		public func to_str() -> String {
			
			return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKInvoice>) in
Invoice_to_str(oPointer)
}, callerContext: "Invoice::to_str");
		}

		internal func free() -> Void {
			
			return Invoice_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Invoice {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Invoice \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Invoice \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
