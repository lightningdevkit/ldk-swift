#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Information used to route a payment.
public typealias PaymentParameters = Bindings.PaymentParameters

extension Bindings {


	/// Information used to route a payment.
	public class PaymentParameters: NativeTypeWrapper {

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

		internal var cType: LDKPaymentParameters?

		internal init(cType: LDKPaymentParameters, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPaymentParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPaymentParameters, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the PaymentParameters, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentParameters_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Information about the payee, such as their features and route hints for their channels.
		public func getPayee() -> Payee {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_get_payee(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Payee(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Information about the payee, such as their features and route hints for their channels.
		public func setPayee(val: Payee) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
					PaymentParameters_set_payee(thisPtrPointer, val.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Expiration of a payment to the payee, in seconds relative to the UNIX epoch.
		public func getExpiryTime() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_get_expiry_time(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Expiration of a payment to the payee, in seconds relative to the UNIX epoch.
		public func setExpiryTime(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
					PaymentParameters_set_expiry_time(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum total CLTV delta we accept for the route.
		/// Defaults to [`DEFAULT_MAX_TOTAL_CLTV_EXPIRY_DELTA`].
		public func getMaxTotalCltvExpiryDelta() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_get_max_total_cltv_expiry_delta(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum total CLTV delta we accept for the route.
		/// Defaults to [`DEFAULT_MAX_TOTAL_CLTV_EXPIRY_DELTA`].
		public func setMaxTotalCltvExpiryDelta(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
					PaymentParameters_set_max_total_cltv_expiry_delta(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of paths that may be used by (MPP) payments.
		/// Defaults to [`DEFAULT_MAX_PATH_COUNT`].
		public func getMaxPathCount() -> UInt8 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_get_max_path_count(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of paths that may be used by (MPP) payments.
		/// Defaults to [`DEFAULT_MAX_PATH_COUNT`].
		public func setMaxPathCount(val: UInt8) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
					PaymentParameters_set_max_path_count(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Selects the maximum share of a channel's total capacity which will be sent over a channel,
		/// as a power of 1/2. A higher value prefers to send the payment using more MPP parts whereas
		/// a lower value prefers to send larger MPP parts, potentially saturating channels and
		/// increasing failure probability for those paths.
		///
		/// Note that this restriction will be relaxed during pathfinding after paths which meet this
		/// restriction have been found. While paths which meet this criteria will be searched for, it
		/// is ultimately up to the scorer to select them over other paths.
		///
		/// A value of 0 will allow payments up to and including a channel's total announced usable
		/// capacity, a value of one will only use up to half its capacity, two 1/4, etc.
		///
		/// Default value: 2
		public func getMaxChannelSaturationPowerOfHalf() -> UInt8 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_get_max_channel_saturation_power_of_half(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Selects the maximum share of a channel's total capacity which will be sent over a channel,
		/// as a power of 1/2. A higher value prefers to send the payment using more MPP parts whereas
		/// a lower value prefers to send larger MPP parts, potentially saturating channels and
		/// increasing failure probability for those paths.
		///
		/// Note that this restriction will be relaxed during pathfinding after paths which meet this
		/// restriction have been found. While paths which meet this criteria will be searched for, it
		/// is ultimately up to the scorer to select them over other paths.
		///
		/// A value of 0 will allow payments up to and including a channel's total announced usable
		/// capacity, a value of one will only use up to half its capacity, two 1/4, etc.
		///
		/// Default value: 2
		public func setMaxChannelSaturationPowerOfHalf(val: UInt8) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
					PaymentParameters_set_max_channel_saturation_power_of_half(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A list of SCIDs which this payment was previously attempted over and which caused the
		/// payment to fail. Future attempts for the same payment shouldn't be relayed through any of
		/// these SCIDs.
		///
		/// Returns a copy of the field.
		public func getPreviouslyFailedChannels() -> [UInt64] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_get_previously_failed_channels(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u64Z(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A list of SCIDs which this payment was previously attempted over and which caused the
		/// payment to fail. Future attempts for the same payment shouldn't be relayed through any of
		/// these SCIDs.
		public func setPreviouslyFailedChannels(val: [UInt64]) {
			// native call variable prep

			let valVector = Vec_u64Z(array: val, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
					PaymentParameters_set_previously_failed_channels(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new PaymentParameters given each field
		public init(
			payeeArg: Payee, expiryTimeArg: UInt64?, maxTotalCltvExpiryDeltaArg: UInt32, maxPathCountArg: UInt8,
			maxChannelSaturationPowerOfHalfArg: UInt8, previouslyFailedChannelsArg: [UInt64]
		) {
			// native call variable prep

			let expiryTimeArgOption = Option_u64Z(
				some: expiryTimeArg, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let previouslyFailedChannelsArgVector = Vec_u64Z(
				array: previouslyFailedChannelsArg,
				instantiationContext: "PaymentParameters.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = PaymentParameters_new(
				payeeArg.danglingClone().cType!, expiryTimeArgOption.cType!, maxTotalCltvExpiryDeltaArg,
				maxPathCountArg, maxChannelSaturationPowerOfHalfArg, previouslyFailedChannelsArgVector.cType!)

			// cleanup

			// previouslyFailedChannelsArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the PaymentParameters
		internal func clone() -> PaymentParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentParameters(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the PaymentParameters.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two PaymentParameterss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: PaymentParameters, b: PaymentParameters) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPaymentParameters>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPaymentParameters>) in
						PaymentParameters_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the PaymentParameters object into a byte array which can be read by PaymentParameters_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPaymentParameters>) in
					PaymentParameters_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a PaymentParameters from a byte array, created by PaymentParameters_write
		public class func read(ser: [UInt8], arg: UInt32) -> Result_PaymentParametersDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentParameters_read(serPrimitiveWrapper.cType!, arg)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PaymentParametersDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a payee with the node id of the given `pubkey`.
		///
		/// The `final_cltv_expiry_delta` should match the expected final CLTV delta the recipient has
		/// provided.
		public class func initWithNodeId(payeePubkey: [UInt8], finalCltvExpiryDelta: UInt32) -> PaymentParameters {
			// native call variable prep

			let payeePubkeyPrimitiveWrapper = PublicKey(
				value: payeePubkey, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentParameters_from_node_id(
				payeePubkeyPrimitiveWrapper.cType!, finalCltvExpiryDelta)

			// cleanup

			// for elided types, we need this
			payeePubkeyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PaymentParameters(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a payee with the node id of the given `pubkey` to use for keysend payments.
		///
		/// The `final_cltv_expiry_delta` should match the expected final CLTV delta the recipient has
		/// provided.
		///
		/// Note that MPP keysend is not widely supported yet. The `allow_mpp` lets you choose
		/// whether your router will be allowed to find a multi-part route for this payment. If you
		/// set `allow_mpp` to true, you should ensure a payment secret is set on send, likely via
		/// [`RecipientOnionFields::secret_only`].
		///
		/// [`RecipientOnionFields::secret_only`]: crate::ln::channelmanager::RecipientOnionFields::secret_only
		public class func initForKeysend(payeePubkey: [UInt8], finalCltvExpiryDelta: UInt32, allowMpp: Bool)
			-> PaymentParameters
		{
			// native call variable prep

			let payeePubkeyPrimitiveWrapper = PublicKey(
				value: payeePubkey, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentParameters_for_keysend(
				payeePubkeyPrimitiveWrapper.cType!, finalCltvExpiryDelta, allowMpp)

			// cleanup

			// for elided types, we need this
			payeePubkeyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PaymentParameters(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates parameters for paying to a blinded payee from the provided invoice. Sets
		/// [`Payee::Blinded::route_hints`], [`Payee::Blinded::features`], and
		/// [`PaymentParameters::expiry_time`].
		public class func initWithBolt12Invoice(invoice: Bolt12Invoice) -> PaymentParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: invoice.cType!) { (invoicePointer: UnsafePointer<LDKBolt12Invoice>) in
					PaymentParameters_from_bolt12_invoice(invoicePointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentParameters(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: invoice)
			return returnValue
		}

		/// Creates parameters for paying to a blinded payee from the provided blinded route hints.
		public class func initWithBlinded(blindedRouteHints: [(BlindedPayInfo, BlindedPath)]) -> PaymentParameters {
			// native call variable prep

			let blindedRouteHintsVector = Vec_C2Tuple_BlindedPayInfoBlindedPathZZ(
				array: blindedRouteHints, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = PaymentParameters_blinded(blindedRouteHintsVector.cType!)

			// cleanup

			// blindedRouteHintsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PaymentParameters(
				cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> PaymentParameters {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> PaymentParameters {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> PaymentParameters {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> PaymentParameters {
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
						"Freeing PaymentParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PaymentParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

