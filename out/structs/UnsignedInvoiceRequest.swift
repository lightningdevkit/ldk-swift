#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A semantically valid [`InvoiceRequest`] that hasn't been signed.
///
/// # Serialization
///
/// This is serialized as a TLV stream, which includes TLV records from the originating message. As
/// such, it may include unknown, odd TLV records.
public typealias UnsignedInvoiceRequest = Bindings.UnsignedInvoiceRequest

extension Bindings {


	/// A semantically valid [`InvoiceRequest`] that hasn't been signed.
	///
	/// # Serialization
	///
	/// This is serialized as a TLV stream, which includes TLV records from the originating message. As
	/// such, it may include unknown, odd TLV records.
	public class UnsignedInvoiceRequest: NativeTypeWrapper {

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

		internal var cType: LDKUnsignedInvoiceRequest?

		internal init(cType: LDKUnsignedInvoiceRequest, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKUnsignedInvoiceRequest, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKUnsignedInvoiceRequest, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the UnsignedInvoiceRequest, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = UnsignedInvoiceRequest_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the [`TaggedHash`] of the invoice to sign.
		public func taggedHash() -> TaggedHash {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_tagged_hash(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TaggedHash(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The chains that may be used when paying a requested invoice (e.g., bitcoin mainnet).
		/// Payments must be denominated in units of the minimal lightning-payable unit (e.g., msats)
		/// for the selected chain.
		public func chains() -> [[UInt8]] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_chains(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_amount(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_description(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_offer_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OfferFeatures(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_absolute_expiry(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_issuer(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_paths(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedPathZ(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_supported_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Quantity(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_signing_pubkey(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_payer_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_chain(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_amount_msats(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_invoice_request_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InvoiceRequestFeatures(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_payer_id(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_payer_note(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Serialize the UnsignedInvoiceRequest object into a byte array which can be read by UnsignedInvoiceRequest_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnsignedInvoiceRequest>) in
					UnsignedInvoiceRequest_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "UnsignedInvoiceRequest.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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


		internal func setCFreeability(freeable: Bool) -> UnsignedInvoiceRequest {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> UnsignedInvoiceRequest {
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
						"Freeing UnsignedInvoiceRequest \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing UnsignedInvoiceRequest \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

