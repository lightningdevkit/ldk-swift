#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A `Refund` is a request to send an [`Bolt12Invoice`] without a preceding [`Offer`].
///
/// Typically, after an invoice is paid, the recipient may publish a refund allowing the sender to
/// recoup their funds. A refund may be used more generally as an \"offer for money\", such as with a
/// bitcoin ATM.
///
/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
/// [`Offer`]: crate::offers::offer::Offer
public typealias Refund = Bindings.Refund

extension Bindings {


	/// A `Refund` is a request to send an [`Bolt12Invoice`] without a preceding [`Offer`].
	///
	/// Typically, after an invoice is paid, the recipient may publish a refund allowing the sender to
	/// recoup their funds. A refund may be used more generally as an \"offer for money\", such as with a
	/// bitcoin ATM.
	///
	/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
	/// [`Offer`]: crate::offers::offer::Offer
	public class Refund: NativeTypeWrapper {

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

		internal var cType: LDKRefund?

		internal init(cType: LDKRefund, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRefund, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKRefund, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Refund, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Refund_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Refund
		internal func clone() -> Refund {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRefund>) in
					Refund_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Refund(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)")


			return returnValue
		}

		/// A complete description of the purpose of the refund. Intended to be displayed to the user
		/// but with the caveat that it has not been verified in any way.
		public func description() -> PrintableString {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_description(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PrintableString(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Duration since the Unix epoch when an invoice should no longer be sent.
		///
		/// If `None`, the refund does not expire.
		public func absoluteExpiry() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_absolute_expiry(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_DurationZ(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Whether the refund has expired.
		public func isExpired() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_is_expired(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The issuer of the refund, possibly beginning with `user@domain` or `domain`. Intended to be
		/// displayed to the user but with the caveat that it has not been verified in any way.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func issuer() -> PrintableString? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_issuer(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Paths to the sender originating from publicly reachable nodes. Blinded paths provide sender
		/// privacy by obfuscating its node id.
		public func paths() -> [BlindedPath] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_paths(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_BlindedPathZ(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// An unpredictable series of bytes, typically containing information about the derivation of
		/// [`payer_id`].
		///
		/// [`payer_id`]: Self::payer_id
		public func metadata() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// A chain that the refund is valid for.
		public func chain() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_chain(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The amount to refund in msats (i.e., the minimum lightning-payable unit for [`chain`]).
		///
		/// [`chain`]: Self::chain
		public func amountMsats() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_amount_msats(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Features pertaining to requesting an invoice.
		public func features() -> InvoiceRequestFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InvoiceRequestFeatures(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The quantity of an item that refund is for.
		public func quantity() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_quantity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// A public node id to send to in the case where there are no [`paths`]. Otherwise, a possibly
		/// transient pubkey.
		///
		/// [`paths`]: Self::paths
		public func payerId() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_payer_id(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Payer provided note to include in the invoice.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func payerNote() -> PrintableString? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRefund>) in
					Refund_payer_note(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Serialize the Refund object into a byte array which can be read by Refund_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRefund>) in
					Refund_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a Refund object from a string
		public class func fromStr(s: String) -> Result_RefundBolt12ParseErrorZ {
			// native call variable prep

			let sPrimitiveWrapper = Str(value: s, instantiationContext: "Refund.swift::\(#function):\(#line)").dangle()


			// native method call
			let nativeCallResult = Refund_from_str(sPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			sPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RefundBolt12ParseErrorZ(
				cType: nativeCallResult, instantiationContext: "Refund.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> Refund {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> Refund {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> Refund {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Refund {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Refund \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Refund \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

