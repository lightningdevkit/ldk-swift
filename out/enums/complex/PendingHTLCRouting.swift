import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias PendingHTLCRouting = Bindings.PendingHTLCRouting

extension Bindings {

	/// Information about where a received HTLC('s onion) has indicated the HTLC should go.
	public class PendingHTLCRouting: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKPendingHTLCRouting?

		internal init(cType: LDKPendingHTLCRouting, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPendingHTLCRouting, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPendingHTLCRouting, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum PendingHTLCRoutingType {

			/// An HTLC which should be forwarded on to another node.
			case Forward

			/// The onion indicates that this is a payment for an invoice (supposedly) generated by us.
			///
			/// Note that at this point, we have not checked that the invoice being paid was actually
			/// generated by us, but rather it's claiming to pay an invoice of ours.
			case Receive

			/// The onion indicates that this is for payment to us but which contains the preimage for
			/// claiming included, and is unrelated to any invoice we'd previously generated (aka a
			/// \"keysend\" or \"spontaneous\" payment).
			case ReceiveKeysend

		}

		public func getValueType() -> PendingHTLCRoutingType {
			switch self.cType!.tag {
				case LDKPendingHTLCRouting_Forward:
					return .Forward

				case LDKPendingHTLCRouting_Receive:
					return .Receive

				case LDKPendingHTLCRouting_ReceiveKeysend:
					return .ReceiveKeysend

				default:
					Bindings.print("Error: Invalid value type for PendingHTLCRouting! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the PendingHTLCRouting
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PendingHTLCRouting_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the PendingHTLCRouting
		internal func clone() -> PendingHTLCRouting {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPendingHTLCRouting>) in
					PendingHTLCRouting_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PendingHTLCRouting(
				cType: nativeCallResult, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Forward-variant PendingHTLCRouting
		public class func initForward(
			onionPacket: Bindings.OnionPacket, shortChannelId: UInt64, blinded: Bindings.BlindedForward
		) -> PendingHTLCRouting {
			// native call variable prep


			// native method call
			let nativeCallResult = PendingHTLCRouting_forward(
				onionPacket.dynamicallyDangledClone().cType!, shortChannelId, blinded.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = PendingHTLCRouting(
				cType: nativeCallResult, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Receive-variant PendingHTLCRouting
		public class func initWithReceive(
			paymentData: Bindings.FinalOnionHopData, paymentMetadata: [UInt8]?, incomingCltvExpiry: UInt32,
			phantomSharedSecret: [UInt8], customTlvs: [(UInt64, [UInt8])], requiresBlindedError: Bool
		) -> PendingHTLCRouting {
			// native call variable prep

			let paymentMetadataOption = Option_CVec_u8ZZ(
				some: paymentMetadata, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let phantomSharedSecretPrimitiveWrapper = ThirtyTwoBytes(
				value: phantomSharedSecret, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")

			let customTlvsVector = Vec_C2Tuple_u64CVec_u8ZZZ(
				array: customTlvs, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = PendingHTLCRouting_receive(
				paymentData.dynamicallyDangledClone().cType!, paymentMetadataOption.cType!, incomingCltvExpiry,
				phantomSharedSecretPrimitiveWrapper.cType!, customTlvsVector.cType!, requiresBlindedError)

			// cleanup

			// for elided types, we need this
			phantomSharedSecretPrimitiveWrapper.noOpRetain()

			// customTlvsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PendingHTLCRouting(
				cType: nativeCallResult, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ReceiveKeysend-variant PendingHTLCRouting
		public class func initWithReceiveKeysend(
			paymentData: Bindings.FinalOnionHopData, paymentPreimage: [UInt8], paymentMetadata: [UInt8]?,
			incomingCltvExpiry: UInt32, customTlvs: [(UInt64, [UInt8])]
		) -> PendingHTLCRouting {
			// native call variable prep

			let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(
				value: paymentPreimage, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")

			let paymentMetadataOption = Option_CVec_u8ZZ(
				some: paymentMetadata, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let customTlvsVector = Vec_C2Tuple_u64CVec_u8ZZZ(
				array: customTlvs, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = PendingHTLCRouting_receive_keysend(
				paymentData.dynamicallyDangledClone().cType!, paymentPreimagePrimitiveWrapper.cType!,
				paymentMetadataOption.cType!, incomingCltvExpiry, customTlvsVector.cType!)

			// cleanup

			// for elided types, we need this
			paymentPreimagePrimitiveWrapper.noOpRetain()

			// customTlvsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PendingHTLCRouting(
				cType: nativeCallResult, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the PendingHTLCRouting object into a byte array which can be read by PendingHTLCRouting_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPendingHTLCRouting>) in
					PendingHTLCRouting_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a PendingHTLCRouting from a byte array, created by PendingHTLCRouting_write
		public class func read(ser: [UInt8]) -> Result_PendingHTLCRoutingDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PendingHTLCRouting_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PendingHTLCRoutingDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsForward() -> Forward? {
			if self.cType?.tag != LDKPendingHTLCRouting_Forward {
				return nil
			}

			return PendingHTLCRouting_LDKForward_Body(
				cType: self.cType!.forward, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsReceive() -> Receive? {
			if self.cType?.tag != LDKPendingHTLCRouting_Receive {
				return nil
			}

			return PendingHTLCRouting_LDKReceive_Body(
				cType: self.cType!.receive, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsReceiveKeysend() -> ReceiveKeysend? {
			if self.cType?.tag != LDKPendingHTLCRouting_ReceiveKeysend {
				return nil
			}

			return PendingHTLCRouting_LDKReceiveKeysend_Body(
				cType: self.cType!.receive_keysend,
				instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> PendingHTLCRouting {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing PendingHTLCRouting \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PendingHTLCRouting \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias PendingHTLCRouting_LDKForward_Body = Forward


		///
		public class Forward: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPendingHTLCRouting_LDKForward_Body?

			internal init(cType: LDKPendingHTLCRouting_LDKForward_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKPendingHTLCRouting_LDKForward_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPendingHTLCRouting_LDKForward_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The onion which should be included in the forwarded HTLC, telling the next hop what to
			/// do with the HTLC.
			public func getOnionPacket() -> Bindings.OnionPacket {
				// return value (do some wrapping)
				let returnValue = Bindings.OnionPacket(
					cType: self.cType!.onion_packet,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// The short channel ID of the channel which we were instructed to forward this HTLC to.
			///
			/// This could be a real on-chain SCID, an SCID alias, or some other SCID which has meaning
			/// to the receiving node, such as one returned from
			/// [`ChannelManager::get_intercept_scid`] or [`ChannelManager::get_phantom_scid`].
			public func getShortChannelId() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.short_channel_id

				return returnValue
			}

			/// Set if this HTLC is being forwarded within a blinded path.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getBlinded() -> Bindings.BlindedForward {
				// return value (do some wrapping)
				let returnValue = Bindings.BlindedForward(
					cType: self.cType!.blinded, instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias PendingHTLCRouting_LDKReceive_Body = Receive


		///
		public class Receive: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPendingHTLCRouting_LDKReceive_Body?

			internal init(cType: LDKPendingHTLCRouting_LDKReceive_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKPendingHTLCRouting_LDKReceive_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPendingHTLCRouting_LDKReceive_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Information about the amount the sender intended to pay and (potential) proof that this
			/// is a payment for an invoice we generated. This proof of payment is is also used for
			/// linking MPP parts of a larger payment.
			public func getPaymentData() -> Bindings.FinalOnionHopData {
				// return value (do some wrapping)
				let returnValue = Bindings.FinalOnionHopData(
					cType: self.cType!.payment_data,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// Additional data which we (allegedly) instructed the sender to include in the onion.
			///
			/// For HTLCs received by LDK, this will ultimately be exposed in
			/// [`Event::PaymentClaimable::onion_fields`] as
			/// [`RecipientOnionFields::payment_metadata`].
			public func getPaymentMetadata() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_CVec_u8ZZ(
					cType: self.cType!.payment_metadata,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// CLTV expiry of the received HTLC.
			///
			/// Used to track when we should expire pending HTLCs that go unclaimed.
			public func getIncomingCltvExpiry() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.incoming_cltv_expiry

				return returnValue
			}

			/// If the onion had forwarding instructions to one of our phantom node SCIDs, this will
			/// provide the onion shared secret used to decrypt the next level of forwarding
			/// instructions.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getPhantomSharedSecret() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.phantom_shared_secret,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Custom TLVs which were set by the sender.
			///
			/// For HTLCs received by LDK, this will ultimately be exposed in
			/// [`Event::PaymentClaimable::onion_fields`] as
			/// [`RecipientOnionFields::custom_tlvs`].
			public func getCustomTlvs() -> [(UInt64, [UInt8])] {
				// return value (do some wrapping)
				let returnValue = Vec_C2Tuple_u64CVec_u8ZZZ(
					cType: self.cType!.custom_tlvs,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Set if this HTLC is the final hop in a multi-hop blinded path.
			public func getRequiresBlindedError() -> Bool {
				// return value (do some wrapping)
				let returnValue = self.cType!.requires_blinded_error

				return returnValue
			}


		}


		///
		internal typealias PendingHTLCRouting_LDKReceiveKeysend_Body = ReceiveKeysend


		///
		public class ReceiveKeysend: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPendingHTLCRouting_LDKReceiveKeysend_Body?

			internal init(cType: LDKPendingHTLCRouting_LDKReceiveKeysend_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKPendingHTLCRouting_LDKReceiveKeysend_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPendingHTLCRouting_LDKReceiveKeysend_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Information about the amount the sender intended to pay and possibly a token to
			/// associate MPP parts of a larger payment.
			///
			/// This will only be filled in if receiving MPP keysend payments is enabled, and it being
			/// present will cause deserialization to fail on versions of LDK prior to 0.0.116.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getPaymentData() -> Bindings.FinalOnionHopData {
				// return value (do some wrapping)
				let returnValue = Bindings.FinalOnionHopData(
					cType: self.cType!.payment_data,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// Preimage for this onion payment. This preimage is provided by the sender and will be
			/// used to settle the spontaneous payment.
			public func getPaymentPreimage() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_preimage,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Additional data which we (allegedly) instructed the sender to include in the onion.
			///
			/// For HTLCs received by LDK, this will ultimately bubble back up as
			/// [`RecipientOnionFields::payment_metadata`].
			public func getPaymentMetadata() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_CVec_u8ZZ(
					cType: self.cType!.payment_metadata,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// CLTV expiry of the received HTLC.
			///
			/// Used to track when we should expire pending HTLCs that go unclaimed.
			public func getIncomingCltvExpiry() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.incoming_cltv_expiry

				return returnValue
			}

			/// Custom TLVs which were set by the sender.
			///
			/// For HTLCs received by LDK, these will ultimately bubble back up as
			/// [`RecipientOnionFields::custom_tlvs`].
			public func getCustomTlvs() -> [(UInt64, [UInt8])] {
				// return value (do some wrapping)
				let returnValue = Vec_C2Tuple_u64CVec_u8ZZZ(
					cType: self.cType!.custom_tlvs,
					instantiationContext: "PendingHTLCRouting.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


		}


	}

}