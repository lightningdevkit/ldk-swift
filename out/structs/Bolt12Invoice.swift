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

		internal init(
			cType: LDKBolt12Invoice, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
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
			let returnValue = Bolt12Invoice(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// A complete description of the purpose of the originating offer or refund. Intended to be
		/// displayed to the user but with the caveat that it has not been verified in any way.
		public func description() -> PrintableString {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
					Bolt12Invoice_description(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


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
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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
		public func features() -> Bolt12InvoiceFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12Invoice>) in
					Bolt12Invoice_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt12InvoiceFeatures(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


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
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


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
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Verifies that the invoice was for a request or refund created using the given key.
		public func verify(key: ExpandedKey) -> Bool {
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
			let returnValue = nativeCallResult


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
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Bolt12Invoice.swift::\(#function):\(#line)",
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
					Bindings.print(
						"Freeing Bolt12Invoice \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Bolt12Invoice \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

