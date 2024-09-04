#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Exposes details around pending outbound HTLCs.
public typealias OutboundHTLCDetails = Bindings.OutboundHTLCDetails

extension Bindings {


	/// Exposes details around pending outbound HTLCs.
	public class OutboundHTLCDetails: NativeTypeWrapper {

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

		internal var cType: LDKOutboundHTLCDetails?

		internal init(cType: LDKOutboundHTLCDetails, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOutboundHTLCDetails, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOutboundHTLCDetails, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OutboundHTLCDetails, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OutboundHTLCDetails_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC ID.
		/// The IDs are incremented by 1 starting from 0 for each offered HTLC.
		/// They are unique per channel and inbound/outbound direction, unless an HTLC was only announced
		/// and not part of any commitment transaction.
		///
		/// Not present when we are awaiting a remote revocation and the HTLC is not added yet.
		public func getHtlcId() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_htlc_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The HTLC ID.
		/// The IDs are incremented by 1 starting from 0 for each offered HTLC.
		/// They are unique per channel and inbound/outbound direction, unless an HTLC was only announced
		/// and not part of any commitment transaction.
		///
		/// Not present when we are awaiting a remote revocation and the HTLC is not added yet.
		public func setHtlcId(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_htlc_id(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount in msat.
		public func getAmountMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_amount_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount in msat.
		public func setAmountMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_amount_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The block height at which this HTLC expires.
		public func getCltvExpiry() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_cltv_expiry(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The block height at which this HTLC expires.
		public func setCltvExpiry(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_cltv_expiry(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The payment hash.
		public func getPaymentHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_payment_hash(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The payment hash.
		public func setPaymentHash(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_payment_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The state of the HTLC in the state machine.
		///
		/// Determines on which commitment transactions the HTLC is included and what message the HTLC is
		/// waiting for to advance to the next state.
		///
		/// See [`OutboundHTLCStateDetails`] for information on the specific states.
		///
		/// LDK will always fill this field in, but when downgrading to prior versions of LDK, new
		/// states may result in `None` here.
		public func getState() -> OutboundHTLCStateDetails? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_state(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_OutboundHTLCStateDetailsZ(
				cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The state of the HTLC in the state machine.
		///
		/// Determines on which commitment transactions the HTLC is included and what message the HTLC is
		/// waiting for to advance to the next state.
		///
		/// See [`OutboundHTLCStateDetails`] for information on the specific states.
		///
		/// LDK will always fill this field in, but when downgrading to prior versions of LDK, new
		/// states may result in `None` here.
		public func setState(val: OutboundHTLCStateDetails?) {
			// native call variable prep

			let valOption = Option_OutboundHTLCStateDetailsZ(
				some: val, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_state(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The extra fee being skimmed off the top of this HTLC.
		public func getSkimmedFeeMsat() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_skimmed_fee_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The extra fee being skimmed off the top of this HTLC.
		public func setSkimmedFeeMsat(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_skimmed_fee_msat(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Whether the HTLC has an output below the local dust limit. If so, the output will be trimmed
		/// from the local commitment transaction and added to the commitment transaction fee.
		/// For non-anchor channels, this takes into account the cost of the second-stage HTLC
		/// transactions as well.
		///
		/// When the local commitment transaction is broadcasted as part of a unilateral closure,
		/// the value of this HTLC will therefore not be claimable but instead burned as a transaction
		/// fee.
		///
		/// Note that dust limits are specific to each party. An HTLC can be dust for the local
		/// commitment transaction but not for the counterparty's commitment transaction and vice versa.
		public func getIsDust() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_get_is_dust(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Whether the HTLC has an output below the local dust limit. If so, the output will be trimmed
		/// from the local commitment transaction and added to the commitment transaction fee.
		/// For non-anchor channels, this takes into account the cost of the second-stage HTLC
		/// transactions as well.
		///
		/// When the local commitment transaction is broadcasted as part of a unilateral closure,
		/// the value of this HTLC will therefore not be claimable but instead burned as a transaction
		/// fee.
		///
		/// Note that dust limits are specific to each party. An HTLC can be dust for the local
		/// commitment transaction but not for the counterparty's commitment transaction and vice versa.
		public func setIsDust(val: Bool) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_set_is_dust(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new OutboundHTLCDetails given each field
		public init(
			htlcIdArg: UInt64?, amountMsatArg: UInt64, cltvExpiryArg: UInt32, paymentHashArg: [UInt8],
			stateArg: OutboundHTLCStateDetails?, skimmedFeeMsatArg: UInt64?, isDustArg: Bool
		) {
			// native call variable prep

			let htlcIdArgOption = Option_u64Z(
				some: htlcIdArg, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHashArg, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")

			let stateArgOption = Option_OutboundHTLCStateDetailsZ(
				some: stateArg, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let skimmedFeeMsatArgOption = Option_u64Z(
				some: skimmedFeeMsatArg, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = OutboundHTLCDetails_new(
				htlcIdArgOption.cType!, amountMsatArg, cltvExpiryArg, paymentHashArgPrimitiveWrapper.cType!,
				stateArgOption.cType!, skimmedFeeMsatArgOption.cType!, isDustArg)

			// cleanup

			// for elided types, we need this
			paymentHashArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = OutboundHTLCDetails(cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the OutboundHTLCDetails
		internal func clone() -> OutboundHTLCDetails {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OutboundHTLCDetails(
				cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the OutboundHTLCDetails object into a byte array which can be read by OutboundHTLCDetails_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOutboundHTLCDetails>) in
					OutboundHTLCDetails_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a OutboundHTLCDetails from a byte array, created by OutboundHTLCDetails_write
		public class func read(ser: [UInt8]) -> Result_OutboundHTLCDetailsDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OutboundHTLCDetails_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OutboundHTLCDetailsDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "OutboundHTLCDetails.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OutboundHTLCDetails {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OutboundHTLCDetails {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OutboundHTLCDetails {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OutboundHTLCDetails {
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
						"Freeing OutboundHTLCDetails \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OutboundHTLCDetails \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

