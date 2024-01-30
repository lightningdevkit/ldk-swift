#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Information about an incoming HTLC, including the [`PendingHTLCRouting`] describing where it
/// should go next.
public typealias PendingHTLCInfo = Bindings.PendingHTLCInfo

extension Bindings {


	/// Information about an incoming HTLC, including the [`PendingHTLCRouting`] describing where it
	/// should go next.
	public class PendingHTLCInfo: NativeTypeWrapper {

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

		internal var cType: LDKPendingHTLCInfo?

		internal init(cType: LDKPendingHTLCInfo, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPendingHTLCInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPendingHTLCInfo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the PendingHTLCInfo, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PendingHTLCInfo_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Further routing details based on whether the HTLC is being forwarded or received.
		public func getRouting() -> PendingHTLCRouting {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_routing(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PendingHTLCRouting(
				cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Further routing details based on whether the HTLC is being forwarded or received.
		public func setRouting(val: PendingHTLCRouting) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_routing(thisPtrPointer, val.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The onion shared secret we build with the sender used to decrypt the onion.
		///
		/// This is later used to encrypt failure packets in the event that the HTLC is failed.
		public func getIncomingSharedSecret() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_incoming_shared_secret(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The onion shared secret we build with the sender used to decrypt the onion.
		///
		/// This is later used to encrypt failure packets in the event that the HTLC is failed.
		public func setIncomingSharedSecret(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_incoming_shared_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Hash of the payment preimage, to lock the payment until the receiver releases the preimage.
		public func getPaymentHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_payment_hash(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Hash of the payment preimage, to lock the payment until the receiver releases the preimage.
		public func setPaymentHash(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_payment_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Amount received in the incoming HTLC.
		///
		/// This field was added in LDK 0.0.113 and will be `None` for objects written by prior
		/// versions.
		public func getIncomingAmtMsat() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_incoming_amt_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Amount received in the incoming HTLC.
		///
		/// This field was added in LDK 0.0.113 and will be `None` for objects written by prior
		/// versions.
		public func setIncomingAmtMsat(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(some: val, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_incoming_amt_msat(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount the sender indicated should be forwarded on to the next hop or amount the sender
		/// intended for us to receive for received payments.
		///
		/// If the received amount is less than this for received payments, an intermediary hop has
		/// attempted to steal some of our funds and we should fail the HTLC (the sender should retry
		/// it along another path).
		///
		/// Because nodes can take less than their required fees, and because senders may wish to
		/// improve their own privacy, this amount may be less than [`Self::incoming_amt_msat`] for
		/// received payments. In such cases, recipients must handle this HTLC as if it had received
		/// [`Self::outgoing_amt_msat`].
		public func getOutgoingAmtMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_outgoing_amt_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount the sender indicated should be forwarded on to the next hop or amount the sender
		/// intended for us to receive for received payments.
		///
		/// If the received amount is less than this for received payments, an intermediary hop has
		/// attempted to steal some of our funds and we should fail the HTLC (the sender should retry
		/// it along another path).
		///
		/// Because nodes can take less than their required fees, and because senders may wish to
		/// improve their own privacy, this amount may be less than [`Self::incoming_amt_msat`] for
		/// received payments. In such cases, recipients must handle this HTLC as if it had received
		/// [`Self::outgoing_amt_msat`].
		public func setOutgoingAmtMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_outgoing_amt_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The CLTV the sender has indicated we should set on the forwarded HTLC (or has indicated
		/// should have been set on the received HTLC for received payments).
		public func getOutgoingCltvValue() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_outgoing_cltv_value(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The CLTV the sender has indicated we should set on the forwarded HTLC (or has indicated
		/// should have been set on the received HTLC for received payments).
		public func setOutgoingCltvValue(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_outgoing_cltv_value(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The fee taken for this HTLC in addition to the standard protocol HTLC fees.
		///
		/// If this is a payment for forwarding, this is the fee we are taking before forwarding the
		/// HTLC.
		///
		/// If this is a received payment, this is the fee that our counterparty took.
		///
		/// This is used to allow LSPs to take fees as a part of payments, without the sender having to
		/// shoulder them.
		public func getSkimmedFeeMsat() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_get_skimmed_fee_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The fee taken for this HTLC in addition to the standard protocol HTLC fees.
		///
		/// If this is a payment for forwarding, this is the fee we are taking before forwarding the
		/// HTLC.
		///
		/// If this is a received payment, this is the fee that our counterparty took.
		///
		/// This is used to allow LSPs to take fees as a part of payments, without the sender having to
		/// shoulder them.
		public func setSkimmedFeeMsat(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(some: val, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_set_skimmed_fee_msat(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new PendingHTLCInfo given each field
		public init(
			routingArg: PendingHTLCRouting, incomingSharedSecretArg: [UInt8], paymentHashArg: [UInt8],
			incomingAmtMsatArg: UInt64?, outgoingAmtMsatArg: UInt64, outgoingCltvValueArg: UInt32,
			skimmedFeeMsatArg: UInt64?
		) {
			// native call variable prep

			let incomingSharedSecretArgPrimitiveWrapper = ThirtyTwoBytes(
				value: incomingSharedSecretArg, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")

			let paymentHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHashArg, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")

			let incomingAmtMsatArgOption = Option_u64Z(
				some: incomingAmtMsatArg, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let skimmedFeeMsatArgOption = Option_u64Z(
				some: skimmedFeeMsatArg, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = PendingHTLCInfo_new(
				routingArg.danglingClone().cType!, incomingSharedSecretArgPrimitiveWrapper.cType!,
				paymentHashArgPrimitiveWrapper.cType!, incomingAmtMsatArgOption.cType!, outgoingAmtMsatArg,
				outgoingCltvValueArg, skimmedFeeMsatArgOption.cType!)

			// cleanup

			// for elided types, we need this
			incomingSharedSecretArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = PendingHTLCInfo(cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the PendingHTLCInfo
		internal func clone() -> PendingHTLCInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PendingHTLCInfo(
				cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the PendingHTLCInfo object into a byte array which can be read by PendingHTLCInfo_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPendingHTLCInfo>) in
					PendingHTLCInfo_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a PendingHTLCInfo from a byte array, created by PendingHTLCInfo_write
		public class func read(ser: [UInt8]) -> Result_PendingHTLCInfoDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PendingHTLCInfo_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PendingHTLCInfoDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "PendingHTLCInfo.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> PendingHTLCInfo {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> PendingHTLCInfo {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> PendingHTLCInfo {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> PendingHTLCInfo {
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
						"Freeing PendingHTLCInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PendingHTLCInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

