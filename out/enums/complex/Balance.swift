import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Balance = Bindings.Balance

extension Bindings {

	/// Details about the balance(s) available for spending once the channel appears on chain.
	///
	/// See [`ChannelMonitor::get_claimable_balances`] for more details on when these will or will not
	/// be provided.
	public class Balance: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKBalance?

		internal init(cType: LDKBalance, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBalance, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKBalance, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum BalanceType {

			/// The channel is not yet closed (or the commitment or closing transaction has not yet
			/// appeared in a block). The given balance is claimable (less on-chain fees) if the channel is
			/// force-closed now.
			case ClaimableOnChannelClose

			/// The channel has been closed, and the given balance is ours but awaiting confirmations until
			/// we consider it spendable.
			case ClaimableAwaitingConfirmations

			/// The channel has been closed, and the given balance should be ours but awaiting spending
			/// transaction confirmation. If the spending transaction does not confirm in time, it is
			/// possible our counterparty can take the funds by broadcasting an HTLC timeout on-chain.
			///
			/// Once the spending transaction confirms, before it has reached enough confirmations to be
			/// considered safe from chain reorganizations, the balance will instead be provided via
			/// [`Balance::ClaimableAwaitingConfirmations`].
			case ContentiousClaimable

			/// HTLCs which we sent to our counterparty which are claimable after a timeout (less on-chain
			/// fees) if the counterparty does not know the preimage for the HTLCs. These are somewhat
			/// likely to be claimed by our counterparty before we do.
			case MaybeTimeoutClaimableHTLC

			/// HTLCs which we received from our counterparty which are claimable with a preimage which we
			/// do not currently have. This will only be claimable if we receive the preimage from the node
			/// to which we forwarded this HTLC before the timeout.
			case MaybePreimageClaimableHTLC

			/// The channel has been closed, and our counterparty broadcasted a revoked commitment
			/// transaction.
			///
			/// Thus, we're able to claim all outputs in the commitment transaction, one of which has the
			/// following amount.
			case CounterpartyRevokedOutputClaimable

		}

		public func getValueType() -> BalanceType {
			switch self.cType!.tag {
				case LDKBalance_ClaimableOnChannelClose:
					return .ClaimableOnChannelClose

				case LDKBalance_ClaimableAwaitingConfirmations:
					return .ClaimableAwaitingConfirmations

				case LDKBalance_ContentiousClaimable:
					return .ContentiousClaimable

				case LDKBalance_MaybeTimeoutClaimableHTLC:
					return .MaybeTimeoutClaimableHTLC

				case LDKBalance_MaybePreimageClaimableHTLC:
					return .MaybePreimageClaimableHTLC

				case LDKBalance_CounterpartyRevokedOutputClaimable:
					return .CounterpartyRevokedOutputClaimable

				default:
					Bindings.print("Error: Invalid value type for Balance! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Balance
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Balance_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Balance
		internal func clone() -> Balance {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBalance>) in
					Balance_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ClaimableOnChannelClose-variant Balance
		public class func initWithClaimableOnChannelClose(
			amountSatoshis: UInt64, transactionFeeSatoshis: UInt64, outboundPaymentHtlcRoundedMsat: UInt64,
			outboundForwardedHtlcRoundedMsat: UInt64, inboundClaimingHtlcRoundedMsat: UInt64,
			inboundHtlcRoundedMsat: UInt64
		) -> Balance {
			// native call variable prep


			// native method call
			let nativeCallResult = Balance_claimable_on_channel_close(
				amountSatoshis, transactionFeeSatoshis, outboundPaymentHtlcRoundedMsat,
				outboundForwardedHtlcRoundedMsat, inboundClaimingHtlcRoundedMsat, inboundHtlcRoundedMsat)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ClaimableAwaitingConfirmations-variant Balance
		public class func initWithClaimableAwaitingConfirmations(
			amountSatoshis: UInt64, confirmationHeight: UInt32, source: BalanceSource
		) -> Balance {
			// native call variable prep


			// native method call
			let nativeCallResult = Balance_claimable_awaiting_confirmations(
				amountSatoshis, confirmationHeight, source.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ContentiousClaimable-variant Balance
		public class func initWithContentiousClaimable(
			amountSatoshis: UInt64, timeoutHeight: UInt32, paymentHash: [UInt8], paymentPreimage: [UInt8]
		) -> Balance {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Balance.swift::\(#function):\(#line)")

			let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(
				value: paymentPreimage, instantiationContext: "Balance.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Balance_contentious_claimable(
				amountSatoshis, timeoutHeight, paymentHashPrimitiveWrapper.cType!,
				paymentPreimagePrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentPreimagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new MaybeTimeoutClaimableHTLC-variant Balance
		public class func initWithMaybeTimeoutClaimableHtlc(
			amountSatoshis: UInt64, claimableHeight: UInt32, paymentHash: [UInt8], outboundPayment: Bool
		) -> Balance {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Balance.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Balance_maybe_timeout_claimable_htlc(
				amountSatoshis, claimableHeight, paymentHashPrimitiveWrapper.cType!, outboundPayment)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new MaybePreimageClaimableHTLC-variant Balance
		public class func initWithMaybePreimageClaimableHtlc(
			amountSatoshis: UInt64, expiryHeight: UInt32, paymentHash: [UInt8]
		) -> Balance {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Balance.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Balance_maybe_preimage_claimable_htlc(
				amountSatoshis, expiryHeight, paymentHashPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new CounterpartyRevokedOutputClaimable-variant Balance
		public class func initWithCounterpartyRevokedOutputClaimable(amountSatoshis: UInt64) -> Balance {
			// native call variable prep


			// native method call
			let nativeCallResult = Balance_counterparty_revoked_output_claimable(amountSatoshis)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Balance(
				cType: nativeCallResult, instantiationContext: "Balance.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Balances contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Balance, b: Balance) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBalance>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBalance>) in
						Balance_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount claimable, in satoshis.
		///
		/// For outbound payments, this excludes the balance from the possible HTLC timeout.
		///
		/// For forwarded payments, this includes the balance from the possible HTLC timeout as
		/// (to be conservative) that balance does not include routing fees we'd earn if we'd claim
		/// the balance from a preimage in a successful forward.
		///
		/// For more information on these balances see [`Balance::MaybeTimeoutClaimableHTLC`] and
		/// [`Balance::MaybePreimageClaimableHTLC`].
		///
		/// On-chain fees required to claim the balance are not included in this amount.
		public func claimableAmountSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBalance>) in
					Balance_claimable_amount_satoshis(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsClaimableOnChannelClose() -> ClaimableOnChannelClose? {
			if self.cType?.tag != LDKBalance_ClaimableOnChannelClose {
				return nil
			}

			return Balance_LDKClaimableOnChannelClose_Body(
				cType: self.cType!.claimable_on_channel_close,
				instantiationContext: "Balance.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsClaimableAwaitingConfirmations() -> ClaimableAwaitingConfirmations? {
			if self.cType?.tag != LDKBalance_ClaimableAwaitingConfirmations {
				return nil
			}

			return Balance_LDKClaimableAwaitingConfirmations_Body(
				cType: self.cType!.claimable_awaiting_confirmations,
				instantiationContext: "Balance.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsContentiousClaimable() -> ContentiousClaimable? {
			if self.cType?.tag != LDKBalance_ContentiousClaimable {
				return nil
			}

			return Balance_LDKContentiousClaimable_Body(
				cType: self.cType!.contentious_claimable, instantiationContext: "Balance.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsMaybeTimeoutClaimableHtlc() -> MaybeTimeoutClaimableHTLC? {
			if self.cType?.tag != LDKBalance_MaybeTimeoutClaimableHTLC {
				return nil
			}

			return Balance_LDKMaybeTimeoutClaimableHTLC_Body(
				cType: self.cType!.maybe_timeout_claimable_htlc,
				instantiationContext: "Balance.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsMaybePreimageClaimableHtlc() -> MaybePreimageClaimableHTLC? {
			if self.cType?.tag != LDKBalance_MaybePreimageClaimableHTLC {
				return nil
			}

			return Balance_LDKMaybePreimageClaimableHTLC_Body(
				cType: self.cType!.maybe_preimage_claimable_htlc,
				instantiationContext: "Balance.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsCounterpartyRevokedOutputClaimable() -> CounterpartyRevokedOutputClaimable? {
			if self.cType?.tag != LDKBalance_CounterpartyRevokedOutputClaimable {
				return nil
			}

			return Balance_LDKCounterpartyRevokedOutputClaimable_Body(
				cType: self.cType!.counterparty_revoked_output_claimable,
				instantiationContext: "Balance.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> Balance {
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
					Bindings.print("Freeing Balance \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Balance \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


		///
		internal typealias Balance_LDKClaimableOnChannelClose_Body = ClaimableOnChannelClose


		///
		public class ClaimableOnChannelClose: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKBalance_LDKClaimableOnChannelClose_Body?

			internal init(cType: LDKBalance_LDKClaimableOnChannelClose_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKBalance_LDKClaimableOnChannelClose_Body, instantiationContext: String,
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
				cType: LDKBalance_LDKClaimableOnChannelClose_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount available to claim, in satoshis, excluding the on-chain fees which will be
			/// required to do so.
			public func getAmountSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_satoshis

				return returnValue
			}

			/// The transaction fee we pay for the closing commitment transaction. This amount is not
			/// included in the [`Balance::ClaimableOnChannelClose::amount_satoshis`] value.
			///
			/// Note that if this channel is inbound (and thus our counterparty pays the commitment
			/// transaction fee) this value will be zero. For [`ChannelMonitor`]s created prior to LDK
			/// 0.0.124, the channel is always treated as outbound (and thus this value is never zero).
			public func getTransactionFeeSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.transaction_fee_satoshis

				return returnValue
			}

			/// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
			/// from us and are related to a payment which was sent by us. This is the sum of the
			/// millisatoshis part of all HTLCs which are otherwise represented by
			/// [`Balance::MaybeTimeoutClaimableHTLC`] with their
			/// [`Balance::MaybeTimeoutClaimableHTLC::outbound_payment`] flag set, as well as any dust
			/// HTLCs which would otherwise be represented the same.
			///
			/// This amount (rounded up to a whole satoshi value) will not be included in `amount_satoshis`.
			public func getOutboundPaymentHtlcRoundedMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.outbound_payment_htlc_rounded_msat

				return returnValue
			}

			/// The amount of millisatoshis which has been burned to fees from HTLCs which are outbound
			/// from us and are related to a forwarded HTLC. This is the sum of the millisatoshis part
			/// of all HTLCs which are otherwise represented by [`Balance::MaybeTimeoutClaimableHTLC`]
			/// with their [`Balance::MaybeTimeoutClaimableHTLC::outbound_payment`] flag *not* set, as
			/// well as any dust HTLCs which would otherwise be represented the same.
			///
			/// This amount (rounded up to a whole satoshi value) will not be included in `amount_satoshis`.
			public func getOutboundForwardedHtlcRoundedMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.outbound_forwarded_htlc_rounded_msat

				return returnValue
			}

			/// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
			/// to us and for which we know the preimage. This is the sum of the millisatoshis part of
			/// all HTLCs which would be represented by [`Balance::ContentiousClaimable`] on channel
			/// close, but whose current value is included in
			/// [`Balance::ClaimableOnChannelClose::amount_satoshis`], as well as any dust HTLCs which
			/// would otherwise be represented the same.
			///
			/// This amount (rounded up to a whole satoshi value) will not be included in the counterparty's
			/// `amount_satoshis`.
			public func getInboundClaimingHtlcRoundedMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.inbound_claiming_htlc_rounded_msat

				return returnValue
			}

			/// The amount of millisatoshis which has been burned to fees from HTLCs which are inbound
			/// to us and for which we do not know the preimage. This is the sum of the millisatoshis
			/// part of all HTLCs which would be represented by [`Balance::MaybePreimageClaimableHTLC`]
			/// on channel close, as well as any dust HTLCs which would otherwise be represented the
			/// same.
			///
			/// This amount (rounded up to a whole satoshi value) will not be included in the counterparty's
			/// `amount_satoshis`.
			public func getInboundHtlcRoundedMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.inbound_htlc_rounded_msat

				return returnValue
			}


		}


		///
		internal typealias Balance_LDKClaimableAwaitingConfirmations_Body = ClaimableAwaitingConfirmations


		///
		public class ClaimableAwaitingConfirmations: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body?

			internal init(cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body, instantiationContext: String,
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
				cType: LDKBalance_LDKClaimableAwaitingConfirmations_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount available to claim, in satoshis, possibly excluding the on-chain fees which
			/// were spent in broadcasting the transaction.
			public func getAmountSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_satoshis

				return returnValue
			}

			/// The height at which an [`Event::SpendableOutputs`] event will be generated for this
			/// amount.
			public func getConfirmationHeight() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.confirmation_height

				return returnValue
			}

			/// Whether this balance is a result of cooperative close, a force-close, or an HTLC.
			public func getSource() -> BalanceSource {
				// return value (do some wrapping)
				let returnValue = BalanceSource(value: self.cType!.source)

				return returnValue
			}


		}


		///
		internal typealias Balance_LDKContentiousClaimable_Body = ContentiousClaimable


		///
		public class ContentiousClaimable: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKBalance_LDKContentiousClaimable_Body?

			internal init(cType: LDKBalance_LDKContentiousClaimable_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKBalance_LDKContentiousClaimable_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKBalance_LDKContentiousClaimable_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount available to claim, in satoshis, excluding the on-chain fees which will be
			/// required to do so.
			public func getAmountSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_satoshis

				return returnValue
			}

			/// The height at which the counterparty may be able to claim the balance if we have not
			/// done so.
			public func getTimeoutHeight() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.timeout_height

				return returnValue
			}

			/// The payment hash that locks this HTLC.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Balance.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The preimage that can be used to claim this HTLC.
			public func getPaymentPreimage() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_preimage, instantiationContext: "Balance.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Balance_LDKMaybeTimeoutClaimableHTLC_Body = MaybeTimeoutClaimableHTLC


		///
		public class MaybeTimeoutClaimableHTLC: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body?

			internal init(cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body, instantiationContext: String,
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
				cType: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount potentially available to claim, in satoshis, excluding the on-chain fees
			/// which will be required to do so.
			public func getAmountSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_satoshis

				return returnValue
			}

			/// The height at which we will be able to claim the balance if our counterparty has not
			/// done so.
			public func getClaimableHeight() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.claimable_height

				return returnValue
			}

			/// The payment hash whose preimage our counterparty needs to claim this HTLC.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Balance.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Whether this HTLC represents a payment which was sent outbound from us. Otherwise it
			/// represents an HTLC which was forwarded (and should, thus, have a corresponding inbound
			/// edge on another channel).
			public func getOutboundPayment() -> Bool {
				// return value (do some wrapping)
				let returnValue = self.cType!.outbound_payment

				return returnValue
			}


		}


		///
		internal typealias Balance_LDKMaybePreimageClaimableHTLC_Body = MaybePreimageClaimableHTLC


		///
		public class MaybePreimageClaimableHTLC: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body?

			internal init(cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body, instantiationContext: String,
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
				cType: LDKBalance_LDKMaybePreimageClaimableHTLC_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount potentially available to claim, in satoshis, excluding the on-chain fees
			/// which will be required to do so.
			public func getAmountSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_satoshis

				return returnValue
			}

			/// The height at which our counterparty will be able to claim the balance if we have not
			/// yet received the preimage and claimed it ourselves.
			public func getExpiryHeight() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.expiry_height

				return returnValue
			}

			/// The payment hash whose preimage we need to claim this HTLC.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Balance.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Balance_LDKCounterpartyRevokedOutputClaimable_Body = CounterpartyRevokedOutputClaimable


		///
		public class CounterpartyRevokedOutputClaimable: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body?

			internal init(cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body, instantiationContext: String,
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
				cType: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The amount, in satoshis, of the output which we can claim.
			///
			/// Note that for outputs from HTLC balances this may be excluding some on-chain fees that
			/// were already spent.
			public func getAmountSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_satoshis

				return returnValue
			}


		}


	}

}
