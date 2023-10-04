
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A `Bolt12Invoice` is a payment request, typically corresponding to an [`Offer`] or a [`Refund`].
			/// 
			/// An invoice may be sent in response to an [`InvoiceRequest`] in the case of an offer or sent
			/// directly after scanning a refund. It includes all the information needed to pay a recipient.
			/// 
			/// [`Offer`]: crate::offers::offer::Offer
			/// [`Refund`]: crate::offers::refund::Refund
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			public typealias Bolt12Invoice = Bindings.Bolt12Invoice

			extension Bindings {
		

				/// A `Bolt12Invoice` is a payment request, typically corresponding to an [`Offer`] or a [`Refund`].
				/// 
				/// An invoice may be sent in response to an [`InvoiceRequest`] in the case of an offer or sent
				/// directly after scanning a refund. It includes all the information needed to pay a recipient.
				/// 
				/// [`Offer`]: crate::offers::offer::Offer
				/// [`Refund`]: crate::offers::refund::Refund
				/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
				public class Bolt12Invoice: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBolt12Invoice?

					internal init(cType: LDKBolt12Invoice, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBolt12Invoice, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKBolt12Invoice, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Bolt12Invoice, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Bolt12Invoice_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Bolt12Invoice
					internal func clone() -> Bolt12Invoice {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Bolt12Invoice(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// The chains that may be used when paying a requested invoice.
					/// 
					/// From [`Offer::chains`]; `None` if the invoice was created in response to a [`Refund`].
					/// 
					/// [`Offer::chains`]: crate::offers::offer::Offer::chains
					public func offerChains() -> [[UInt8]]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_offer_chains(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CVec_ThirtyTwoBytesZZ(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The chain that must be used when paying the invoice; selected from [`offer_chains`] if the
					/// invoice originated from an offer.
					/// 
					/// From [`InvoiceRequest::chain`] or [`Refund::chain`].
					/// 
					/// [`offer_chains`]: Self::offer_chains
					/// [`InvoiceRequest::chain`]: crate::offers::invoice_request::InvoiceRequest::chain
					public func chain() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_chain(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Opaque bytes set by the originating [`Offer`].
					/// 
					/// From [`Offer::metadata`]; `None` if the invoice was created in response to a [`Refund`] or
					/// if the [`Offer`] did not set it.
					/// 
					/// [`Offer`]: crate::offers::offer::Offer
					/// [`Offer::metadata`]: crate::offers::offer::Offer::metadata
					public func metadata() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_metadata(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CVec_u8ZZ(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The minimum amount required for a successful payment of a single item.
					/// 
					/// From [`Offer::amount`]; `None` if the invoice was created in response to a [`Refund`] or if
					/// the [`Offer`] did not set it.
					/// 
					/// [`Offer`]: crate::offers::offer::Offer
					/// [`Offer::amount`]: crate::offers::offer::Offer::amount
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func amount() -> Amount? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_amount(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKAmount
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = Amount(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Features pertaining to the originating [`Offer`].
					/// 
					/// From [`Offer::offer_features`]; `None` if the invoice was created in response to a
					/// [`Refund`].
					/// 
					/// [`Offer`]: crate::offers::offer::Offer
					/// [`Offer::offer_features`]: crate::offers::offer::Offer::offer_features
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func offerFeatures() -> OfferFeatures? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_offer_features(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKOfferFeatures
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = OfferFeatures(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// A complete description of the purpose of the originating offer or refund.
					/// 
					/// From [`Offer::description`] or [`Refund::description`].
					/// 
					/// [`Offer::description`]: crate::offers::offer::Offer::description
					public func description() -> PrintableString {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_description(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PrintableString(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Duration since the Unix epoch when an invoice should no longer be requested.
					/// 
					/// From [`Offer::absolute_expiry`] or [`Refund::absolute_expiry`].
					/// 
					/// [`Offer::absolute_expiry`]: crate::offers::offer::Offer::absolute_expiry
					public func absoluteExpiry() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_absolute_expiry(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The issuer of the offer or refund.
					/// 
					/// From [`Offer::issuer`] or [`Refund::issuer`].
					/// 
					/// [`Offer::issuer`]: crate::offers::offer::Offer::issuer
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func issuer() -> PrintableString? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_issuer(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKPrintableString
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = PrintableString(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Paths to the recipient originating from publicly reachable nodes.
					/// 
					/// From [`Offer::paths`] or [`Refund::paths`].
					/// 
					/// [`Offer::paths`]: crate::offers::offer::Offer::paths
					public func messagePaths() -> [BlindedPath] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_message_paths(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_BlindedPathZ(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The quantity of items supported.
					/// 
					/// From [`Offer::supported_quantity`]; `None` if the invoice was created in response to a
					/// [`Refund`].
					/// 
					/// [`Offer::supported_quantity`]: crate::offers::offer::Offer::supported_quantity
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func supportedQuantity() -> Quantity? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_supported_quantity(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKQuantity
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = Quantity(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// An unpredictable series of bytes from the payer.
					/// 
					/// From [`InvoiceRequest::payer_metadata`] or [`Refund::payer_metadata`].
					public func payerMetadata() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_payer_metadata(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle().getValue()
						

						return returnValue
					}
		
					/// Features pertaining to requesting an invoice.
					/// 
					/// From [`InvoiceRequest::invoice_request_features`] or [`Refund::features`].
					public func invoiceRequestFeatures() -> InvoiceRequestFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_invoice_request_features(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvoiceRequestFeatures(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The quantity of items requested or refunded for.
					/// 
					/// From [`InvoiceRequest::quantity`] or [`Refund::quantity`].
					public func quantity() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_quantity(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// A possibly transient pubkey used to sign the invoice request or to send an invoice for a
					/// refund in case there are no [`message_paths`].
					/// 
					/// [`message_paths`]: Self::message_paths
					public func payerId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_payer_id(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// A payer-provided note reflected back in the invoice.
					/// 
					/// From [`InvoiceRequest::payer_note`] or [`Refund::payer_note`].
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func payerNote() -> PrintableString? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_payer_note(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKPrintableString
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = PrintableString(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Duration since the Unix epoch when the invoice was created.
					public func createdAt() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_created_at(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Duration since [`Bolt12Invoice::created_at`] when the invoice has expired and therefore
					/// should no longer be paid.
					public func relativeExpiry() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_relative_expiry(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Whether the invoice has expired.
					public func isExpired() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_is_expired(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// SHA256 hash of the payment preimage that will be given in return for paying the invoice.
					public func paymentHash() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_payment_hash(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The minimum amount required for a successful payment of the invoice.
					public func amountMsats() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_amount_msats(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Features pertaining to paying an invoice.
					public func invoiceFeatures() -> Bolt12InvoiceFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_invoice_features(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Bolt12InvoiceFeatures(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The public key corresponding to the key used to sign the invoice.
					public func signingPubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_signing_pubkey(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Signature of the invoice verified using [`Bolt12Invoice::signing_pubkey`].
					public func signature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_signature(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SchnorrSignature(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Hash that was used for signing the invoice.
					public func signableHash() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_signable_hash(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Verifies that the invoice was for a request or refund created using the given key. Returns
					/// the associated [`PaymentId`] to use when sending the payment.
					public func verify(key: ExpandedKey) -> Result_ThirtyTwoBytesNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
				
						withUnsafePointer(to: key.cType!) { (keyPointer: UnsafePointer<LDKExpandedKey>) in
				Bolt12Invoice_verify(thisArgPointer, keyPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ThirtyTwoBytesNoneZ(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Serialize the Bolt12Invoice object into a byte array which can be read by Bolt12Invoice_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBolt12Invoice>) in
				Bolt12Invoice_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					
					internal func danglingClone() -> Bolt12Invoice {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Bolt12Invoice {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Bolt12Invoice {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Bolt12Invoice {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Bolt12Invoice \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Bolt12Invoice \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		