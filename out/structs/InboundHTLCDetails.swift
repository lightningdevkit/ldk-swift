#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Exposes details around pending inbound HTLCs.
public typealias InboundHTLCDetails = Bindings.InboundHTLCDetails

extension Bindings {


	/// Exposes details around pending inbound HTLCs.
	public class InboundHTLCDetails: NativeTypeWrapper {

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

		internal var cType: LDKInboundHTLCDetails?

		internal init(cType: LDKInboundHTLCDetails, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKInboundHTLCDetails, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKInboundHTLCDetails, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the InboundHTLCDetails, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InboundHTLCDetails_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC ID.
		/// The IDs are incremented by 1 starting from 0 for each offered HTLC.
		/// They are unique per channel and inbound/outbound direction, unless an HTLC was only announced
		/// and not part of any commitment transaction.
		public func getHtlcId() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_get_htlc_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The HTLC ID.
		/// The IDs are incremented by 1 starting from 0 for each offered HTLC.
		/// They are unique per channel and inbound/outbound direction, unless an HTLC was only announced
		/// and not part of any commitment transaction.
		public func setHtlcId(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_set_htlc_id(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_get_amount_msat(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_set_amount_msat(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_get_cltv_expiry(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_set_cltv_expiry(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_get_payment_hash(thisPtrPointer)
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
				value: val, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_set_payment_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
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
		/// See [`InboundHTLCStateDetails`] for information on the specific states.
		///
		/// LDK will always fill this field in, but when downgrading to prior versions of LDK, new
		/// states may result in `None` here.
		public func getState() -> InboundHTLCStateDetails? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_get_state(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_InboundHTLCStateDetailsZ(
				cType: nativeCallResult, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)",
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
		/// See [`InboundHTLCStateDetails`] for information on the specific states.
		///
		/// LDK will always fill this field in, but when downgrading to prior versions of LDK, new
		/// states may result in `None` here.
		public func setState(val: InboundHTLCStateDetails?) {
			// native call variable prep

			let valOption = Option_InboundHTLCStateDetailsZ(
				some: val, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_set_state(thisPtrPointer, valOption.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_get_is_dust(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_set_is_dust(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new InboundHTLCDetails given each field
		public init(
			htlcIdArg: UInt64, amountMsatArg: UInt64, cltvExpiryArg: UInt32, paymentHashArg: [UInt8],
			stateArg: InboundHTLCStateDetails?, isDustArg: Bool
		) {
			// native call variable prep

			let paymentHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHashArg, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")

			let stateArgOption = Option_InboundHTLCStateDetailsZ(
				some: stateArg, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = InboundHTLCDetails_new(
				htlcIdArg, amountMsatArg, cltvExpiryArg, paymentHashArgPrimitiveWrapper.cType!, stateArgOption.cType!,
				isDustArg)

			// cleanup

			// for elided types, we need this
			paymentHashArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = InboundHTLCDetails(cType: nativeCallResult, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the InboundHTLCDetails
		internal func clone() -> InboundHTLCDetails {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InboundHTLCDetails(
				cType: nativeCallResult, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the InboundHTLCDetails object into a byte array which can be read by InboundHTLCDetails_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInboundHTLCDetails>) in
					InboundHTLCDetails_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a InboundHTLCDetails from a byte array, created by InboundHTLCDetails_write
		public class func read(ser: [UInt8]) -> Result_InboundHTLCDetailsDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = InboundHTLCDetails_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_InboundHTLCDetailsDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "InboundHTLCDetails.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> InboundHTLCDetails {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> InboundHTLCDetails {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> InboundHTLCDetails {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> InboundHTLCDetails {
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
						"Freeing InboundHTLCDetails \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InboundHTLCDetails \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

