#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Fields sent in an [`InvoiceRequest`] message to include in [`PaymentContext::Bolt12Offer`].
///
/// [`PaymentContext::Bolt12Offer`]: crate::blinded_path::payment::PaymentContext::Bolt12Offer
public typealias InvoiceRequestFields = Bindings.InvoiceRequestFields

extension Bindings {


	/// Fields sent in an [`InvoiceRequest`] message to include in [`PaymentContext::Bolt12Offer`].
	///
	/// [`PaymentContext::Bolt12Offer`]: crate::blinded_path::payment::PaymentContext::Bolt12Offer
	public class InvoiceRequestFields: NativeTypeWrapper {

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

		internal var cType: LDKInvoiceRequestFields?

		internal init(cType: LDKInvoiceRequestFields, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKInvoiceRequestFields, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKInvoiceRequestFields, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the InvoiceRequestFields, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InvoiceRequestFields_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A possibly transient pubkey used to sign the invoice request.
		public func getPayerSigningPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_get_payer_signing_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A possibly transient pubkey used to sign the invoice request.
		public func setPayerSigningPubkey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_set_payer_signing_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The quantity of the offer's item conforming to [`Offer::is_valid_quantity`].
		public func getQuantity() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_get_quantity(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The quantity of the offer's item conforming to [`Offer::is_valid_quantity`].
		public func setQuantity(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_set_quantity(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A payer-provided note which will be seen by the recipient and reflected back in the invoice
		/// response. Truncated to [`PAYER_NOTE_LIMIT`] characters.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getPayerNoteTruncated() -> UntrustedString? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_get_payer_note_truncated(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKUntrustedString

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = UntrustedString(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// A payer-provided note which will be seen by the recipient and reflected back in the invoice
		/// response. Truncated to [`PAYER_NOTE_LIMIT`] characters.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setPayerNoteTruncated(val: UntrustedString) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_set_payer_note_truncated(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The Human Readable Name which the sender indicated they were paying to.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getHumanReadableName() -> HumanReadableName? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_get_human_readable_name(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKHumanReadableName

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = HumanReadableName(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The Human Readable Name which the sender indicated they were paying to.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setHumanReadableName(val: HumanReadableName) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_set_human_readable_name(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new InvoiceRequestFields given each field
		///
		/// Note that payer_note_truncated_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		/// Note that human_readable_name_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		public init(
			payerSigningPubkeyArg: [UInt8], quantityArg: UInt64?, payerNoteTruncatedArg: UntrustedString,
			humanReadableNameArg: HumanReadableName
		) {
			// native call variable prep

			let payerSigningPubkeyArgPrimitiveWrapper = PublicKey(
				value: payerSigningPubkeyArg, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")

			let quantityArgOption = Option_u64Z(
				some: quantityArg, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = InvoiceRequestFields_new(
				payerSigningPubkeyArgPrimitiveWrapper.cType!, quantityArgOption.cType!,
				payerNoteTruncatedArg.dynamicallyDangledClone().cType!,
				humanReadableNameArg.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			payerSigningPubkeyArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = InvoiceRequestFields(cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the InvoiceRequestFields
		internal func clone() -> InvoiceRequestFields {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InvoiceRequestFields(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two InvoiceRequestFieldss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: InvoiceRequestFields, b: InvoiceRequestFields) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKInvoiceRequestFields>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKInvoiceRequestFields>) in
						InvoiceRequestFields_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the InvoiceRequestFields object into a byte array which can be read by InvoiceRequestFields_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInvoiceRequestFields>) in
					InvoiceRequestFields_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a InvoiceRequestFields from a byte array, created by InvoiceRequestFields_write
		public class func read(ser: [UInt8]) -> Result_InvoiceRequestFieldsDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = InvoiceRequestFields_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_InvoiceRequestFieldsDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "InvoiceRequestFields.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> InvoiceRequestFields {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> InvoiceRequestFields {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> InvoiceRequestFields {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> InvoiceRequestFields {
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
						"Freeing InvoiceRequestFields \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InvoiceRequestFields \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

