#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Represents an syntactically correct [`Bolt11Invoice`] for a payment on the lightning network,
/// but without the signature information.
/// Decoding and encoding should not lead to information loss but may lead to different hashes.
///
/// For methods without docs see the corresponding methods in [`Bolt11Invoice`].
public typealias RawBolt11Invoice = Bindings.RawBolt11Invoice

extension Bindings {


	/// Represents an syntactically correct [`Bolt11Invoice`] for a payment on the lightning network,
	/// but without the signature information.
	/// Decoding and encoding should not lead to information loss but may lead to different hashes.
	///
	/// For methods without docs see the corresponding methods in [`Bolt11Invoice`].
	public class RawBolt11Invoice: NativeTypeWrapper {

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

		internal var cType: LDKRawBolt11Invoice?

		internal init(cType: LDKRawBolt11Invoice, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRawBolt11Invoice, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKRawBolt11Invoice, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the RawBolt11Invoice, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = RawBolt11Invoice_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// data part
		public func getData() -> RawDataPart {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_get_data(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RawDataPart(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// data part
		public func setData(val: RawDataPart) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_set_data(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two RawBolt11Invoices contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: RawBolt11Invoice, b: RawBolt11Invoice) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRawBolt11Invoice>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRawBolt11Invoice>) in
						RawBolt11Invoice_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the RawBolt11Invoice
		internal func clone() -> RawBolt11Invoice {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RawBolt11Invoice(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the RawBolt11Invoice.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Calculate the hash of the encoded `RawBolt11Invoice` which should be signed.
		public func signableHash() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_signable_hash(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func paymentHash() -> Sha256? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_payment_hash(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKSha256

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Sha256(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func description() -> Description? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_description(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKDescription

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Description(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func payeePubKey() -> PayeePubKey? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_payee_pub_key(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKPayeePubKey

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = PayeePubKey(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func descriptionHash() -> Sha256? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_description_hash(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKSha256

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Sha256(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func expiryTime() -> ExpiryTime? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_expiry_time(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKExpiryTime

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ExpiryTime(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func minFinalCltvExpiryDelta() -> MinFinalCltvExpiryDelta? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_min_final_cltv_expiry_delta(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKMinFinalCltvExpiryDelta

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = MinFinalCltvExpiryDelta(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		///
		public func paymentSecret() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_payment_secret(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func paymentMetadata() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_payment_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func features() -> Bolt11InvoiceFeatures? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_features(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKBolt11InvoiceFeatures

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceFeatures(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		///
		public func privateRoutes() -> [PrivateRoute] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_private_routes(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_PrivateRouteZ(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func amountPicoBtc() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_amount_pico_btc(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "RawBolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func currency() -> Currency {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRawBolt11Invoice>) in
					RawBolt11Invoice_currency(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Currency(value: nativeCallResult)


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


		internal func danglingClone() -> RawBolt11Invoice {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> RawBolt11Invoice {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> RawBolt11Invoice {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> RawBolt11Invoice {
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
						"Freeing RawBolt11Invoice \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing RawBolt11Invoice \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

