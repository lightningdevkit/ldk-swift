public class InvoicePayer: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKInvoicePayer?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(payer: Payer, router: Router, scorer: MultiThreadedLockableScore, logger: Logger, event_handler: EventHandler, retry_attempts: RetryAttempts) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: scorer.cOpaqueStruct!) { (scorerPointer: UnsafePointer<LDKMultiThreadedLockableScore>) in
InvoicePayer_new(payer.cOpaqueStruct!, router.cOpaqueStruct!, scorerPointer, logger.cOpaqueStruct!, event_handler.cOpaqueStruct!, retry_attempts.danglingClone().cOpaqueStruct!)
}
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInvoicePayer){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKInvoicePayer, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func pay_invoice(invoice: Invoice) -> Result_PaymentIdPaymentErrorZ {
    	
        return Result_PaymentIdPaymentErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoicePayer>) in
withUnsafePointer(to: invoice.cOpaqueStruct!) { (invoicePointer: UnsafePointer<LDKInvoice>) in
InvoicePayer_pay_invoice(this_argPointer, invoicePointer)
}
});
    }

    public func pay_zero_value_invoice(invoice: Invoice, amount_msats: UInt64) -> Result_PaymentIdPaymentErrorZ {
    	
        return Result_PaymentIdPaymentErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoicePayer>) in
withUnsafePointer(to: invoice.cOpaqueStruct!) { (invoicePointer: UnsafePointer<LDKInvoice>) in
InvoicePayer_pay_zero_value_invoice(this_argPointer, invoicePointer, amount_msats)
}
});
    }

    public func pay_pubkey(pubkey: [UInt8], payment_preimage: [UInt8], amount_msats: UInt64, final_cltv_expiry_delta: UInt32) -> Result_PaymentIdPaymentErrorZ {
    	
        return Result_PaymentIdPaymentErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoicePayer>) in
InvoicePayer_pay_pubkey(this_argPointer, Bindings.new_LDKPublicKey(array: pubkey), Bindings.new_LDKThirtyTwoBytes(array: payment_preimage), amount_msats, final_cltv_expiry_delta)
});
    }

    public func remove_cached_payment(payment_hash: [UInt8]) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoicePayer>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: payment_hash)) { (payment_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
InvoicePayer_remove_cached_payment(this_argPointer, payment_hashPointer)
}
};
    }

    public func as_EventHandler() -> NativelyImplementedEventHandler {
    	
        return NativelyImplementedEventHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoicePayer>) in
InvoicePayer_as_EventHandler(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return InvoicePayer_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> InvoicePayer {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing InvoicePayer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InvoicePayer \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
