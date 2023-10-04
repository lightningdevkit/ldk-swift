#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An `Offer` is a potentially long-lived proposal for payment of a good or service.
///
/// An offer is a precursor to an [`InvoiceRequest`]. A merchant publishes an offer from which a
/// customer may request an [`Bolt12Invoice`] for a specific quantity and using an amount sufficient
/// to cover that quantity (i.e., at least `quantity * amount`). See [`Offer::amount`].
///
/// Offers may be denominated in currency other than bitcoin but are ultimately paid using the
/// latter.
///
/// Through the use of [`BlindedPath`]s, offers provide recipient privacy.
///
/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
public typealias Offer = Bindings.Offer

extension Bindings {


	/// An `Offer` is a potentially long-lived proposal for payment of a good or service.
	///
	/// An offer is a precursor to an [`InvoiceRequest`]. A merchant publishes an offer from which a
	/// customer may request an [`Bolt12Invoice`] for a specific quantity and using an amount sufficient
	/// to cover that quantity (i.e., at least `quantity * amount`). See [`Offer::amount`].
	///
	/// Offers may be denominated in currency other than bitcoin but are ultimately paid using the
	/// latter.
	///
	/// Through the use of [`BlindedPath`]s, offers provide recipient privacy.
	///
	/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
	/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
	public class Offer: NativeTypeWrapper {

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

		internal var cType: LDKOffer?

		internal init(cType: LDKOffer, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOffer, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKOffer, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Offer, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Offer_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Offer
		internal func clone() -> Offer {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOffer>) in
					Offer_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Offer(cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)")


			return returnValue
		}

		/// The chains that may be used when paying a requested invoice (e.g., bitcoin mainnet).
		/// Payments must be denominated in units of the minimal lightning-payable unit (e.g., msats)
		/// for the selected chain.
		public func chains() -> [[UInt8]] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_chains(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_amount(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_description(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Features pertaining to the offer.
		public func offerFeatures() -> OfferFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_offer_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OfferFeatures(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_absolute_expiry(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_issuer(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
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
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_paths(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedPathZ(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The quantity of items supported.
		public func supportedQuantity() -> Quantity {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_supported_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Quantity(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The public key used by the recipient to sign invoices.
		public func signingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_signing_pubkey(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns whether the given chain is supported by the offer.
		public func supportsChain(chain: [UInt8]) -> Bool {
			// native call variable prep

			let chainPrimitiveWrapper = ThirtyTwoBytes(
				value: chain, instantiationContext: "Offer.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_supports_chain(thisArgPointer, chainPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			chainPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Whether the offer has expired.
		public func isExpired() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_is_expired(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns whether the given quantity is valid for the offer.
		public func isValidQuantity(quantity: UInt64) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_is_valid_quantity(thisArgPointer, quantity)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns whether a quantity is expected in an [`InvoiceRequest`] for the offer.
		///
		/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
		public func expectsQuantity() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffer>) in
					Offer_expects_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the Offer object into a byte array which can be read by Offer_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOffer>) in
					Offer_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a Offer object from a string
		public class func fromStr(s: String) -> Result_OfferBolt12ParseErrorZ {
			// native call variable prep

			let sPrimitiveWrapper = Str(value: s, instantiationContext: "Offer.swift::\(#function):\(#line)").dangle()


			// native method call
			let nativeCallResult = Offer_from_str(sPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			sPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OfferBolt12ParseErrorZ(
				cType: nativeCallResult, instantiationContext: "Offer.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> Offer {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> Offer {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> Offer {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Offer {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Offer \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Offer \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

