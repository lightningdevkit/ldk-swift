#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`InvoiceRequest`] that has been verified by [`InvoiceRequest::verify`] and exposes different
/// ways to respond depending on whether the signing keys were derived.
public typealias VerifiedInvoiceRequest = Bindings.VerifiedInvoiceRequest

extension Bindings {


	/// An [`InvoiceRequest`] that has been verified by [`InvoiceRequest::verify`] and exposes different
	/// ways to respond depending on whether the signing keys were derived.
	public class VerifiedInvoiceRequest: NativeTypeWrapper {

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

		internal var cType: LDKVerifiedInvoiceRequest?

		internal init(cType: LDKVerifiedInvoiceRequest, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKVerifiedInvoiceRequest, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKVerifiedInvoiceRequest, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the VerifiedInvoiceRequest, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = VerifiedInvoiceRequest_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Keys used for signing a [`Bolt12Invoice`] if they can be derived.
		///
		/// If `Some`, must call [`respond_using_derived_keys`] when responding. Otherwise, call
		/// [`respond_with`].
		///
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		/// [`respond_using_derived_keys`]: Self::respond_using_derived_keys
		/// [`respond_with`]: Self::respond_with
		public func getKeys() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_get_keys(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_SecretKeyZ(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Keys used for signing a [`Bolt12Invoice`] if they can be derived.
		///
		/// If `Some`, must call [`respond_using_derived_keys`] when responding. Otherwise, call
		/// [`respond_with`].
		///
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		/// [`respond_using_derived_keys`]: Self::respond_using_derived_keys
		/// [`respond_with`]: Self::respond_with
		public func setKeys(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_SecretKeyZ(
				some: val, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_set_keys(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the VerifiedInvoiceRequest
		internal func clone() -> VerifiedInvoiceRequest {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = VerifiedInvoiceRequest(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)")


			return returnValue
		}

		/// The chains that may be used when paying a requested invoice (e.g., bitcoin mainnet).
		/// Payments must be denominated in units of the minimal lightning-payable unit (e.g., msats)
		/// for the selected chain.
		public func chains() -> [[UInt8]] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_chains(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Opaque bytes set by the originator. Useful for authentication and validating fields since it
		/// is reflected in `invoice_request` messages along with all the other fields from the `offer`.
		public func metadata() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The minimum amount required for a successful payment of a single item.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func amount() -> Amount? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_amount(thisArgPointer)
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
			let returnValue = Amount(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// A complete description of the purpose of the payment. Intended to be displayed to the user
		/// but with the caveat that it has not been verified in any way.
		public func description() -> PrintableString {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_description(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Features pertaining to the offer.
		public func offerFeatures() -> OfferFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_offer_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OfferFeatures(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Duration since the Unix epoch when an invoice should no longer be requested.
		///
		/// If `None`, the offer does not expire.
		public func absoluteExpiry() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_absolute_expiry(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_issuer(thisArgPointer)
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
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Paths to the recipient originating from publicly reachable nodes. Blinded paths provide
		/// recipient privacy by obfuscating its node id.
		public func paths() -> [BlindedPath] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_paths(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedPathZ(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The quantity of items supported.
		public func supportedQuantity() -> Quantity {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_supported_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Quantity(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The public key used by the recipient to sign invoices.
		public func signingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_signing_pubkey(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_payer_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// A chain from [`Offer::chains`] that the offer is valid for.
		public func chain() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_chain(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_amount_msats(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Features pertaining to requesting an invoice.
		public func invoiceRequestFeatures() -> InvoiceRequestFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_invoice_request_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InvoiceRequestFeatures(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The quantity of the offer's item conforming to [`Offer::is_valid_quantity`].
		public func quantity() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// A possibly transient pubkey used to sign the invoice request.
		public func payerId() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_payer_id(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKVerifiedInvoiceRequest>) in
					VerifiedInvoiceRequest_payer_note(thisArgPointer)
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
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "VerifiedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> VerifiedInvoiceRequest {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> VerifiedInvoiceRequest {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> VerifiedInvoiceRequest {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> VerifiedInvoiceRequest {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing VerifiedInvoiceRequest \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing VerifiedInvoiceRequest \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

