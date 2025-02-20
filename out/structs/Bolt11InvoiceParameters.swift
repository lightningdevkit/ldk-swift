#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Parameters used with [`create_bolt11_invoice`].
///
/// [`create_bolt11_invoice`]: ChannelManager::create_bolt11_invoice
public typealias Bolt11InvoiceParameters = Bindings.Bolt11InvoiceParameters

extension Bindings {


	/// Parameters used with [`create_bolt11_invoice`].
	///
	/// [`create_bolt11_invoice`]: ChannelManager::create_bolt11_invoice
	public class Bolt11InvoiceParameters: NativeTypeWrapper {

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

		internal var cType: LDKBolt11InvoiceParameters?

		internal init(cType: LDKBolt11InvoiceParameters, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBolt11InvoiceParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBolt11InvoiceParameters, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the Bolt11InvoiceParameters, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11InvoiceParameters_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount for the invoice, if any.
		public func getAmountMsats() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_get_amount_msats(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The amount for the invoice, if any.
		public func setAmountMsats(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_set_amount_msats(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The description for what the invoice is for, or hash of such description.
		public func getDescription() -> Bolt11InvoiceDescription {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_get_description(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceDescription(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// The description for what the invoice is for, or hash of such description.
		public func setDescription(val: Bolt11InvoiceDescription) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_set_description(thisPtrPointer, val.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The invoice expiration relative to its creation time. If not set, the invoice will expire in
		/// [`DEFAULT_EXPIRY_TIME`] by default.
		///
		/// The creation time used is the duration since the Unix epoch for `std` builds. For non-`std`
		/// builds, the highest block timestamp seen is used instead. In the latter case, use a long
		/// enough expiry to account for the average block time.
		public func getInvoiceExpiryDeltaSecs() -> UInt32? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_get_invoice_expiry_delta_secs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u32Z(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The invoice expiration relative to its creation time. If not set, the invoice will expire in
		/// [`DEFAULT_EXPIRY_TIME`] by default.
		///
		/// The creation time used is the duration since the Unix epoch for `std` builds. For non-`std`
		/// builds, the highest block timestamp seen is used instead. In the latter case, use a long
		/// enough expiry to account for the average block time.
		public func setInvoiceExpiryDeltaSecs(val: UInt32?) {
			// native call variable prep

			let valOption = Option_u32Z(
				some: val, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_set_invoice_expiry_delta_secs(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum `cltv_expiry` for the last HTLC in the route. If not set, will use
		/// [`MIN_FINAL_CLTV_EXPIRY_DELTA`].
		///
		/// If set, must be at least [`MIN_FINAL_CLTV_EXPIRY_DELTA`], and a three-block buffer will be
		/// added as well to allow for up to a few new block confirmations during routing.
		public func getMinFinalCltvExpiryDelta() -> UInt16? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_get_min_final_cltv_expiry_delta(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u16Z(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The minimum `cltv_expiry` for the last HTLC in the route. If not set, will use
		/// [`MIN_FINAL_CLTV_EXPIRY_DELTA`].
		///
		/// If set, must be at least [`MIN_FINAL_CLTV_EXPIRY_DELTA`], and a three-block buffer will be
		/// added as well to allow for up to a few new block confirmations during routing.
		public func setMinFinalCltvExpiryDelta(val: UInt16?) {
			// native call variable prep

			let valOption = Option_u16Z(
				some: val, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_set_min_final_cltv_expiry_delta(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The payment hash used in the invoice. If not set, a payment hash will be generated using a
		/// preimage that can be reproduced by [`ChannelManager`] without storing any state.
		///
		/// Uses the payment hash if set. This may be useful if you're building an on-chain swap or
		/// involving another protocol where the payment hash is also involved outside the scope of
		/// lightning.
		public func getPaymentHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_get_payment_hash(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The payment hash used in the invoice. If not set, a payment hash will be generated using a
		/// preimage that can be reproduced by [`ChannelManager`] without storing any state.
		///
		/// Uses the payment hash if set. This may be useful if you're building an on-chain swap or
		/// involving another protocol where the payment hash is also involved outside the scope of
		/// lightning.
		public func setPaymentHash(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_ThirtyTwoBytesZ(
				some: val, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKBolt11InvoiceParameters>) in
					Bolt11InvoiceParameters_set_payment_hash(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new Bolt11InvoiceParameters given each field
		public init(
			amountMsatsArg: UInt64?, descriptionArg: Bolt11InvoiceDescription, invoiceExpiryDeltaSecsArg: UInt32?,
			minFinalCltvExpiryDeltaArg: UInt16?, paymentHashArg: [UInt8]?
		) {
			// native call variable prep

			let amountMsatsArgOption = Option_u64Z(
				some: amountMsatsArg, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let invoiceExpiryDeltaSecsArgOption = Option_u32Z(
				some: invoiceExpiryDeltaSecsArg,
				instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let minFinalCltvExpiryDeltaArgOption = Option_u16Z(
				some: minFinalCltvExpiryDeltaArg,
				instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentHashArgOption = Option_ThirtyTwoBytesZ(
				some: paymentHashArg, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Bolt11InvoiceParameters_new(
				amountMsatsArgOption.cType!, descriptionArg.danglingClone().cType!,
				invoiceExpiryDeltaSecsArgOption.cType!, minFinalCltvExpiryDeltaArgOption.cType!,
				paymentHashArgOption.cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = Bolt11InvoiceParameters(cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)")


		}

		/// Creates a "default" Bolt11InvoiceParameters. See struct and individual field documentaiton for details on which values are used.
		public class func initWithDefault() -> Bolt11InvoiceParameters {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11InvoiceParameters_default()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11InvoiceParameters(
				cType: nativeCallResult, instantiationContext: "Bolt11InvoiceParameters.swift::\(#function):\(#line)")


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


		internal func setCFreeability(freeable: Bool) -> Bolt11InvoiceParameters {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Bolt11InvoiceParameters {
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
						"Freeing Bolt11InvoiceParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Bolt11InvoiceParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

