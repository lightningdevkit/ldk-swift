#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Represents a signed [`RawBolt11Invoice`] with cached hash. The signature is not checked and may be
/// invalid.
///
/// # Invariants
/// The hash has to be either from the deserialized invoice or from the serialized [`RawBolt11Invoice`].
public typealias SignedRawBolt11Invoice = Bindings.SignedRawBolt11Invoice

extension Bindings {


	/// Represents a signed [`RawBolt11Invoice`] with cached hash. The signature is not checked and may be
	/// invalid.
	///
	/// # Invariants
	/// The hash has to be either from the deserialized invoice or from the serialized [`RawBolt11Invoice`].
	public class SignedRawBolt11Invoice: NativeTypeWrapper {

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

		internal var cType: LDKSignedRawBolt11Invoice?

		internal init(cType: LDKSignedRawBolt11Invoice, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKSignedRawBolt11Invoice, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKSignedRawBolt11Invoice, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the SignedRawBolt11Invoice, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = SignedRawBolt11Invoice_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two SignedRawBolt11Invoices contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: SignedRawBolt11Invoice, b: SignedRawBolt11Invoice) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
						SignedRawBolt11Invoice_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the SignedRawBolt11Invoice
		internal func clone() -> SignedRawBolt11Invoice {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = SignedRawBolt11Invoice(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the SignedRawBolt11Invoice.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Disassembles the `SignedRawBolt11Invoice` into its three parts:
		/// 1. raw invoice
		/// 2. hash of the raw invoice
		/// 3. signature
		public func intoParts() -> (RawBolt11Invoice, [UInt8], Bolt11InvoiceSignature) {
			// native call variable prep


			// native method call
			let nativeCallResult = SignedRawBolt11Invoice_into_parts(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_RawBolt11Invoice_u832Bolt11InvoiceSignatureZ(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)"
			)
			.getValue()


			return returnValue
		}

		/// The [`RawBolt11Invoice`] which was signed.
		public func rawInvoice() -> RawBolt11Invoice {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_raw_invoice(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RawBolt11Invoice(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The hash of the [`RawBolt11Invoice`] that was signed.
		public func signableHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_signable_hash(thisArgPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Signature for the invoice.
		public func signature() -> Bolt11InvoiceSignature {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_signature(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceSignature(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Recovers the public key used for signing the invoice from the recoverable signature.
		public func recoverPayeePubKey() -> Result_PayeePubKeyErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_recover_payee_pub_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PayeePubKeyErrorZ(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Checks if the signature is valid for the included payee public key or if none exists if it's
		/// valid for the recovered signature (which should always be true?).
		public func checkSignature() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_check_signature(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Read a SignedRawBolt11Invoice object from a string
		public class func fromStr(s: String) -> Result_SignedRawBolt11InvoiceBolt11ParseErrorZ {
			// native call variable prep

			let sPrimitiveWrapper = Str(
				value: s, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = SignedRawBolt11Invoice_from_str(sPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			sPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SignedRawBolt11InvoiceBolt11ParseErrorZ(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Get the string representation of a SignedRawBolt11Invoice object
		public func toStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSignedRawBolt11Invoice>) in
					SignedRawBolt11Invoice_to_str(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "SignedRawBolt11Invoice.swift::\(#function):\(#line)",
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


		internal func danglingClone() -> SignedRawBolt11Invoice {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> SignedRawBolt11Invoice {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> SignedRawBolt11Invoice {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> SignedRawBolt11Invoice {
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
						"Freeing SignedRawBolt11Invoice \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing SignedRawBolt11Invoice \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

