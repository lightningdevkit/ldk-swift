
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An `InvoiceRequest` is a request for a [`Bolt12Invoice`] formulated from an [`Offer`].
			/// 
			/// An offer may provide choices such as quantity, amount, chain, features, etc. An invoice request
			/// specifies these such that its recipient can send an invoice for payment.
			/// 
			/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
			/// [`Offer`]: crate::offers::offer::Offer
			public typealias InvoiceRequest = Bindings.InvoiceRequest

			extension Bindings {
		

				/// An `InvoiceRequest` is a request for a [`Bolt12Invoice`] formulated from an [`Offer`].
				/// 
				/// An offer may provide choices such as quantity, amount, chain, features, etc. An invoice request
				/// specifies these such that its recipient can send an invoice for payment.
				/// 
				/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
				/// [`Offer`]: crate::offers::offer::Offer
				public class InvoiceRequest: NativeTypeWrapper {

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

					internal var cType: LDKInvoiceRequest?

					internal init(cType: LDKInvoiceRequest, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKInvoiceRequest, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKInvoiceRequest, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InvoiceRequest, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoiceRequest_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the InvoiceRequest
					internal func clone() -> InvoiceRequest {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvoiceRequest(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// The chains that may be used when paying a requested invoice (e.g., bitcoin mainnet).
					/// Payments must be denominated in units of the minimal lightning-payable unit (e.g., msats)
					/// for the selected chain.
					public func chains() -> [[UInt8]] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_chains(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_ThirtyTwoBytesZ(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Opaque bytes set by the originator. Useful for authentication and validating fields since it
					/// is reflected in `invoice_request` messages along with all the other fields from the `offer`.
					public func metadata() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_metadata(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CVec_u8ZZ(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The minimum amount required for a successful payment of a single item.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func amount() -> Amount? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_amount(thisArgPointer)
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
						let returnValue = Amount(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// A complete description of the purpose of the payment. Intended to be displayed to the user
					/// but with the caveat that it has not been verified in any way.
					public func description() -> PrintableString {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_description(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PrintableString(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Features pertaining to the offer.
					public func offerFeatures() -> OfferFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_offer_features(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OfferFeatures(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Duration since the Unix epoch when an invoice should no longer be requested.
					/// 
					/// If `None`, the offer does not expire.
					public func absoluteExpiry() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_absolute_expiry(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The issuer of the offer, possibly beginning with `user@domain` or `domain`. Intended to be
					/// displayed to the user but with the caveat that it has not been verified in any way.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func issuer() -> PrintableString? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_issuer(thisArgPointer)
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
						let returnValue = PrintableString(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Paths to the recipient originating from publicly reachable nodes. Blinded paths provide
					/// recipient privacy by obfuscating its node id.
					public func paths() -> [BlindedPath] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_paths(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_BlindedPathZ(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The quantity of items supported.
					public func supportedQuantity() -> Quantity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_supported_quantity(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Quantity(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The public key used by the recipient to sign invoices.
					public func signingPubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_signing_pubkey(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// An unpredictable series of bytes, typically containing information about the derivation of
					/// [`payer_id`].
					/// 
					/// [`payer_id`]: Self::payer_id
					public func payerMetadata() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_payer_metadata(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle().getValue()
						

						return returnValue
					}
		
					/// A chain from [`Offer::chains`] that the offer is valid for.
					public func chain() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_chain(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The amount to pay in msats (i.e., the minimum lightning-payable unit for [`chain`]), which
					/// must be greater than or equal to [`Offer::amount`], converted if necessary.
					/// 
					/// [`chain`]: Self::chain
					public func amountMsats() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_amount_msats(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Features pertaining to requesting an invoice.
					public func invoiceRequestFeatures() -> InvoiceRequestFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_invoice_request_features(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvoiceRequestFeatures(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The quantity of the offer's item conforming to [`Offer::is_valid_quantity`].
					public func quantity() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_quantity(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// A possibly transient pubkey used to sign the invoice request.
					public func payerId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_payer_id(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// A payer-provided note which will be seen by the recipient and reflected back in the invoice
					/// response.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func payerNote() -> PrintableString? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_payer_note(thisArgPointer)
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
						let returnValue = PrintableString(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Signature of the invoice request using [`payer_id`].
					/// 
					/// [`payer_id`]: Self::payer_id
					public func signature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_signature(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SchnorrSignature(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Verifies that the request was for an offer created using the given key. Returns the verified
					/// request which contains the derived keys needed to sign a [`Bolt12Invoice`] for the request
					/// if they could be extracted from the metadata.
					/// 
					/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
					public func verify(key: ExpandedKey) -> Result_VerifiedInvoiceRequestNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: key.cType!) { (keyPointer: UnsafePointer<LDKExpandedKey>) in
				InvoiceRequest_verify(self.dynamicallyDangledClone().cType!, keyPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_VerifiedInvoiceRequestNoneZ(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the InvoiceRequest object into a byte array which can be read by InvoiceRequest_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInvoiceRequest>) in
				InvoiceRequest_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "InvoiceRequest.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

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
		

					
					internal func danglingClone() -> InvoiceRequest {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> InvoiceRequest {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> InvoiceRequest {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> InvoiceRequest {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing InvoiceRequest \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing InvoiceRequest \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		