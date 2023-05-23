#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Configuration we set when applicable.
///
/// Default::default() provides sane defaults.
public typealias ChannelHandshakeConfig = Bindings.ChannelHandshakeConfig

extension Bindings {


	/// Configuration we set when applicable.
	///
	/// Default::default() provides sane defaults.
	public class ChannelHandshakeConfig: NativeTypeWrapper {

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

		internal var cType: LDKChannelHandshakeConfig?

		internal init(cType: LDKChannelHandshakeConfig, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelHandshakeConfig, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelHandshakeConfig, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the ChannelHandshakeConfig, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelHandshakeConfig_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Confirmations we will wait for before considering the channel locked in.
		/// Applied only for inbound channels (see ChannelHandshakeLimits::max_minimum_depth for the
		/// equivalent limit applied to outbound channels).
		///
		/// A lower-bound of 1 is applied, requiring all channels to have a confirmed commitment
		/// transaction before operation. If you wish to accept channels with zero confirmations, see
		/// [`UserConfig::manually_accept_inbound_channels`] and
		/// [`ChannelManager::accept_inbound_channel_from_trusted_peer_0conf`].
		///
		/// Default value: 6.
		///
		/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
		/// [`ChannelManager::accept_inbound_channel_from_trusted_peer_0conf`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel_from_trusted_peer_0conf
		public func getMinimumDepth() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_minimum_depth(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Confirmations we will wait for before considering the channel locked in.
		/// Applied only for inbound channels (see ChannelHandshakeLimits::max_minimum_depth for the
		/// equivalent limit applied to outbound channels).
		///
		/// A lower-bound of 1 is applied, requiring all channels to have a confirmed commitment
		/// transaction before operation. If you wish to accept channels with zero confirmations, see
		/// [`UserConfig::manually_accept_inbound_channels`] and
		/// [`ChannelManager::accept_inbound_channel_from_trusted_peer_0conf`].
		///
		/// Default value: 6.
		///
		/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
		/// [`ChannelManager::accept_inbound_channel_from_trusted_peer_0conf`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel_from_trusted_peer_0conf
		public func setMinimumDepth(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_minimum_depth(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Set to the number of blocks we require our counterparty to wait to claim their money (ie
		/// the number of blocks we have to punish our counterparty if they broadcast a revoked
		/// transaction).
		///
		/// This is one of the main parameters of our security model. We (or one of our watchtowers) MUST
		/// be online to check for revoked transactions on-chain at least once every our_to_self_delay
		/// blocks (minus some margin to allow us enough time to broadcast and confirm a transaction,
		/// possibly with time in between to RBF the spending transaction).
		///
		/// Meanwhile, asking for a too high delay, we bother peer to freeze funds for nothing in
		/// case of an honest unilateral channel close, which implicitly decrease the economic value of
		/// our channel.
		///
		/// Default value: [`BREAKDOWN_TIMEOUT`], we enforce it as a minimum at channel opening so you
		/// can tweak config to ask for more security, not less.
		public func getOurToSelfDelay() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_our_to_self_delay(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Set to the number of blocks we require our counterparty to wait to claim their money (ie
		/// the number of blocks we have to punish our counterparty if they broadcast a revoked
		/// transaction).
		///
		/// This is one of the main parameters of our security model. We (or one of our watchtowers) MUST
		/// be online to check for revoked transactions on-chain at least once every our_to_self_delay
		/// blocks (minus some margin to allow us enough time to broadcast and confirm a transaction,
		/// possibly with time in between to RBF the spending transaction).
		///
		/// Meanwhile, asking for a too high delay, we bother peer to freeze funds for nothing in
		/// case of an honest unilateral channel close, which implicitly decrease the economic value of
		/// our channel.
		///
		/// Default value: [`BREAKDOWN_TIMEOUT`], we enforce it as a minimum at channel opening so you
		/// can tweak config to ask for more security, not less.
		public func setOurToSelfDelay(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_our_to_self_delay(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Set to the smallest value HTLC we will accept to process.
		///
		/// This value is sent to our counterparty on channel-open and we close the channel any time
		/// our counterparty misbehaves by sending us an HTLC with a value smaller than this.
		///
		/// Default value: 1. If the value is less than 1, it is ignored and set to 1, as is required
		/// by the protocol.
		public func getOurHtlcMinimumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_our_htlc_minimum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Set to the smallest value HTLC we will accept to process.
		///
		/// This value is sent to our counterparty on channel-open and we close the channel any time
		/// our counterparty misbehaves by sending us an HTLC with a value smaller than this.
		///
		/// Default value: 1. If the value is less than 1, it is ignored and set to 1, as is required
		/// by the protocol.
		public func setOurHtlcMinimumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_our_htlc_minimum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the percentage of the channel value we will cap the total value of outstanding inbound
		/// HTLCs to.
		///
		/// This can be set to a value between 1-100, where the value corresponds to the percent of the
		/// channel value in whole percentages.
		///
		/// Note that:
		/// * If configured to another value than the default value 10, any new channels created with
		/// the non default value will cause versions of LDK prior to 0.0.104 to refuse to read the
		/// `ChannelManager`.
		///
		/// * This caps the total value for inbound HTLCs in-flight only, and there's currently
		/// no way to configure the cap for the total value of outbound HTLCs in-flight.
		///
		/// * The requirements for your node being online to ensure the safety of HTLC-encumbered funds
		/// are different from the non-HTLC-encumbered funds. This makes this an important knob to
		/// restrict exposure to loss due to being offline for too long.
		/// See [`ChannelHandshakeConfig::our_to_self_delay`] and [`ChannelConfig::cltv_expiry_delta`]
		/// for more information.
		///
		/// Default value: 10.
		/// Minimum value: 1, any values less than 1 will be treated as 1 instead.
		/// Maximum value: 100, any values larger than 100 will be treated as 100 instead.
		public func getMaxInboundHtlcValueInFlightPercentOfChannel() -> UInt8 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_max_inbound_htlc_value_in_flight_percent_of_channel(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets the percentage of the channel value we will cap the total value of outstanding inbound
		/// HTLCs to.
		///
		/// This can be set to a value between 1-100, where the value corresponds to the percent of the
		/// channel value in whole percentages.
		///
		/// Note that:
		/// * If configured to another value than the default value 10, any new channels created with
		/// the non default value will cause versions of LDK prior to 0.0.104 to refuse to read the
		/// `ChannelManager`.
		///
		/// * This caps the total value for inbound HTLCs in-flight only, and there's currently
		/// no way to configure the cap for the total value of outbound HTLCs in-flight.
		///
		/// * The requirements for your node being online to ensure the safety of HTLC-encumbered funds
		/// are different from the non-HTLC-encumbered funds. This makes this an important knob to
		/// restrict exposure to loss due to being offline for too long.
		/// See [`ChannelHandshakeConfig::our_to_self_delay`] and [`ChannelConfig::cltv_expiry_delta`]
		/// for more information.
		///
		/// Default value: 10.
		/// Minimum value: 1, any values less than 1 will be treated as 1 instead.
		/// Maximum value: 100, any values larger than 100 will be treated as 100 instead.
		public func setMaxInboundHtlcValueInFlightPercentOfChannel(val: UInt8) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_max_inbound_htlc_value_in_flight_percent_of_channel(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If set, we attempt to negotiate the `scid_privacy` (referred to as `scid_alias` in the
		/// BOLTs) option for outbound private channels. This provides better privacy by not including
		/// our real on-chain channel UTXO in each invoice and requiring that our counterparty only
		/// relay HTLCs to us using the channel's SCID alias.
		///
		/// If this option is set, channels may be created that will not be readable by LDK versions
		/// prior to 0.0.106, causing [`ChannelManager`]'s read method to return a
		/// [`DecodeError::InvalidValue`].
		///
		/// Note that setting this to true does *not* prevent us from opening channels with
		/// counterparties that do not support the `scid_alias` option; we will simply fall back to a
		/// private channel without that option.
		///
		/// Ignored if the channel is negotiated to be announced, see
		/// [`ChannelHandshakeConfig::announced_channel`] and
		/// [`ChannelHandshakeLimits::force_announced_channel_preference`] for more.
		///
		/// Default value: false. This value is likely to change to true in the future.
		///
		/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
		/// [`DecodeError::InvalidValue`]: crate::ln::msgs::DecodeError::InvalidValue
		public func getNegotiateScidPrivacy() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_negotiate_scid_privacy(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If set, we attempt to negotiate the `scid_privacy` (referred to as `scid_alias` in the
		/// BOLTs) option for outbound private channels. This provides better privacy by not including
		/// our real on-chain channel UTXO in each invoice and requiring that our counterparty only
		/// relay HTLCs to us using the channel's SCID alias.
		///
		/// If this option is set, channels may be created that will not be readable by LDK versions
		/// prior to 0.0.106, causing [`ChannelManager`]'s read method to return a
		/// [`DecodeError::InvalidValue`].
		///
		/// Note that setting this to true does *not* prevent us from opening channels with
		/// counterparties that do not support the `scid_alias` option; we will simply fall back to a
		/// private channel without that option.
		///
		/// Ignored if the channel is negotiated to be announced, see
		/// [`ChannelHandshakeConfig::announced_channel`] and
		/// [`ChannelHandshakeLimits::force_announced_channel_preference`] for more.
		///
		/// Default value: false. This value is likely to change to true in the future.
		///
		/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
		/// [`DecodeError::InvalidValue`]: crate::ln::msgs::DecodeError::InvalidValue
		public func setNegotiateScidPrivacy(val: Bool) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_negotiate_scid_privacy(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Set to announce the channel publicly and notify all nodes that they can route via this
		/// channel.
		///
		/// This should only be set to true for nodes which expect to be online reliably.
		///
		/// As the node which funds a channel picks this value this will only apply for new outbound
		/// channels unless [`ChannelHandshakeLimits::force_announced_channel_preference`] is set.
		///
		/// Default value: false.
		public func getAnnouncedChannel() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_announced_channel(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Set to announce the channel publicly and notify all nodes that they can route via this
		/// channel.
		///
		/// This should only be set to true for nodes which expect to be online reliably.
		///
		/// As the node which funds a channel picks this value this will only apply for new outbound
		/// channels unless [`ChannelHandshakeLimits::force_announced_channel_preference`] is set.
		///
		/// Default value: false.
		public func setAnnouncedChannel(val: Bool) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_announced_channel(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// When set, we commit to an upfront shutdown_pubkey at channel open. If our counterparty
		/// supports it, they will then enforce the mutual-close output to us matches what we provided
		/// at intialization, preventing us from closing to an alternate pubkey.
		///
		/// This is set to true by default to provide a slight increase in security, though ultimately
		/// any attacker who is able to take control of a channel can just as easily send the funds via
		/// lightning payments, so we never require that our counterparties support this option.
		///
		/// The upfront key committed is provided from [`SignerProvider::get_shutdown_scriptpubkey`].
		///
		/// Default value: true.
		///
		/// [`SignerProvider::get_shutdown_scriptpubkey`]: crate::chain::keysinterface::SignerProvider::get_shutdown_scriptpubkey
		public func getCommitUpfrontShutdownPubkey() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_commit_upfront_shutdown_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// When set, we commit to an upfront shutdown_pubkey at channel open. If our counterparty
		/// supports it, they will then enforce the mutual-close output to us matches what we provided
		/// at intialization, preventing us from closing to an alternate pubkey.
		///
		/// This is set to true by default to provide a slight increase in security, though ultimately
		/// any attacker who is able to take control of a channel can just as easily send the funds via
		/// lightning payments, so we never require that our counterparties support this option.
		///
		/// The upfront key committed is provided from [`SignerProvider::get_shutdown_scriptpubkey`].
		///
		/// Default value: true.
		///
		/// [`SignerProvider::get_shutdown_scriptpubkey`]: crate::chain::keysinterface::SignerProvider::get_shutdown_scriptpubkey
		public func setCommitUpfrontShutdownPubkey(val: Bool) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_commit_upfront_shutdown_pubkey(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The Proportion of the channel value to configure as counterparty's channel reserve,
		/// i.e., `their_channel_reserve_satoshis` for both outbound and inbound channels.
		///
		/// `their_channel_reserve_satoshis` is the minimum balance that the other node has to maintain
		/// on their side, at all times.
		/// This ensures that if our counterparty broadcasts a revoked state, we can punish them by
		/// claiming at least this value on chain.
		///
		/// Channel reserve values greater than 30% could be considered highly unreasonable, since that
		/// amount can never be used for payments.
		/// Also, if our selected channel reserve for counterparty and counterparty's selected
		/// channel reserve for us sum up to equal or greater than channel value, channel negotiations
		/// will fail.
		///
		/// Note: Versions of LDK earlier than v0.0.104 will fail to read channels with any channel reserve
		/// other than the default value.
		///
		/// Default value: 1% of channel value, i.e., configured as 10,000 millionths.
		/// Minimum value: If the calculated proportional value is less than 1000 sats, it will be treated
		/// as 1000 sats instead, which is a safe implementation-specific lower bound.
		/// Maximum value: 1,000,000, any values larger than 1 Million will be treated as 1 Million (or 100%)
		/// instead, although channel negotiations will fail in that case.
		public func getTheirChannelReserveProportionalMillionths() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_their_channel_reserve_proportional_millionths(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The Proportion of the channel value to configure as counterparty's channel reserve,
		/// i.e., `their_channel_reserve_satoshis` for both outbound and inbound channels.
		///
		/// `their_channel_reserve_satoshis` is the minimum balance that the other node has to maintain
		/// on their side, at all times.
		/// This ensures that if our counterparty broadcasts a revoked state, we can punish them by
		/// claiming at least this value on chain.
		///
		/// Channel reserve values greater than 30% could be considered highly unreasonable, since that
		/// amount can never be used for payments.
		/// Also, if our selected channel reserve for counterparty and counterparty's selected
		/// channel reserve for us sum up to equal or greater than channel value, channel negotiations
		/// will fail.
		///
		/// Note: Versions of LDK earlier than v0.0.104 will fail to read channels with any channel reserve
		/// other than the default value.
		///
		/// Default value: 1% of channel value, i.e., configured as 10,000 millionths.
		/// Minimum value: If the calculated proportional value is less than 1000 sats, it will be treated
		/// as 1000 sats instead, which is a safe implementation-specific lower bound.
		/// Maximum value: 1,000,000, any values larger than 1 Million will be treated as 1 Million (or 100%)
		/// instead, although channel negotiations will fail in that case.
		public func setTheirChannelReserveProportionalMillionths(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_their_channel_reserve_proportional_millionths(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of HTLCs in-flight from our counterparty towards us at the same time.
		///
		/// Increasing the value can help improve liquidity and stability in
		/// routing at the cost of higher long term disk / DB usage.
		///
		/// Note: Versions of LDK earlier than v0.0.115 will fail to read channels with a configuration
		/// other than the default value.
		///
		/// Default value: 50
		/// Maximum value: 483, any values larger will be treated as 483.
		/// This is the BOLT #2 spec limit on `max_accepted_htlcs`.
		public func getOurMaxAcceptedHtlcs() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_get_our_max_accepted_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of HTLCs in-flight from our counterparty towards us at the same time.
		///
		/// Increasing the value can help improve liquidity and stability in
		/// routing at the cost of higher long term disk / DB usage.
		///
		/// Note: Versions of LDK earlier than v0.0.115 will fail to read channels with a configuration
		/// other than the default value.
		///
		/// Default value: 50
		/// Maximum value: 483, any values larger will be treated as 483.
		/// This is the BOLT #2 spec limit on `max_accepted_htlcs`.
		public func setOurMaxAcceptedHtlcs(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_set_our_max_accepted_htlcs(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ChannelHandshakeConfig given each field
		public init(
			minimumDepthArg: UInt32, ourToSelfDelayArg: UInt16, ourHtlcMinimumMsatArg: UInt64,
			maxInboundHtlcValueInFlightPercentOfChannelArg: UInt8, negotiateScidPrivacyArg: Bool,
			announcedChannelArg: Bool, commitUpfrontShutdownPubkeyArg: Bool,
			theirChannelReserveProportionalMillionthsArg: UInt32, ourMaxAcceptedHtlcsArg: UInt16
		) {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelHandshakeConfig_new(
				minimumDepthArg, ourToSelfDelayArg, ourHtlcMinimumMsatArg,
				maxInboundHtlcValueInFlightPercentOfChannelArg, negotiateScidPrivacyArg, announcedChannelArg,
				commitUpfrontShutdownPubkeyArg, theirChannelReserveProportionalMillionthsArg, ourMaxAcceptedHtlcsArg)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ChannelHandshakeConfig(cType: nativeCallResult, instantiationContext: "ChannelHandshakeConfig.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ChannelHandshakeConfig.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ChannelHandshakeConfig
		internal func clone() -> ChannelHandshakeConfig {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
					ChannelHandshakeConfig_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelHandshakeConfig(
				cType: nativeCallResult, instantiationContext: "ChannelHandshakeConfig.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a "default" ChannelHandshakeConfig. See struct and individual field documentaiton for details on which values are used.
		public class func initWithDefault() -> ChannelHandshakeConfig {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelHandshakeConfig_default()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelHandshakeConfig(
				cType: nativeCallResult, instantiationContext: "ChannelHandshakeConfig.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> ChannelHandshakeConfig {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> ChannelHandshakeConfig {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ChannelHandshakeConfig {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ChannelHandshakeConfig {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelHandshakeConfig {
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
						"Freeing ChannelHandshakeConfig \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelHandshakeConfig \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

