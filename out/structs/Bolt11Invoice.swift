#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Represents a syntactically and semantically correct lightning BOLT11 invoice.
///
/// There are three ways to construct a `Bolt11Invoice`:
/// 1. using [`InvoiceBuilder`]
/// 2. using [`Bolt11Invoice::from_signed`]
/// 3. using `str::parse::<Bolt11Invoice>(&str)` (see [`Bolt11Invoice::from_str`])
///
/// [`Bolt11Invoice::from_str`]: crate::Bolt11Invoice#impl-FromStr
public typealias Bolt11Invoice = Bindings.Bolt11Invoice

extension Bindings {


	/// Represents a syntactically and semantically correct lightning BOLT11 invoice.
	///
	/// There are three ways to construct a `Bolt11Invoice`:
	/// 1. using [`InvoiceBuilder`]
	/// 2. using [`Bolt11Invoice::from_signed`]
	/// 3. using `str::parse::<Bolt11Invoice>(&str)` (see [`Bolt11Invoice::from_str`])
	///
	/// [`Bolt11Invoice::from_str`]: crate::Bolt11Invoice#impl-FromStr
	public class Bolt11Invoice: NativeTypeWrapper {

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

		internal var cType: LDKBolt11Invoice?

		internal init(cType: LDKBolt11Invoice, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBolt11Invoice, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBolt11Invoice, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Bolt11Invoice, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11Invoice_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two Bolt11Invoices contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: Bolt11Invoice, b: Bolt11Invoice) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBolt11Invoice>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBolt11Invoice>) in
						Bolt11Invoice_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Bolt11Invoice
		internal func clone() -> Bolt11Invoice {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11Invoice(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the Bolt11Invoice.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The hash of the [`RawBolt11Invoice`] that was signed.
		public func signableHash() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_signable_hash(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Transform the `Bolt11Invoice` into its unchecked version.
		public func intoSignedRaw() -> SignedRawBolt11Invoice {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11Invoice_into_signed_raw(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = SignedRawBolt11Invoice(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Check that the invoice is signed correctly and that key recovery works
		public func checkSignature() -> Result_NoneBolt11SemanticErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_check_signature(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneBolt11SemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constructs a `Bolt11Invoice` from a [`SignedRawBolt11Invoice`] by checking all its invariants.
		/// ```
		/// use lightning_invoice::*;
		///
		/// let invoice = \"lnbc100p1psj9jhxdqud3jxktt5w46x7unfv9kz6mn0v3jsnp4q0d3p2sfluzdx45tqcs\\
		/// h2pu5qc7lgq0xs578ngs6s0s68ua4h7cvspp5q6rmq35js88zp5dvwrv9m459tnk2zunwj5jalqtyxqulh0l\\
		/// 5gflssp5nf55ny5gcrfl30xuhzj3nphgj27rstekmr9fw3ny5989s300gyus9qyysgqcqpcrzjqw2sxwe993\\
		/// h5pcm4dxzpvttgza8zhkqxpgffcrf5v25nwpr3cmfg7z54kuqq8rgqqqqqqqq2qqqqq9qq9qrzjqd0ylaqcl\\
		/// j9424x9m8h2vcukcgnm6s56xfgu3j78zyqzhgs4hlpzvznlugqq9vsqqqqqqqlgqqqqqeqq9qrzjqwldmj9d\\
		/// ha74df76zhx6l9we0vjdquygcdt3kssupehe64g6yyp5yz5rhuqqwccqqyqqqqlgqqqqjcqq9qrzjqf9e58a\\
		/// guqr0rcun0ajlvmzq3ek63cw2w282gv3z5uupmuwvgjtq2z55qsqqg6qqqyqqqrtnqqqzq3cqygrzjqvphms\\
		/// ywntrrhqjcraumvc4y6r8v4z5v593trte429v4hredj7ms5z52usqq9ngqqqqqqqlgqqqqqqgq9qrzjq2v0v\\
		/// p62g49p7569ev48cmulecsxe59lvaw3wlxm7r982zxa9zzj7z5l0cqqxusqqyqqqqlgqqqqqzsqygarl9fh3\\
		/// 8s0gyuxjjgux34w75dnc6xp2l35j7es3jd4ugt3lu0xzre26yg5m7ke54n2d5sym4xcmxtl8238xxvw5h5h5\\
		/// j5r6drg6k6zcqj0fcwg\";
		///
		/// let signed = invoice.parse::<SignedRawBolt11Invoice>().unwrap();
		///
		/// assert!(Bolt11Invoice::from_signed(signed).is_ok());
		/// ```
		public class func fromSigned(signedInvoice: SignedRawBolt11Invoice) -> Result_Bolt11InvoiceBolt11SemanticErrorZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11Invoice_from_signed(signedInvoice.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_Bolt11InvoiceBolt11SemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns the `Bolt11Invoice`'s timestamp (should equal its creation time)
		public func timestamp() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_timestamp(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the `Bolt11Invoice`'s timestamp as a duration since the Unix epoch
		public func durationSinceEpoch() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_duration_since_epoch(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the hash to which we will receive the preimage on completion of the payment
		public func paymentHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_payment_hash(thisArgPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Get the payee's public key if one was included in the invoice
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func payeePubKey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_payee_pub_key(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustPrimitiveWrapper
			// Type: LDKPublicKey

			if nativeCallResult.compressed_form == Bindings.arrayToUInt8Tuple33(array: [UInt8](repeating: 0, count: 33))
			{
				return nil
			}


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Get the payment secret if one was included in the invoice
		public func paymentSecret() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_payment_secret(thisArgPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Get the payment metadata blob if one was included in the invoice
		public func paymentMetadata() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_payment_metadata(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Get the invoice features if they were included in the invoice
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func features() -> Bolt11InvoiceFeatures? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_features(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Recover the payee's public key (only to be used if none was included in the invoice)
		public func recoverPayeePubKey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_recover_payee_pub_key(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns the Duration since the Unix epoch at which the invoice expires.
		/// Returning None if overflow occurred.
		public func expiresAt() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_expires_at(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_DurationZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Returns the invoice's expiry time, if present, otherwise [`DEFAULT_EXPIRY_TIME`].
		public func expiryTime() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_expiry_time(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns whether the invoice has expired.
		public func isExpired() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_is_expired(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the Duration remaining until the invoice expires.
		public func durationUntilExpiry() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_duration_until_expiry(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the Duration remaining until the invoice expires given the current time.
		/// `time` is the timestamp as a duration since the Unix epoch.
		public func expirationRemainingFromEpoch(time: UInt64) -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_expiration_remaining_from_epoch(thisArgPointer, time)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns whether the expiry time would pass at the given point in time.
		/// `at_time` is the timestamp as a duration since the Unix epoch.
		public func wouldExpire(atTime: UInt64) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_would_expire(thisArgPointer, atTime)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the invoice's `min_final_cltv_expiry_delta` time, if present, otherwise
		/// [`DEFAULT_MIN_FINAL_CLTV_EXPIRY_DELTA`].
		public func minFinalCltvExpiryDelta() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_min_final_cltv_expiry_delta(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns a list of all fallback addresses as [`Address`]es
		public func fallbackAddresses() -> [String] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_fallback_addresses(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_AddressZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns a list of all routes included in the invoice
		public func privateRoutes() -> [PrivateRoute] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_private_routes(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_PrivateRouteZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns a list of all routes included in the invoice as the underlying hints
		public func routeHints() -> [RouteHint] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_route_hints(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_RouteHintZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns the currency for which the invoice was issued
		public func currency() -> Currency {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_currency(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Currency(value: nativeCallResult)


			return returnValue
		}

		/// Returns the amount if specified in the invoice as millisatoshis.
		public func amountMilliSatoshis() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_amount_milli_satoshis(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Read a Bolt11Invoice object from a string
		public class func fromStr(s: String) -> Result_Bolt11InvoiceParseOrSemanticErrorZ {
			// native call variable prep

			let sPrimitiveWrapper = Str(value: s, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = Bolt11Invoice_from_str(sPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			sPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_Bolt11InvoiceParseOrSemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Get the string representation of a Bolt11Invoice object
		public func toStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBolt11Invoice>) in
					Bolt11Invoice_to_str(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "Bolt11Invoice.swift::\(#function):\(#line)",
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


		internal func danglingClone() -> Bolt11Invoice {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> Bolt11Invoice {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> Bolt11Invoice {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Bolt11Invoice {
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
						"Freeing Bolt11Invoice \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Bolt11Invoice \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

