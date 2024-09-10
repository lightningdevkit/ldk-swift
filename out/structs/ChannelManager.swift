#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A lightning node's channel state machine and payment management logic, which facilitates
/// sending, forwarding, and receiving payments through lightning channels.
///
/// [`ChannelManager`] is parameterized by a number of components to achieve this.
/// - [`chain::Watch`] (typically [`ChainMonitor`]) for on-chain monitoring and enforcement of each
/// channel
/// - [`BroadcasterInterface`] for broadcasting transactions related to opening, funding, and
/// closing channels
/// - [`EntropySource`] for providing random data needed for cryptographic operations
/// - [`NodeSigner`] for cryptographic operations scoped to the node
/// - [`SignerProvider`] for providing signers whose operations are scoped to individual channels
/// - [`FeeEstimator`] to determine transaction fee rates needed to have a transaction mined in a
/// timely manner
/// - [`Router`] for finding payment paths when initiating and retrying payments
/// - [`Logger`] for logging operational information of varying degrees
///
/// Additionally, it implements the following traits:
/// - [`ChannelMessageHandler`] to handle off-chain channel activity from peers
/// - [`MessageSendEventsProvider`] to similarly send such messages to peers
/// - [`OffersMessageHandler`] for BOLT 12 message handling and sending
/// - [`EventsProvider`] to generate user-actionable [`Event`]s
/// - [`chain::Listen`] and [`chain::Confirm`] for notification of on-chain activity
///
/// Thus, [`ChannelManager`] is typically used to parameterize a [`MessageHandler`] and an
/// [`OnionMessenger`]. The latter is required to support BOLT 12 functionality.
///
/// # `ChannelManager` vs `ChannelMonitor`
///
/// It's important to distinguish between the *off-chain* management and *on-chain* enforcement of
/// lightning channels. [`ChannelManager`] exchanges messages with peers to manage the off-chain
/// state of each channel. During this process, it generates a [`ChannelMonitor`] for each channel
/// and a [`ChannelMonitorUpdate`] for each relevant change, notifying its parameterized
/// [`chain::Watch`] of them.
///
/// An implementation of [`chain::Watch`], such as [`ChainMonitor`], is responsible for aggregating
/// these [`ChannelMonitor`]s and applying any [`ChannelMonitorUpdate`]s to them. It then monitors
/// for any pertinent on-chain activity, enforcing claims as needed.
///
/// This division of off-chain management and on-chain enforcement allows for interesting node
/// setups. For instance, on-chain enforcement could be moved to a separate host or have added
/// redundancy, possibly as a watchtower. See [`chain::Watch`] for the relevant interface.
///
/// # Initialization
///
/// Use [`ChannelManager::new`] with the most recent [`BlockHash`] when creating a fresh instance.
/// Otherwise, if restarting, construct [`ChannelManagerReadArgs`] with the necessary parameters and
/// references to any deserialized [`ChannelMonitor`]s that were previously persisted. Use this to
/// deserialize the [`ChannelManager`] and feed it any new chain data since it was last online, as
/// detailed in the [`ChannelManagerReadArgs`] documentation.
///
/// ```
/// use bitcoin::BlockHash;
/// use bitcoin::network::Network;
/// use lightning::chain::BestBlock;
/// # use lightning::chain::channelmonitor::ChannelMonitor;
/// use lightning::ln::channelmanager::{ChainParameters, ChannelManager, ChannelManagerReadArgs};
/// # use lightning::routing::gossip::NetworkGraph;
/// use lightning::util::config::UserConfig;
/// use lightning::util::ser::ReadableArgs;
///
/// # fn read_channel_monitors() -> Vec<ChannelMonitor<lightning::sign::InMemorySigner>> { vec![] }
/// # fn example<
/// #     'a,
/// #     L: lightning::util::logger::Logger,
/// #     ES: lightning::sign::EntropySource,
/// #     S: for <'b> lightning::routing::scoring::LockableScore<'b, ScoreLookUp = SL>,
/// #     SL: lightning::routing::scoring::ScoreLookUp<ScoreParams = SP>,
/// #     SP: Sized,
/// #     R: lightning::io::Read,
/// # >(
/// #     fee_estimator: &dyn lightning::chain::chaininterface::FeeEstimator,
/// #     chain_monitor: &dyn lightning::chain::Watch<lightning::sign::InMemorySigner>,
/// #     tx_broadcaster: &dyn lightning::chain::chaininterface::BroadcasterInterface,
/// #     router: &lightning::routing::router::DefaultRouter<&NetworkGraph<&'a L>, &'a L, &ES, &S, SP, SL>,
/// #     logger: &L,
/// #     entropy_source: &ES,
/// #     node_signer: &dyn lightning::sign::NodeSigner,
/// #     signer_provider: &lightning::sign::DynSignerProvider,
/// #     best_block: lightning::chain::BestBlock,
/// #     current_timestamp: u32,
/// #     mut reader: R,
/// # ) -> Result<(), lightning::ln::msgs::DecodeError> {
/// // Fresh start with no channels
/// let params = ChainParameters {
/// network: Network::Bitcoin,
/// best_block,
/// };
/// let default_config = UserConfig::default();
/// let channel_manager = ChannelManager::new(
/// fee_estimator, chain_monitor, tx_broadcaster, router, logger, entropy_source, node_signer,
/// signer_provider, default_config, params, current_timestamp
/// );
///
/// // Restart from deserialized data
/// let mut channel_monitors = read_channel_monitors();
/// let args = ChannelManagerReadArgs::new(
/// entropy_source, node_signer, signer_provider, fee_estimator, chain_monitor, tx_broadcaster,
/// router, logger, default_config, channel_monitors.iter_mut().collect()
/// );
/// let (block_hash, channel_manager) =
/// <(BlockHash, ChannelManager<_, _, _, _, _, _, _, _>)>::read(&mut reader, args)?;
///
/// // Update the ChannelManager and ChannelMonitors with the latest chain data
/// // ...
///
/// // Move the monitors to the ChannelManager's chain::Watch parameter
/// for monitor in channel_monitors {
/// chain_monitor.watch_channel(monitor.get_funding_txo().0, monitor);
/// }
/// # Ok(())
/// # }
/// ```
///
/// # Operation
///
/// The following is required for [`ChannelManager`] to function properly:
/// - Handle messages from peers using its [`ChannelMessageHandler`] implementation (typically
/// called by [`PeerManager::read_event`] when processing network I/O)
/// - Send messages to peers obtained via its [`MessageSendEventsProvider`] implementation
/// (typically initiated when [`PeerManager::process_events`] is called)
/// - Feed on-chain activity using either its [`chain::Listen`] or [`chain::Confirm`] implementation
/// as documented by those traits
/// - Perform any periodic channel and payment checks by calling [`timer_tick_occurred`] roughly
/// every minute
/// - Persist to disk whenever [`get_and_clear_needs_persistence`] returns `true` using a
/// [`Persister`] such as a [`KVStore`] implementation
/// - Handle [`Event`]s obtained via its [`EventsProvider`] implementation
///
/// The [`Future`] returned by [`get_event_or_persistence_needed_future`] is useful in determining
/// when the last two requirements need to be checked.
///
/// The [`lightning-block-sync`] and [`lightning-transaction-sync`] crates provide utilities that
/// simplify feeding in on-chain activity using the [`chain::Listen`] and [`chain::Confirm`] traits,
/// respectively. The remaining requirements can be met using the [`lightning-background-processor`]
/// crate. For languages other than Rust, the availability of similar utilities may vary.
///
/// # Channels
///
/// [`ChannelManager`]'s primary function involves managing a channel state. Without channels,
/// payments can't be sent. Use [`list_channels`] or [`list_usable_channels`] for a snapshot of the
/// currently open channels.
///
/// ```
/// # use lightning::ln::channelmanager::AChannelManager;
/// #
/// # fn example<T: AChannelManager>(channel_manager: T) {
/// # let channel_manager = channel_manager.get_cm();
/// let channels = channel_manager.list_usable_channels();
/// for details in channels {
/// println!(\"{:?}\", details);
/// }
/// # }
/// ```
///
/// Each channel is identified using a [`ChannelId`], which will change throughout the channel's
/// life cycle. Additionally, channels are assigned a `user_channel_id`, which is given in
/// [`Event`]s associated with the channel and serves as a fixed identifier but is otherwise unused
/// by [`ChannelManager`].
///
/// ## Opening Channels
///
/// To an open a channel with a peer, call [`create_channel`]. This will initiate the process of
/// opening an outbound channel, which requires self-funding when handling
/// [`Event::FundingGenerationReady`].
///
/// ```
/// # use bitcoin::{ScriptBuf, Transaction};
/// # use bitcoin::secp256k1::PublicKey;
/// # use lightning::ln::channelmanager::AChannelManager;
/// # use lightning::events::{Event, EventsProvider};
/// #
/// # trait Wallet {
/// #     fn create_funding_transaction(
/// #         &self, _amount_sats: u64, _output_script: ScriptBuf
/// #     ) -> Transaction;
/// # }
/// #
/// # fn example<T: AChannelManager, W: Wallet>(channel_manager: T, wallet: W, peer_id: PublicKey) {
/// # let channel_manager = channel_manager.get_cm();
/// let value_sats = 1_000_000;
/// let push_msats = 10_000_000;
/// match channel_manager.create_channel(peer_id, value_sats, push_msats, 42, None, None) {
/// Ok(channel_id) => println!(\"Opening channel {}\", channel_id),
/// Err(e) => println!(\"Error opening channel: {:?}\", e),
/// }
///
/// // On the event processing thread once the peer has responded
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::FundingGenerationReady {
/// temporary_channel_id, counterparty_node_id, channel_value_satoshis, output_script,
/// user_channel_id, ..
/// } => {
/// assert_eq!(user_channel_id, 42);
/// let funding_transaction = wallet.create_funding_transaction(
/// channel_value_satoshis, output_script
/// );
/// match channel_manager.funding_transaction_generated(
/// temporary_channel_id, counterparty_node_id, funding_transaction
/// ) {
/// Ok(()) => println!(\"Funding channel {}\", temporary_channel_id),
/// Err(e) => println!(\"Error funding channel {}: {:?}\", temporary_channel_id, e),
/// }
/// },
/// Event::ChannelPending { channel_id, user_channel_id, former_temporary_channel_id, .. } => {
/// assert_eq!(user_channel_id, 42);
/// println!(
/// \"Channel {} now {} pending (funding transaction has been broadcasted)\", channel_id,
/// former_temporary_channel_id.unwrap()
/// );
/// },
/// Event::ChannelReady { channel_id, user_channel_id, .. } => {
/// assert_eq!(user_channel_id, 42);
/// println!(\"Channel {} ready\", channel_id);
/// },
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// ## Accepting Channels
///
/// Inbound channels are initiated by peers and are automatically accepted unless [`ChannelManager`]
/// has [`UserConfig::manually_accept_inbound_channels`] set. In that case, the channel may be
/// either accepted or rejected when handling [`Event::OpenChannelRequest`].
///
/// ```
/// # use bitcoin::secp256k1::PublicKey;
/// # use lightning::ln::channelmanager::AChannelManager;
/// # use lightning::events::{Event, EventsProvider};
/// #
/// # fn is_trusted(counterparty_node_id: PublicKey) -> bool {
/// #     // ...
/// #     unimplemented!()
/// # }
/// #
/// # fn example<T: AChannelManager>(channel_manager: T) {
/// # let channel_manager = channel_manager.get_cm();
/// # let error_message = \"Channel force-closed\";
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::OpenChannelRequest { temporary_channel_id, counterparty_node_id, ..  } => {
/// if !is_trusted(counterparty_node_id) {
/// match channel_manager.force_close_without_broadcasting_txn(
/// &temporary_channel_id, &counterparty_node_id, error_message.to_string()
/// ) {
/// Ok(()) => println!(\"Rejecting channel {}\", temporary_channel_id),
/// Err(e) => println!(\"Error rejecting channel {}: {:?}\", temporary_channel_id, e),
/// }
/// return Ok(());
/// }
///
/// let user_channel_id = 43;
/// match channel_manager.accept_inbound_channel(
/// &temporary_channel_id, &counterparty_node_id, user_channel_id
/// ) {
/// Ok(()) => println!(\"Accepting channel {}\", temporary_channel_id),
/// Err(e) => println!(\"Error accepting channel {}: {:?}\", temporary_channel_id, e),
/// }
/// },
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// ## Closing Channels
///
/// There are two ways to close a channel: either cooperatively using [`close_channel`] or
/// unilaterally using [`force_close_broadcasting_latest_txn`]. The former is ideal as it makes for
/// lower fees and immediate access to funds. However, the latter may be necessary if the
/// counterparty isn't behaving properly or has gone offline. [`Event::ChannelClosed`] is generated
/// once the channel has been closed successfully.
///
/// ```
/// # use bitcoin::secp256k1::PublicKey;
/// # use lightning::ln::types::ChannelId;
/// # use lightning::ln::channelmanager::AChannelManager;
/// # use lightning::events::{Event, EventsProvider};
/// #
/// # fn example<T: AChannelManager>(
/// #     channel_manager: T, channel_id: ChannelId, counterparty_node_id: PublicKey
/// # ) {
/// # let channel_manager = channel_manager.get_cm();
/// match channel_manager.close_channel(&channel_id, &counterparty_node_id) {
/// Ok(()) => println!(\"Closing channel {}\", channel_id),
/// Err(e) => println!(\"Error closing channel {}: {:?}\", channel_id, e),
/// }
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::ChannelClosed { channel_id, user_channel_id, ..  } => {
/// assert_eq!(user_channel_id, 42);
/// println!(\"Channel {} closed\", channel_id);
/// },
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// # Payments
///
/// [`ChannelManager`] is responsible for sending, forwarding, and receiving payments through its
/// channels. A payment is typically initiated from a [BOLT 11] invoice or a [BOLT 12] offer, though
/// spontaneous (i.e., keysend) payments are also possible. Incoming payments don't require
/// maintaining any additional state as [`ChannelManager`] can reconstruct the [`PaymentPreimage`]
/// from the [`PaymentSecret`]. Sending payments, however, require tracking in order to retry failed
/// HTLCs.
///
/// After a payment is initiated, it will appear in [`list_recent_payments`] until a short time
/// after either an [`Event::PaymentSent`] or [`Event::PaymentFailed`] is handled. Failed HTLCs
/// for a payment will be retried according to the payment's [`Retry`] strategy or until
/// [`abandon_payment`] is called.
///
/// ## BOLT 11 Invoices
///
/// The [`lightning-invoice`] crate is useful for creating BOLT 11 invoices. Specifically, use the
/// functions in its `utils` module for constructing invoices that are compatible with
/// [`ChannelManager`]. These functions serve as a convenience for building invoices with the
/// [`PaymentHash`] and [`PaymentSecret`] returned from [`create_inbound_payment`]. To provide your
/// own [`PaymentHash`], use [`create_inbound_payment_for_hash`] or the corresponding functions in
/// the [`lightning-invoice`] `utils` module.
///
/// [`ChannelManager`] generates an [`Event::PaymentClaimable`] once the full payment has been
/// received. Call [`claim_funds`] to release the [`PaymentPreimage`], which in turn will result in
/// an [`Event::PaymentClaimed`].
///
/// ```
/// # use lightning::events::{Event, EventsProvider, PaymentPurpose};
/// # use lightning::ln::channelmanager::AChannelManager;
/// #
/// # fn example<T: AChannelManager>(channel_manager: T) {
/// # let channel_manager = channel_manager.get_cm();
/// // Or use utils::create_invoice_from_channelmanager
/// let known_payment_hash = match channel_manager.create_inbound_payment(
/// Some(10_000_000), 3600, None
/// ) {
/// Ok((payment_hash, _payment_secret)) => {
/// println!(\"Creating inbound payment {}\", payment_hash);
/// payment_hash
/// },
/// Err(()) => panic!(\"Error creating inbound payment\"),
/// };
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::PaymentClaimable { payment_hash, purpose, .. } => match purpose {
/// PaymentPurpose::Bolt11InvoicePayment { payment_preimage: Some(payment_preimage), .. } => {
/// assert_eq!(payment_hash, known_payment_hash);
/// println!(\"Claiming payment {}\", payment_hash);
/// channel_manager.claim_funds(payment_preimage);
/// },
/// PaymentPurpose::Bolt11InvoicePayment { payment_preimage: None, .. } => {
/// println!(\"Unknown payment hash: {}\", payment_hash);
/// },
/// PaymentPurpose::SpontaneousPayment(payment_preimage) => {
/// assert_ne!(payment_hash, known_payment_hash);
/// println!(\"Claiming spontaneous payment {}\", payment_hash);
/// channel_manager.claim_funds(payment_preimage);
/// },
/// // ...
/// #           _ => {},
/// },
/// Event::PaymentClaimed { payment_hash, amount_msat, .. } => {
/// assert_eq!(payment_hash, known_payment_hash);
/// println!(\"Claimed {} msats\", amount_msat);
/// },
/// // ...
/// #       _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// For paying an invoice, [`lightning-invoice`] provides a `payment` module with convenience
/// functions for use with [`send_payment`].
///
/// ```
/// # use lightning::events::{Event, EventsProvider};
/// # use lightning::ln::types::PaymentHash;
/// # use lightning::ln::channelmanager::{AChannelManager, PaymentId, RecentPaymentDetails, RecipientOnionFields, Retry};
/// # use lightning::routing::router::RouteParameters;
/// #
/// # fn example<T: AChannelManager>(
/// #     channel_manager: T, payment_hash: PaymentHash, recipient_onion: RecipientOnionFields,
/// #     route_params: RouteParameters, retry: Retry
/// # ) {
/// # let channel_manager = channel_manager.get_cm();
/// // let (payment_hash, recipient_onion, route_params) =
/// //     payment::payment_parameters_from_invoice(&invoice);
/// let payment_id = PaymentId([42; 32]);
/// match channel_manager.send_payment(
/// payment_hash, recipient_onion, payment_id, route_params, retry
/// ) {
/// Ok(()) => println!(\"Sending payment with hash {}\", payment_hash),
/// Err(e) => println!(\"Failed sending payment with hash {}: {:?}\", payment_hash, e),
/// }
///
/// let expected_payment_id = payment_id;
/// let expected_payment_hash = payment_hash;
/// assert!(
/// channel_manager.list_recent_payments().iter().find(|details| matches!(
/// details,
/// RecentPaymentDetails::Pending {
/// payment_id: expected_payment_id,
/// payment_hash: expected_payment_hash,
/// ..
/// }
/// )).is_some()
/// );
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::PaymentSent { payment_hash, .. } => println!(\"Paid {}\", payment_hash),
/// Event::PaymentFailed { payment_hash: Some(payment_hash), .. } =>
/// println!(\"Failed paying {}\", payment_hash),
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// ## BOLT 12 Offers
///
/// The [`offers`] module is useful for creating BOLT 12 offers. An [`Offer`] is a precursor to a
/// [`Bolt12Invoice`], which must first be requested by the payer. The interchange of these messages
/// as defined in the specification is handled by [`ChannelManager`] and its implementation of
/// [`OffersMessageHandler`]. However, this only works with an [`Offer`] created using a builder
/// returned by [`create_offer_builder`]. With this approach, BOLT 12 offers and invoices are
/// stateless just as BOLT 11 invoices are.
///
/// ```
/// # use lightning::events::{Event, EventsProvider, PaymentPurpose};
/// # use lightning::ln::channelmanager::AChannelManager;
/// # use lightning::offers::parse::Bolt12SemanticError;
/// #
/// # fn example<T: AChannelManager>(channel_manager: T) -> Result<(), Bolt12SemanticError> {
/// # let channel_manager = channel_manager.get_cm();
/// # let absolute_expiry = None;
/// let offer = channel_manager
/// .create_offer_builder(absolute_expiry)?
/// # ;
/// # // Needed for compiling for c_bindings
/// # let builder: lightning::offers::offer::OfferBuilder<_, _> = offer.into();
/// # let offer = builder
/// .description(\"coffee\".to_string())
/// .amount_msats(10_000_000)
/// .build()?;
/// let bech32_offer = offer.to_string();
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::PaymentClaimable { payment_hash, purpose, .. } => match purpose {
/// PaymentPurpose::Bolt12OfferPayment { payment_preimage: Some(payment_preimage), .. } => {
/// println!(\"Claiming payment {}\", payment_hash);
/// channel_manager.claim_funds(payment_preimage);
/// },
/// PaymentPurpose::Bolt12OfferPayment { payment_preimage: None, .. } => {
/// println!(\"Unknown payment hash: {}\", payment_hash);
/// }
/// #           _ => {},
/// },
/// Event::PaymentClaimed { payment_hash, amount_msat, .. } => {
/// println!(\"Claimed {} msats\", amount_msat);
/// },
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # Ok(())
/// # }
/// ```
///
/// Use [`pay_for_offer`] to initiated payment, which sends an [`InvoiceRequest`] for an [`Offer`]
/// and pays the [`Bolt12Invoice`] response.
///
/// ```
/// # use lightning::events::{Event, EventsProvider};
/// # use lightning::ln::channelmanager::{AChannelManager, PaymentId, RecentPaymentDetails, Retry};
/// # use lightning::offers::offer::Offer;
/// #
/// # fn example<T: AChannelManager>(
/// #     channel_manager: T, offer: &Offer, quantity: Option<u64>, amount_msats: Option<u64>,
/// #     payer_note: Option<String>, retry: Retry, max_total_routing_fee_msat: Option<u64>
/// # ) {
/// # let channel_manager = channel_manager.get_cm();
/// let payment_id = PaymentId([42; 32]);
/// match channel_manager.pay_for_offer(
/// offer, quantity, amount_msats, payer_note, payment_id, retry, max_total_routing_fee_msat
/// ) {
/// Ok(()) => println!(\"Requesting invoice for offer\"),
/// Err(e) => println!(\"Unable to request invoice for offer: {:?}\", e),
/// }
///
/// // First the payment will be waiting on an invoice
/// let expected_payment_id = payment_id;
/// assert!(
/// channel_manager.list_recent_payments().iter().find(|details| matches!(
/// details,
/// RecentPaymentDetails::AwaitingInvoice { payment_id: expected_payment_id }
/// )).is_some()
/// );
///
/// // Once the invoice is received, a payment will be sent
/// assert!(
/// channel_manager.list_recent_payments().iter().find(|details| matches!(
/// details,
/// RecentPaymentDetails::Pending { payment_id: expected_payment_id, ..  }
/// )).is_some()
/// );
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::PaymentSent { payment_id: Some(payment_id), .. } => println!(\"Paid {}\", payment_id),
/// Event::PaymentFailed { payment_id, .. } => println!(\"Failed paying {}\", payment_id),
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// ## BOLT 12 Refunds
///
/// A [`Refund`] is a request for an invoice to be paid. Like *paying* for an [`Offer`], *creating*
/// a [`Refund`] involves maintaining state since it represents a future outbound payment.
/// Therefore, use [`create_refund_builder`] when creating one, otherwise [`ChannelManager`] will
/// refuse to pay any corresponding [`Bolt12Invoice`] that it receives.
///
/// ```
/// # use core::time::Duration;
/// # use lightning::events::{Event, EventsProvider};
/// # use lightning::ln::channelmanager::{AChannelManager, PaymentId, RecentPaymentDetails, Retry};
/// # use lightning::offers::parse::Bolt12SemanticError;
/// #
/// # fn example<T: AChannelManager>(
/// #     channel_manager: T, amount_msats: u64, absolute_expiry: Duration, retry: Retry,
/// #     max_total_routing_fee_msat: Option<u64>
/// # ) -> Result<(), Bolt12SemanticError> {
/// # let channel_manager = channel_manager.get_cm();
/// let payment_id = PaymentId([42; 32]);
/// let refund = channel_manager
/// .create_refund_builder(
/// amount_msats, absolute_expiry, payment_id, retry, max_total_routing_fee_msat
/// )?
/// # ;
/// # // Needed for compiling for c_bindings
/// # let builder: lightning::offers::refund::RefundBuilder<_> = refund.into();
/// # let refund = builder
/// .description(\"coffee\".to_string())
/// .payer_note(\"refund for order 1234\".to_string())
/// .build()?;
/// let bech32_refund = refund.to_string();
///
/// // First the payment will be waiting on an invoice
/// let expected_payment_id = payment_id;
/// assert!(
/// channel_manager.list_recent_payments().iter().find(|details| matches!(
/// details,
/// RecentPaymentDetails::AwaitingInvoice { payment_id: expected_payment_id }
/// )).is_some()
/// );
///
/// // Once the invoice is received, a payment will be sent
/// assert!(
/// channel_manager.list_recent_payments().iter().find(|details| matches!(
/// details,
/// RecentPaymentDetails::Pending { payment_id: expected_payment_id, ..  }
/// )).is_some()
/// );
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::PaymentSent { payment_id: Some(payment_id), .. } => println!(\"Paid {}\", payment_id),
/// Event::PaymentFailed { payment_id, .. } => println!(\"Failed paying {}\", payment_id),
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # Ok(())
/// # }
/// ```
///
/// Use [`request_refund_payment`] to send a [`Bolt12Invoice`] for receiving the refund. Similar to
/// *creating* an [`Offer`], this is stateless as it represents an inbound payment.
///
/// ```
/// # use lightning::events::{Event, EventsProvider, PaymentPurpose};
/// # use lightning::ln::channelmanager::AChannelManager;
/// # use lightning::offers::refund::Refund;
/// #
/// # fn example<T: AChannelManager>(channel_manager: T, refund: &Refund) {
/// # let channel_manager = channel_manager.get_cm();
/// let known_payment_hash = match channel_manager.request_refund_payment(refund) {
/// Ok(invoice) => {
/// let payment_hash = invoice.payment_hash();
/// println!(\"Requesting refund payment {}\", payment_hash);
/// payment_hash
/// },
/// Err(e) => panic!(\"Unable to request payment for refund: {:?}\", e),
/// };
///
/// // On the event processing thread
/// channel_manager.process_pending_events(&|event| {
/// match event {
/// Event::PaymentClaimable { payment_hash, purpose, .. } => match purpose {
/// PaymentPurpose::Bolt12RefundPayment { payment_preimage: Some(payment_preimage), .. } => {
/// assert_eq!(payment_hash, known_payment_hash);
/// println!(\"Claiming payment {}\", payment_hash);
/// channel_manager.claim_funds(payment_preimage);
/// },
/// PaymentPurpose::Bolt12RefundPayment { payment_preimage: None, .. } => {
/// println!(\"Unknown payment hash: {}\", payment_hash);
/// },
/// // ...
/// #           _ => {},
/// },
/// Event::PaymentClaimed { payment_hash, amount_msat, .. } => {
/// assert_eq!(payment_hash, known_payment_hash);
/// println!(\"Claimed {} msats\", amount_msat);
/// },
/// // ...
/// #     _ => {},
/// }
/// Ok(())
/// });
/// # }
/// ```
///
/// # Persistence
///
/// Implements [`Writeable`] to write out all channel state to disk. Implies [`peer_disconnected`] for
/// all peers during write/read (though does not modify this instance, only the instance being
/// serialized). This will result in any channels which have not yet exchanged [`funding_created`] (i.e.,
/// called [`funding_transaction_generated`] for outbound channels) being closed.
///
/// Note that you can be a bit lazier about writing out `ChannelManager` than you can be with
/// [`ChannelMonitor`]. With [`ChannelMonitor`] you MUST durably write each
/// [`ChannelMonitorUpdate`] before returning from
/// [`chain::Watch::watch_channel`]/[`update_channel`] or before completing async writes. With
/// `ChannelManager`s, writing updates happens out-of-band (and will prevent any other
/// `ChannelManager` operations from occurring during the serialization process). If the
/// deserialized version is out-of-date compared to the [`ChannelMonitor`] passed by reference to
/// [`read`], those channels will be force-closed based on the `ChannelMonitor` state and no funds
/// will be lost (modulo on-chain transaction fees).
///
/// Note that the deserializer is only implemented for `(`[`BlockHash`]`, `[`ChannelManager`]`)`, which
/// tells you the last block hash which was connected. You should get the best block tip before using the manager.
/// See [`chain::Listen`] and [`chain::Confirm`] for more details.
///
/// # `ChannelUpdate` Messages
///
/// Note that `ChannelManager` is responsible for tracking liveness of its channels and generating
/// [`ChannelUpdate`] messages informing peers that the channel is temporarily disabled. To avoid
/// spam due to quick disconnection/reconnection, updates are not sent until the channel has been
/// offline for a full minute. In order to track this, you must call
/// [`timer_tick_occurred`] roughly once per minute, though it doesn't have to be perfect.
///
/// # DoS Mitigation
///
/// To avoid trivial DoS issues, `ChannelManager` limits the number of inbound connections and
/// inbound channels without confirmed funding transactions. This may result in nodes which we do
/// not have a channel with being unable to connect to us or open new channels with us if we have
/// many peers with unfunded channels.
///
/// Because it is an indication of trust, inbound channels which we've accepted as 0conf are
/// exempted from the count of unfunded channels. Similarly, outbound channels and connections are
/// never limited. Please ensure you limit the count of such channels yourself.
///
/// # Type Aliases
///
/// Rather than using a plain `ChannelManager`, it is preferable to use either a [`SimpleArcChannelManager`]
/// a [`SimpleRefChannelManager`], for conciseness. See their documentation for more details, but
/// essentially you should default to using a [`SimpleRefChannelManager`], and use a
/// [`SimpleArcChannelManager`] when you require a `ChannelManager` with a static lifetime, such as when
/// you're using lightning-net-tokio.
///
/// [`ChainMonitor`]: crate::chain::chainmonitor::ChainMonitor
/// [`MessageHandler`]: crate::ln::peer_handler::MessageHandler
/// [`OnionMessenger`]: crate::onion_message::messenger::OnionMessenger
/// [`PeerManager::read_event`]: crate::ln::peer_handler::PeerManager::read_event
/// [`PeerManager::process_events`]: crate::ln::peer_handler::PeerManager::process_events
/// [`timer_tick_occurred`]: Self::timer_tick_occurred
/// [`get_and_clear_needs_persistence`]: Self::get_and_clear_needs_persistence
/// [`Persister`]: crate::util::persist::Persister
/// [`KVStore`]: crate::util::persist::KVStore
/// [`get_event_or_persistence_needed_future`]: Self::get_event_or_persistence_needed_future
/// [`lightning-block-sync`]: https://docs.rs/lightning_block_sync/latest/lightning_block_sync
/// [`lightning-transaction-sync`]: https://docs.rs/lightning_transaction_sync/latest/lightning_transaction_sync
/// [`lightning-background-processor`]: https://docs.rs/lightning_background_processor/lightning_background_processor
/// [`list_channels`]: Self::list_channels
/// [`list_usable_channels`]: Self::list_usable_channels
/// [`create_channel`]: Self::create_channel
/// [`close_channel`]: Self::force_close_broadcasting_latest_txn
/// [`force_close_broadcasting_latest_txn`]: Self::force_close_broadcasting_latest_txn
/// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
/// [BOLT 12]: https://github.com/rustyrussell/lightning-rfc/blob/guilt/offers/12-offer-encoding.md
/// [`list_recent_payments`]: Self::list_recent_payments
/// [`abandon_payment`]: Self::abandon_payment
/// [`lightning-invoice`]: https://docs.rs/lightning_invoice/latest/lightning_invoice
/// [`create_inbound_payment`]: Self::create_inbound_payment
/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
/// [`claim_funds`]: Self::claim_funds
/// [`send_payment`]: Self::send_payment
/// [`offers`]: crate::offers
/// [`create_offer_builder`]: Self::create_offer_builder
/// [`pay_for_offer`]: Self::pay_for_offer
/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
/// [`create_refund_builder`]: Self::create_refund_builder
/// [`request_refund_payment`]: Self::request_refund_payment
/// [`peer_disconnected`]: msgs::ChannelMessageHandler::peer_disconnected
/// [`funding_created`]: msgs::FundingCreated
/// [`funding_transaction_generated`]: Self::funding_transaction_generated
/// [`BlockHash`]: bitcoin::hash_types::BlockHash
/// [`update_channel`]: chain::Watch::update_channel
/// [`ChannelUpdate`]: msgs::ChannelUpdate
/// [`read`]: ReadableArgs::read
public typealias ChannelManager = Bindings.ChannelManager

extension Bindings {


	/// A lightning node's channel state machine and payment management logic, which facilitates
	/// sending, forwarding, and receiving payments through lightning channels.
	///
	/// [`ChannelManager`] is parameterized by a number of components to achieve this.
	/// - [`chain::Watch`] (typically [`ChainMonitor`]) for on-chain monitoring and enforcement of each
	/// channel
	/// - [`BroadcasterInterface`] for broadcasting transactions related to opening, funding, and
	/// closing channels
	/// - [`EntropySource`] for providing random data needed for cryptographic operations
	/// - [`NodeSigner`] for cryptographic operations scoped to the node
	/// - [`SignerProvider`] for providing signers whose operations are scoped to individual channels
	/// - [`FeeEstimator`] to determine transaction fee rates needed to have a transaction mined in a
	/// timely manner
	/// - [`Router`] for finding payment paths when initiating and retrying payments
	/// - [`Logger`] for logging operational information of varying degrees
	///
	/// Additionally, it implements the following traits:
	/// - [`ChannelMessageHandler`] to handle off-chain channel activity from peers
	/// - [`MessageSendEventsProvider`] to similarly send such messages to peers
	/// - [`OffersMessageHandler`] for BOLT 12 message handling and sending
	/// - [`EventsProvider`] to generate user-actionable [`Event`]s
	/// - [`chain::Listen`] and [`chain::Confirm`] for notification of on-chain activity
	///
	/// Thus, [`ChannelManager`] is typically used to parameterize a [`MessageHandler`] and an
	/// [`OnionMessenger`]. The latter is required to support BOLT 12 functionality.
	///
	/// # `ChannelManager` vs `ChannelMonitor`
	///
	/// It's important to distinguish between the *off-chain* management and *on-chain* enforcement of
	/// lightning channels. [`ChannelManager`] exchanges messages with peers to manage the off-chain
	/// state of each channel. During this process, it generates a [`ChannelMonitor`] for each channel
	/// and a [`ChannelMonitorUpdate`] for each relevant change, notifying its parameterized
	/// [`chain::Watch`] of them.
	///
	/// An implementation of [`chain::Watch`], such as [`ChainMonitor`], is responsible for aggregating
	/// these [`ChannelMonitor`]s and applying any [`ChannelMonitorUpdate`]s to them. It then monitors
	/// for any pertinent on-chain activity, enforcing claims as needed.
	///
	/// This division of off-chain management and on-chain enforcement allows for interesting node
	/// setups. For instance, on-chain enforcement could be moved to a separate host or have added
	/// redundancy, possibly as a watchtower. See [`chain::Watch`] for the relevant interface.
	///
	/// # Initialization
	///
	/// Use [`ChannelManager::new`] with the most recent [`BlockHash`] when creating a fresh instance.
	/// Otherwise, if restarting, construct [`ChannelManagerReadArgs`] with the necessary parameters and
	/// references to any deserialized [`ChannelMonitor`]s that were previously persisted. Use this to
	/// deserialize the [`ChannelManager`] and feed it any new chain data since it was last online, as
	/// detailed in the [`ChannelManagerReadArgs`] documentation.
	///
	/// ```
	/// use bitcoin::BlockHash;
	/// use bitcoin::network::Network;
	/// use lightning::chain::BestBlock;
	/// # use lightning::chain::channelmonitor::ChannelMonitor;
	/// use lightning::ln::channelmanager::{ChainParameters, ChannelManager, ChannelManagerReadArgs};
	/// # use lightning::routing::gossip::NetworkGraph;
	/// use lightning::util::config::UserConfig;
	/// use lightning::util::ser::ReadableArgs;
	///
	/// # fn read_channel_monitors() -> Vec<ChannelMonitor<lightning::sign::InMemorySigner>> { vec![] }
	/// # fn example<
	/// #     'a,
	/// #     L: lightning::util::logger::Logger,
	/// #     ES: lightning::sign::EntropySource,
	/// #     S: for <'b> lightning::routing::scoring::LockableScore<'b, ScoreLookUp = SL>,
	/// #     SL: lightning::routing::scoring::ScoreLookUp<ScoreParams = SP>,
	/// #     SP: Sized,
	/// #     R: lightning::io::Read,
	/// # >(
	/// #     fee_estimator: &dyn lightning::chain::chaininterface::FeeEstimator,
	/// #     chain_monitor: &dyn lightning::chain::Watch<lightning::sign::InMemorySigner>,
	/// #     tx_broadcaster: &dyn lightning::chain::chaininterface::BroadcasterInterface,
	/// #     router: &lightning::routing::router::DefaultRouter<&NetworkGraph<&'a L>, &'a L, &ES, &S, SP, SL>,
	/// #     logger: &L,
	/// #     entropy_source: &ES,
	/// #     node_signer: &dyn lightning::sign::NodeSigner,
	/// #     signer_provider: &lightning::sign::DynSignerProvider,
	/// #     best_block: lightning::chain::BestBlock,
	/// #     current_timestamp: u32,
	/// #     mut reader: R,
	/// # ) -> Result<(), lightning::ln::msgs::DecodeError> {
	/// // Fresh start with no channels
	/// let params = ChainParameters {
	/// network: Network::Bitcoin,
	/// best_block,
	/// };
	/// let default_config = UserConfig::default();
	/// let channel_manager = ChannelManager::new(
	/// fee_estimator, chain_monitor, tx_broadcaster, router, logger, entropy_source, node_signer,
	/// signer_provider, default_config, params, current_timestamp
	/// );
	///
	/// // Restart from deserialized data
	/// let mut channel_monitors = read_channel_monitors();
	/// let args = ChannelManagerReadArgs::new(
	/// entropy_source, node_signer, signer_provider, fee_estimator, chain_monitor, tx_broadcaster,
	/// router, logger, default_config, channel_monitors.iter_mut().collect()
	/// );
	/// let (block_hash, channel_manager) =
	/// <(BlockHash, ChannelManager<_, _, _, _, _, _, _, _>)>::read(&mut reader, args)?;
	///
	/// // Update the ChannelManager and ChannelMonitors with the latest chain data
	/// // ...
	///
	/// // Move the monitors to the ChannelManager's chain::Watch parameter
	/// for monitor in channel_monitors {
	/// chain_monitor.watch_channel(monitor.get_funding_txo().0, monitor);
	/// }
	/// # Ok(())
	/// # }
	/// ```
	///
	/// # Operation
	///
	/// The following is required for [`ChannelManager`] to function properly:
	/// - Handle messages from peers using its [`ChannelMessageHandler`] implementation (typically
	/// called by [`PeerManager::read_event`] when processing network I/O)
	/// - Send messages to peers obtained via its [`MessageSendEventsProvider`] implementation
	/// (typically initiated when [`PeerManager::process_events`] is called)
	/// - Feed on-chain activity using either its [`chain::Listen`] or [`chain::Confirm`] implementation
	/// as documented by those traits
	/// - Perform any periodic channel and payment checks by calling [`timer_tick_occurred`] roughly
	/// every minute
	/// - Persist to disk whenever [`get_and_clear_needs_persistence`] returns `true` using a
	/// [`Persister`] such as a [`KVStore`] implementation
	/// - Handle [`Event`]s obtained via its [`EventsProvider`] implementation
	///
	/// The [`Future`] returned by [`get_event_or_persistence_needed_future`] is useful in determining
	/// when the last two requirements need to be checked.
	///
	/// The [`lightning-block-sync`] and [`lightning-transaction-sync`] crates provide utilities that
	/// simplify feeding in on-chain activity using the [`chain::Listen`] and [`chain::Confirm`] traits,
	/// respectively. The remaining requirements can be met using the [`lightning-background-processor`]
	/// crate. For languages other than Rust, the availability of similar utilities may vary.
	///
	/// # Channels
	///
	/// [`ChannelManager`]'s primary function involves managing a channel state. Without channels,
	/// payments can't be sent. Use [`list_channels`] or [`list_usable_channels`] for a snapshot of the
	/// currently open channels.
	///
	/// ```
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// #
	/// # fn example<T: AChannelManager>(channel_manager: T) {
	/// # let channel_manager = channel_manager.get_cm();
	/// let channels = channel_manager.list_usable_channels();
	/// for details in channels {
	/// println!(\"{:?}\", details);
	/// }
	/// # }
	/// ```
	///
	/// Each channel is identified using a [`ChannelId`], which will change throughout the channel's
	/// life cycle. Additionally, channels are assigned a `user_channel_id`, which is given in
	/// [`Event`]s associated with the channel and serves as a fixed identifier but is otherwise unused
	/// by [`ChannelManager`].
	///
	/// ## Opening Channels
	///
	/// To an open a channel with a peer, call [`create_channel`]. This will initiate the process of
	/// opening an outbound channel, which requires self-funding when handling
	/// [`Event::FundingGenerationReady`].
	///
	/// ```
	/// # use bitcoin::{ScriptBuf, Transaction};
	/// # use bitcoin::secp256k1::PublicKey;
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// # use lightning::events::{Event, EventsProvider};
	/// #
	/// # trait Wallet {
	/// #     fn create_funding_transaction(
	/// #         &self, _amount_sats: u64, _output_script: ScriptBuf
	/// #     ) -> Transaction;
	/// # }
	/// #
	/// # fn example<T: AChannelManager, W: Wallet>(channel_manager: T, wallet: W, peer_id: PublicKey) {
	/// # let channel_manager = channel_manager.get_cm();
	/// let value_sats = 1_000_000;
	/// let push_msats = 10_000_000;
	/// match channel_manager.create_channel(peer_id, value_sats, push_msats, 42, None, None) {
	/// Ok(channel_id) => println!(\"Opening channel {}\", channel_id),
	/// Err(e) => println!(\"Error opening channel: {:?}\", e),
	/// }
	///
	/// // On the event processing thread once the peer has responded
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::FundingGenerationReady {
	/// temporary_channel_id, counterparty_node_id, channel_value_satoshis, output_script,
	/// user_channel_id, ..
	/// } => {
	/// assert_eq!(user_channel_id, 42);
	/// let funding_transaction = wallet.create_funding_transaction(
	/// channel_value_satoshis, output_script
	/// );
	/// match channel_manager.funding_transaction_generated(
	/// temporary_channel_id, counterparty_node_id, funding_transaction
	/// ) {
	/// Ok(()) => println!(\"Funding channel {}\", temporary_channel_id),
	/// Err(e) => println!(\"Error funding channel {}: {:?}\", temporary_channel_id, e),
	/// }
	/// },
	/// Event::ChannelPending { channel_id, user_channel_id, former_temporary_channel_id, .. } => {
	/// assert_eq!(user_channel_id, 42);
	/// println!(
	/// \"Channel {} now {} pending (funding transaction has been broadcasted)\", channel_id,
	/// former_temporary_channel_id.unwrap()
	/// );
	/// },
	/// Event::ChannelReady { channel_id, user_channel_id, .. } => {
	/// assert_eq!(user_channel_id, 42);
	/// println!(\"Channel {} ready\", channel_id);
	/// },
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// ## Accepting Channels
	///
	/// Inbound channels are initiated by peers and are automatically accepted unless [`ChannelManager`]
	/// has [`UserConfig::manually_accept_inbound_channels`] set. In that case, the channel may be
	/// either accepted or rejected when handling [`Event::OpenChannelRequest`].
	///
	/// ```
	/// # use bitcoin::secp256k1::PublicKey;
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// # use lightning::events::{Event, EventsProvider};
	/// #
	/// # fn is_trusted(counterparty_node_id: PublicKey) -> bool {
	/// #     // ...
	/// #     unimplemented!()
	/// # }
	/// #
	/// # fn example<T: AChannelManager>(channel_manager: T) {
	/// # let channel_manager = channel_manager.get_cm();
	/// # let error_message = \"Channel force-closed\";
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::OpenChannelRequest { temporary_channel_id, counterparty_node_id, ..  } => {
	/// if !is_trusted(counterparty_node_id) {
	/// match channel_manager.force_close_without_broadcasting_txn(
	/// &temporary_channel_id, &counterparty_node_id, error_message.to_string()
	/// ) {
	/// Ok(()) => println!(\"Rejecting channel {}\", temporary_channel_id),
	/// Err(e) => println!(\"Error rejecting channel {}: {:?}\", temporary_channel_id, e),
	/// }
	/// return Ok(());
	/// }
	///
	/// let user_channel_id = 43;
	/// match channel_manager.accept_inbound_channel(
	/// &temporary_channel_id, &counterparty_node_id, user_channel_id
	/// ) {
	/// Ok(()) => println!(\"Accepting channel {}\", temporary_channel_id),
	/// Err(e) => println!(\"Error accepting channel {}: {:?}\", temporary_channel_id, e),
	/// }
	/// },
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// ## Closing Channels
	///
	/// There are two ways to close a channel: either cooperatively using [`close_channel`] or
	/// unilaterally using [`force_close_broadcasting_latest_txn`]. The former is ideal as it makes for
	/// lower fees and immediate access to funds. However, the latter may be necessary if the
	/// counterparty isn't behaving properly or has gone offline. [`Event::ChannelClosed`] is generated
	/// once the channel has been closed successfully.
	///
	/// ```
	/// # use bitcoin::secp256k1::PublicKey;
	/// # use lightning::ln::types::ChannelId;
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// # use lightning::events::{Event, EventsProvider};
	/// #
	/// # fn example<T: AChannelManager>(
	/// #     channel_manager: T, channel_id: ChannelId, counterparty_node_id: PublicKey
	/// # ) {
	/// # let channel_manager = channel_manager.get_cm();
	/// match channel_manager.close_channel(&channel_id, &counterparty_node_id) {
	/// Ok(()) => println!(\"Closing channel {}\", channel_id),
	/// Err(e) => println!(\"Error closing channel {}: {:?}\", channel_id, e),
	/// }
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::ChannelClosed { channel_id, user_channel_id, ..  } => {
	/// assert_eq!(user_channel_id, 42);
	/// println!(\"Channel {} closed\", channel_id);
	/// },
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// # Payments
	///
	/// [`ChannelManager`] is responsible for sending, forwarding, and receiving payments through its
	/// channels. A payment is typically initiated from a [BOLT 11] invoice or a [BOLT 12] offer, though
	/// spontaneous (i.e., keysend) payments are also possible. Incoming payments don't require
	/// maintaining any additional state as [`ChannelManager`] can reconstruct the [`PaymentPreimage`]
	/// from the [`PaymentSecret`]. Sending payments, however, require tracking in order to retry failed
	/// HTLCs.
	///
	/// After a payment is initiated, it will appear in [`list_recent_payments`] until a short time
	/// after either an [`Event::PaymentSent`] or [`Event::PaymentFailed`] is handled. Failed HTLCs
	/// for a payment will be retried according to the payment's [`Retry`] strategy or until
	/// [`abandon_payment`] is called.
	///
	/// ## BOLT 11 Invoices
	///
	/// The [`lightning-invoice`] crate is useful for creating BOLT 11 invoices. Specifically, use the
	/// functions in its `utils` module for constructing invoices that are compatible with
	/// [`ChannelManager`]. These functions serve as a convenience for building invoices with the
	/// [`PaymentHash`] and [`PaymentSecret`] returned from [`create_inbound_payment`]. To provide your
	/// own [`PaymentHash`], use [`create_inbound_payment_for_hash`] or the corresponding functions in
	/// the [`lightning-invoice`] `utils` module.
	///
	/// [`ChannelManager`] generates an [`Event::PaymentClaimable`] once the full payment has been
	/// received. Call [`claim_funds`] to release the [`PaymentPreimage`], which in turn will result in
	/// an [`Event::PaymentClaimed`].
	///
	/// ```
	/// # use lightning::events::{Event, EventsProvider, PaymentPurpose};
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// #
	/// # fn example<T: AChannelManager>(channel_manager: T) {
	/// # let channel_manager = channel_manager.get_cm();
	/// // Or use utils::create_invoice_from_channelmanager
	/// let known_payment_hash = match channel_manager.create_inbound_payment(
	/// Some(10_000_000), 3600, None
	/// ) {
	/// Ok((payment_hash, _payment_secret)) => {
	/// println!(\"Creating inbound payment {}\", payment_hash);
	/// payment_hash
	/// },
	/// Err(()) => panic!(\"Error creating inbound payment\"),
	/// };
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::PaymentClaimable { payment_hash, purpose, .. } => match purpose {
	/// PaymentPurpose::Bolt11InvoicePayment { payment_preimage: Some(payment_preimage), .. } => {
	/// assert_eq!(payment_hash, known_payment_hash);
	/// println!(\"Claiming payment {}\", payment_hash);
	/// channel_manager.claim_funds(payment_preimage);
	/// },
	/// PaymentPurpose::Bolt11InvoicePayment { payment_preimage: None, .. } => {
	/// println!(\"Unknown payment hash: {}\", payment_hash);
	/// },
	/// PaymentPurpose::SpontaneousPayment(payment_preimage) => {
	/// assert_ne!(payment_hash, known_payment_hash);
	/// println!(\"Claiming spontaneous payment {}\", payment_hash);
	/// channel_manager.claim_funds(payment_preimage);
	/// },
	/// // ...
	/// #           _ => {},
	/// },
	/// Event::PaymentClaimed { payment_hash, amount_msat, .. } => {
	/// assert_eq!(payment_hash, known_payment_hash);
	/// println!(\"Claimed {} msats\", amount_msat);
	/// },
	/// // ...
	/// #       _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// For paying an invoice, [`lightning-invoice`] provides a `payment` module with convenience
	/// functions for use with [`send_payment`].
	///
	/// ```
	/// # use lightning::events::{Event, EventsProvider};
	/// # use lightning::ln::types::PaymentHash;
	/// # use lightning::ln::channelmanager::{AChannelManager, PaymentId, RecentPaymentDetails, RecipientOnionFields, Retry};
	/// # use lightning::routing::router::RouteParameters;
	/// #
	/// # fn example<T: AChannelManager>(
	/// #     channel_manager: T, payment_hash: PaymentHash, recipient_onion: RecipientOnionFields,
	/// #     route_params: RouteParameters, retry: Retry
	/// # ) {
	/// # let channel_manager = channel_manager.get_cm();
	/// // let (payment_hash, recipient_onion, route_params) =
	/// //     payment::payment_parameters_from_invoice(&invoice);
	/// let payment_id = PaymentId([42; 32]);
	/// match channel_manager.send_payment(
	/// payment_hash, recipient_onion, payment_id, route_params, retry
	/// ) {
	/// Ok(()) => println!(\"Sending payment with hash {}\", payment_hash),
	/// Err(e) => println!(\"Failed sending payment with hash {}: {:?}\", payment_hash, e),
	/// }
	///
	/// let expected_payment_id = payment_id;
	/// let expected_payment_hash = payment_hash;
	/// assert!(
	/// channel_manager.list_recent_payments().iter().find(|details| matches!(
	/// details,
	/// RecentPaymentDetails::Pending {
	/// payment_id: expected_payment_id,
	/// payment_hash: expected_payment_hash,
	/// ..
	/// }
	/// )).is_some()
	/// );
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::PaymentSent { payment_hash, .. } => println!(\"Paid {}\", payment_hash),
	/// Event::PaymentFailed { payment_hash: Some(payment_hash), .. } =>
	/// println!(\"Failed paying {}\", payment_hash),
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// ## BOLT 12 Offers
	///
	/// The [`offers`] module is useful for creating BOLT 12 offers. An [`Offer`] is a precursor to a
	/// [`Bolt12Invoice`], which must first be requested by the payer. The interchange of these messages
	/// as defined in the specification is handled by [`ChannelManager`] and its implementation of
	/// [`OffersMessageHandler`]. However, this only works with an [`Offer`] created using a builder
	/// returned by [`create_offer_builder`]. With this approach, BOLT 12 offers and invoices are
	/// stateless just as BOLT 11 invoices are.
	///
	/// ```
	/// # use lightning::events::{Event, EventsProvider, PaymentPurpose};
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// # use lightning::offers::parse::Bolt12SemanticError;
	/// #
	/// # fn example<T: AChannelManager>(channel_manager: T) -> Result<(), Bolt12SemanticError> {
	/// # let channel_manager = channel_manager.get_cm();
	/// # let absolute_expiry = None;
	/// let offer = channel_manager
	/// .create_offer_builder(absolute_expiry)?
	/// # ;
	/// # // Needed for compiling for c_bindings
	/// # let builder: lightning::offers::offer::OfferBuilder<_, _> = offer.into();
	/// # let offer = builder
	/// .description(\"coffee\".to_string())
	/// .amount_msats(10_000_000)
	/// .build()?;
	/// let bech32_offer = offer.to_string();
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::PaymentClaimable { payment_hash, purpose, .. } => match purpose {
	/// PaymentPurpose::Bolt12OfferPayment { payment_preimage: Some(payment_preimage), .. } => {
	/// println!(\"Claiming payment {}\", payment_hash);
	/// channel_manager.claim_funds(payment_preimage);
	/// },
	/// PaymentPurpose::Bolt12OfferPayment { payment_preimage: None, .. } => {
	/// println!(\"Unknown payment hash: {}\", payment_hash);
	/// }
	/// #           _ => {},
	/// },
	/// Event::PaymentClaimed { payment_hash, amount_msat, .. } => {
	/// println!(\"Claimed {} msats\", amount_msat);
	/// },
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # Ok(())
	/// # }
	/// ```
	///
	/// Use [`pay_for_offer`] to initiated payment, which sends an [`InvoiceRequest`] for an [`Offer`]
	/// and pays the [`Bolt12Invoice`] response.
	///
	/// ```
	/// # use lightning::events::{Event, EventsProvider};
	/// # use lightning::ln::channelmanager::{AChannelManager, PaymentId, RecentPaymentDetails, Retry};
	/// # use lightning::offers::offer::Offer;
	/// #
	/// # fn example<T: AChannelManager>(
	/// #     channel_manager: T, offer: &Offer, quantity: Option<u64>, amount_msats: Option<u64>,
	/// #     payer_note: Option<String>, retry: Retry, max_total_routing_fee_msat: Option<u64>
	/// # ) {
	/// # let channel_manager = channel_manager.get_cm();
	/// let payment_id = PaymentId([42; 32]);
	/// match channel_manager.pay_for_offer(
	/// offer, quantity, amount_msats, payer_note, payment_id, retry, max_total_routing_fee_msat
	/// ) {
	/// Ok(()) => println!(\"Requesting invoice for offer\"),
	/// Err(e) => println!(\"Unable to request invoice for offer: {:?}\", e),
	/// }
	///
	/// // First the payment will be waiting on an invoice
	/// let expected_payment_id = payment_id;
	/// assert!(
	/// channel_manager.list_recent_payments().iter().find(|details| matches!(
	/// details,
	/// RecentPaymentDetails::AwaitingInvoice { payment_id: expected_payment_id }
	/// )).is_some()
	/// );
	///
	/// // Once the invoice is received, a payment will be sent
	/// assert!(
	/// channel_manager.list_recent_payments().iter().find(|details| matches!(
	/// details,
	/// RecentPaymentDetails::Pending { payment_id: expected_payment_id, ..  }
	/// )).is_some()
	/// );
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::PaymentSent { payment_id: Some(payment_id), .. } => println!(\"Paid {}\", payment_id),
	/// Event::PaymentFailed { payment_id, .. } => println!(\"Failed paying {}\", payment_id),
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// ## BOLT 12 Refunds
	///
	/// A [`Refund`] is a request for an invoice to be paid. Like *paying* for an [`Offer`], *creating*
	/// a [`Refund`] involves maintaining state since it represents a future outbound payment.
	/// Therefore, use [`create_refund_builder`] when creating one, otherwise [`ChannelManager`] will
	/// refuse to pay any corresponding [`Bolt12Invoice`] that it receives.
	///
	/// ```
	/// # use core::time::Duration;
	/// # use lightning::events::{Event, EventsProvider};
	/// # use lightning::ln::channelmanager::{AChannelManager, PaymentId, RecentPaymentDetails, Retry};
	/// # use lightning::offers::parse::Bolt12SemanticError;
	/// #
	/// # fn example<T: AChannelManager>(
	/// #     channel_manager: T, amount_msats: u64, absolute_expiry: Duration, retry: Retry,
	/// #     max_total_routing_fee_msat: Option<u64>
	/// # ) -> Result<(), Bolt12SemanticError> {
	/// # let channel_manager = channel_manager.get_cm();
	/// let payment_id = PaymentId([42; 32]);
	/// let refund = channel_manager
	/// .create_refund_builder(
	/// amount_msats, absolute_expiry, payment_id, retry, max_total_routing_fee_msat
	/// )?
	/// # ;
	/// # // Needed for compiling for c_bindings
	/// # let builder: lightning::offers::refund::RefundBuilder<_> = refund.into();
	/// # let refund = builder
	/// .description(\"coffee\".to_string())
	/// .payer_note(\"refund for order 1234\".to_string())
	/// .build()?;
	/// let bech32_refund = refund.to_string();
	///
	/// // First the payment will be waiting on an invoice
	/// let expected_payment_id = payment_id;
	/// assert!(
	/// channel_manager.list_recent_payments().iter().find(|details| matches!(
	/// details,
	/// RecentPaymentDetails::AwaitingInvoice { payment_id: expected_payment_id }
	/// )).is_some()
	/// );
	///
	/// // Once the invoice is received, a payment will be sent
	/// assert!(
	/// channel_manager.list_recent_payments().iter().find(|details| matches!(
	/// details,
	/// RecentPaymentDetails::Pending { payment_id: expected_payment_id, ..  }
	/// )).is_some()
	/// );
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::PaymentSent { payment_id: Some(payment_id), .. } => println!(\"Paid {}\", payment_id),
	/// Event::PaymentFailed { payment_id, .. } => println!(\"Failed paying {}\", payment_id),
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # Ok(())
	/// # }
	/// ```
	///
	/// Use [`request_refund_payment`] to send a [`Bolt12Invoice`] for receiving the refund. Similar to
	/// *creating* an [`Offer`], this is stateless as it represents an inbound payment.
	///
	/// ```
	/// # use lightning::events::{Event, EventsProvider, PaymentPurpose};
	/// # use lightning::ln::channelmanager::AChannelManager;
	/// # use lightning::offers::refund::Refund;
	/// #
	/// # fn example<T: AChannelManager>(channel_manager: T, refund: &Refund) {
	/// # let channel_manager = channel_manager.get_cm();
	/// let known_payment_hash = match channel_manager.request_refund_payment(refund) {
	/// Ok(invoice) => {
	/// let payment_hash = invoice.payment_hash();
	/// println!(\"Requesting refund payment {}\", payment_hash);
	/// payment_hash
	/// },
	/// Err(e) => panic!(\"Unable to request payment for refund: {:?}\", e),
	/// };
	///
	/// // On the event processing thread
	/// channel_manager.process_pending_events(&|event| {
	/// match event {
	/// Event::PaymentClaimable { payment_hash, purpose, .. } => match purpose {
	/// PaymentPurpose::Bolt12RefundPayment { payment_preimage: Some(payment_preimage), .. } => {
	/// assert_eq!(payment_hash, known_payment_hash);
	/// println!(\"Claiming payment {}\", payment_hash);
	/// channel_manager.claim_funds(payment_preimage);
	/// },
	/// PaymentPurpose::Bolt12RefundPayment { payment_preimage: None, .. } => {
	/// println!(\"Unknown payment hash: {}\", payment_hash);
	/// },
	/// // ...
	/// #           _ => {},
	/// },
	/// Event::PaymentClaimed { payment_hash, amount_msat, .. } => {
	/// assert_eq!(payment_hash, known_payment_hash);
	/// println!(\"Claimed {} msats\", amount_msat);
	/// },
	/// // ...
	/// #     _ => {},
	/// }
	/// Ok(())
	/// });
	/// # }
	/// ```
	///
	/// # Persistence
	///
	/// Implements [`Writeable`] to write out all channel state to disk. Implies [`peer_disconnected`] for
	/// all peers during write/read (though does not modify this instance, only the instance being
	/// serialized). This will result in any channels which have not yet exchanged [`funding_created`] (i.e.,
	/// called [`funding_transaction_generated`] for outbound channels) being closed.
	///
	/// Note that you can be a bit lazier about writing out `ChannelManager` than you can be with
	/// [`ChannelMonitor`]. With [`ChannelMonitor`] you MUST durably write each
	/// [`ChannelMonitorUpdate`] before returning from
	/// [`chain::Watch::watch_channel`]/[`update_channel`] or before completing async writes. With
	/// `ChannelManager`s, writing updates happens out-of-band (and will prevent any other
	/// `ChannelManager` operations from occurring during the serialization process). If the
	/// deserialized version is out-of-date compared to the [`ChannelMonitor`] passed by reference to
	/// [`read`], those channels will be force-closed based on the `ChannelMonitor` state and no funds
	/// will be lost (modulo on-chain transaction fees).
	///
	/// Note that the deserializer is only implemented for `(`[`BlockHash`]`, `[`ChannelManager`]`)`, which
	/// tells you the last block hash which was connected. You should get the best block tip before using the manager.
	/// See [`chain::Listen`] and [`chain::Confirm`] for more details.
	///
	/// # `ChannelUpdate` Messages
	///
	/// Note that `ChannelManager` is responsible for tracking liveness of its channels and generating
	/// [`ChannelUpdate`] messages informing peers that the channel is temporarily disabled. To avoid
	/// spam due to quick disconnection/reconnection, updates are not sent until the channel has been
	/// offline for a full minute. In order to track this, you must call
	/// [`timer_tick_occurred`] roughly once per minute, though it doesn't have to be perfect.
	///
	/// # DoS Mitigation
	///
	/// To avoid trivial DoS issues, `ChannelManager` limits the number of inbound connections and
	/// inbound channels without confirmed funding transactions. This may result in nodes which we do
	/// not have a channel with being unable to connect to us or open new channels with us if we have
	/// many peers with unfunded channels.
	///
	/// Because it is an indication of trust, inbound channels which we've accepted as 0conf are
	/// exempted from the count of unfunded channels. Similarly, outbound channels and connections are
	/// never limited. Please ensure you limit the count of such channels yourself.
	///
	/// # Type Aliases
	///
	/// Rather than using a plain `ChannelManager`, it is preferable to use either a [`SimpleArcChannelManager`]
	/// a [`SimpleRefChannelManager`], for conciseness. See their documentation for more details, but
	/// essentially you should default to using a [`SimpleRefChannelManager`], and use a
	/// [`SimpleArcChannelManager`] when you require a `ChannelManager` with a static lifetime, such as when
	/// you're using lightning-net-tokio.
	///
	/// [`ChainMonitor`]: crate::chain::chainmonitor::ChainMonitor
	/// [`MessageHandler`]: crate::ln::peer_handler::MessageHandler
	/// [`OnionMessenger`]: crate::onion_message::messenger::OnionMessenger
	/// [`PeerManager::read_event`]: crate::ln::peer_handler::PeerManager::read_event
	/// [`PeerManager::process_events`]: crate::ln::peer_handler::PeerManager::process_events
	/// [`timer_tick_occurred`]: Self::timer_tick_occurred
	/// [`get_and_clear_needs_persistence`]: Self::get_and_clear_needs_persistence
	/// [`Persister`]: crate::util::persist::Persister
	/// [`KVStore`]: crate::util::persist::KVStore
	/// [`get_event_or_persistence_needed_future`]: Self::get_event_or_persistence_needed_future
	/// [`lightning-block-sync`]: https://docs.rs/lightning_block_sync/latest/lightning_block_sync
	/// [`lightning-transaction-sync`]: https://docs.rs/lightning_transaction_sync/latest/lightning_transaction_sync
	/// [`lightning-background-processor`]: https://docs.rs/lightning_background_processor/lightning_background_processor
	/// [`list_channels`]: Self::list_channels
	/// [`list_usable_channels`]: Self::list_usable_channels
	/// [`create_channel`]: Self::create_channel
	/// [`close_channel`]: Self::force_close_broadcasting_latest_txn
	/// [`force_close_broadcasting_latest_txn`]: Self::force_close_broadcasting_latest_txn
	/// [BOLT 11]: https://github.com/lightning/bolts/blob/master/11-payment-encoding.md
	/// [BOLT 12]: https://github.com/rustyrussell/lightning-rfc/blob/guilt/offers/12-offer-encoding.md
	/// [`list_recent_payments`]: Self::list_recent_payments
	/// [`abandon_payment`]: Self::abandon_payment
	/// [`lightning-invoice`]: https://docs.rs/lightning_invoice/latest/lightning_invoice
	/// [`create_inbound_payment`]: Self::create_inbound_payment
	/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
	/// [`claim_funds`]: Self::claim_funds
	/// [`send_payment`]: Self::send_payment
	/// [`offers`]: crate::offers
	/// [`create_offer_builder`]: Self::create_offer_builder
	/// [`pay_for_offer`]: Self::pay_for_offer
	/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
	/// [`create_refund_builder`]: Self::create_refund_builder
	/// [`request_refund_payment`]: Self::request_refund_payment
	/// [`peer_disconnected`]: msgs::ChannelMessageHandler::peer_disconnected
	/// [`funding_created`]: msgs::FundingCreated
	/// [`funding_transaction_generated`]: Self::funding_transaction_generated
	/// [`BlockHash`]: bitcoin::hash_types::BlockHash
	/// [`update_channel`]: chain::Watch::update_channel
	/// [`ChannelUpdate`]: msgs::ChannelUpdate
	/// [`read`]: ReadableArgs::read
	public class ChannelManager: NativeTypeWrapper {

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

		internal var cType: LDKChannelManager?

		internal init(cType: LDKChannelManager, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelManager, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelManager, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ChannelManager, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelManager_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new `ChannelManager` to hold several channels and route between them.
		///
		/// The current time or latest block header time can be provided as the `current_timestamp`.
		///
		/// This is the main \"logic hub\" for all channel-related actions, and implements
		/// [`ChannelMessageHandler`].
		///
		/// Non-proportional fees are fixed according to our risk using the provided fee estimator.
		///
		/// Users need to notify the new `ChannelManager` when a new block is connected or
		/// disconnected using its [`block_connected`] and [`block_disconnected`] methods, starting
		/// from after [`params.best_block.block_hash`]. See [`chain::Listen`] and [`chain::Confirm`] for
		/// more details.
		///
		/// [`block_connected`]: chain::Listen::block_connected
		/// [`block_disconnected`]: chain::Listen::block_disconnected
		/// [`params.best_block.block_hash`]: chain::BestBlock::block_hash
		public init(
			feeEst: FeeEstimator, chainMonitor: Watch, txBroadcaster: BroadcasterInterface, router: Router,
			logger: Logger, entropySource: EntropySource, nodeSigner: NodeSigner, signerProvider: SignerProvider,
			config: UserConfig, params: ChainParameters, currentTimestamp: UInt32
		) {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelManager_new(
				feeEst.activate().cType!, chainMonitor.activate().cType!, txBroadcaster.activate().cType!,
				router.activate().cType!, logger.activate().cType!, entropySource.activate().cType!,
				nodeSigner.activate().cType!, signerProvider.activate().cType!, config.dynamicallyDangledClone().cType!,
				params.dynamicallyDangledClone().cType!, currentTimestamp)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ChannelManager(cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
				)


		}

		/// Gets the current configuration applied to all new channels.
		public func getCurrentDefaultConfiguration() -> UserConfig {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_current_default_configuration(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = UserConfig(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Creates a new outbound channel to the given remote node and with the given value.
		///
		/// `user_channel_id` will be provided back as in
		/// [`Event::FundingGenerationReady::user_channel_id`] to allow tracking of which events
		/// correspond with which `create_channel` call. Note that the `user_channel_id` defaults to a
		/// randomized value for inbound channels. `user_channel_id` has no meaning inside of LDK, it
		/// is simply copied to events and otherwise ignored.
		///
		/// Raises [`APIError::APIMisuseError`] when `channel_value_satoshis` > 2**24 or `push_msat` is
		/// greater than `channel_value_satoshis * 1k` or `channel_value_satoshis < 1000`.
		///
		/// Raises [`APIError::ChannelUnavailable`] if the channel cannot be opened due to failing to
		/// generate a shutdown scriptpubkey or destination script set by
		/// [`SignerProvider::get_shutdown_scriptpubkey`] or [`SignerProvider::get_destination_script`].
		///
		/// Note that we do not check if you are currently connected to the given peer. If no
		/// connection is available, the outbound `open_channel` message may fail to send, resulting in
		/// the channel eventually being silently forgotten (dropped on reload).
		///
		/// If `temporary_channel_id` is specified, it will be used as the temporary channel ID of the
		/// channel. Otherwise, a random one will be generated for you.
		///
		/// Returns the new Channel's temporary `channel_id`. This ID will appear as
		/// [`Event::FundingGenerationReady::temporary_channel_id`] and in
		/// [`ChannelDetails::channel_id`] until after
		/// [`ChannelManager::funding_transaction_generated`] is called, swapping the Channel's ID for
		/// one derived from the funding transaction's TXID. If the counterparty rejects the channel
		/// immediately, this temporary ID will appear in [`Event::ChannelClosed::channel_id`].
		///
		/// [`Event::FundingGenerationReady::user_channel_id`]: events::Event::FundingGenerationReady::user_channel_id
		/// [`Event::FundingGenerationReady::temporary_channel_id`]: events::Event::FundingGenerationReady::temporary_channel_id
		/// [`Event::ChannelClosed::channel_id`]: events::Event::ChannelClosed::channel_id
		///
		/// Note that temporary_channel_id (or a relevant inner pointer) may be NULL or all-0s to represent None
		/// Note that override_config (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func createChannel(
			theirNetworkKey: [UInt8], channelValueSatoshis: UInt64, pushMsat: UInt64, userChannelId: [UInt8],
			temporaryChannelId: ChannelId, overrideConfig: UserConfig
		) -> Result_ChannelIdAPIErrorZ {
			// native call variable prep

			let theirNetworkKeyPrimitiveWrapper = PublicKey(
				value: theirNetworkKey, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_create_channel(
						thisArgPointer, theirNetworkKeyPrimitiveWrapper.cType!, channelValueSatoshis, pushMsat,
						userChannelIdPrimitiveWrapper.cType!, temporaryChannelId.dynamicallyDangledClone().cType!,
						overrideConfig.dynamicallyDangledClone().cType!)
				}


			// cleanup

			// for elided types, we need this
			theirNetworkKeyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ChannelIdAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets the list of open channels, in random order. See [`ChannelDetails`] field documentation for
		/// more information.
		public func listChannels() -> [ChannelDetails] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_list_channels(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_ChannelDetailsZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Gets the list of usable channels, in random order. Useful as an argument to
		/// [`Router::find_route`] to ensure non-announced channels are used.
		///
		/// These are guaranteed to have their [`ChannelDetails::is_usable`] value set to true, see the
		/// documentation for [`ChannelDetails::is_usable`] for more info on exactly what the criteria
		/// are.
		public func listUsableChannels() -> [ChannelDetails] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_list_usable_channels(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_ChannelDetailsZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Gets the list of channels we have with a given counterparty, in random order.
		public func listChannelsWithCounterparty(counterpartyNodeId: [UInt8]) -> [ChannelDetails] {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_list_channels_with_counterparty(
						thisArgPointer, counterpartyNodeIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Vec_ChannelDetailsZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns in an undefined order recent payments that -- if not fulfilled -- have yet to find a
		/// successful path, or have unresolved HTLCs.
		///
		/// This can be useful for payments that may have been prepared, but ultimately not sent, as a
		/// result of a crash. If such a payment exists, is not listed here, and an
		/// [`Event::PaymentSent`] has not been received, you may consider resending the payment.
		///
		/// [`Event::PaymentSent`]: events::Event::PaymentSent
		public func listRecentPayments() -> [RecentPaymentDetails] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_list_recent_payments(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_RecentPaymentDetailsZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Begins the process of closing a channel. After this call (plus some timeout), no new HTLCs
		/// will be accepted on the given channel, and after additional timeout/the closing of all
		/// pending HTLCs, the channel will be closed on chain.
		///
		/// * If we are the channel initiator, we will pay between our [`ChannelCloseMinimum`] and
		/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`] plus our [`NonAnchorChannelFee`]
		/// fee estimate.
		/// * If our counterparty is the channel initiator, we will require a channel closing
		/// transaction feerate of at least our [`ChannelCloseMinimum`] feerate or the feerate which
		/// would appear on a force-closure transaction, whichever is lower. We will allow our
		/// counterparty to pay as much fee as they'd like, however.
		///
		/// May generate a [`SendShutdown`] message event on success, which should be relayed.
		///
		/// Raises [`APIError::ChannelUnavailable`] if the channel cannot be closed due to failing to
		/// generate a shutdown scriptpubkey or destination script set by
		/// [`SignerProvider::get_shutdown_scriptpubkey`]. A force-closure may be needed to close the
		/// channel.
		///
		/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`]: crate::util::config::ChannelConfig::force_close_avoidance_max_fee_satoshis
		/// [`ChannelCloseMinimum`]: crate::chain::chaininterface::ConfirmationTarget::ChannelCloseMinimum
		/// [`NonAnchorChannelFee`]: crate::chain::chaininterface::ConfirmationTarget::NonAnchorChannelFee
		/// [`SendShutdown`]: crate::events::MessageSendEvent::SendShutdown
		public func closeChannel(channelId: ChannelId, counterpartyNodeId: [UInt8]) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: channelId.cType!) { (channelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_close_channel(
							thisArgPointer, channelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Begins the process of closing a channel. After this call (plus some timeout), no new HTLCs
		/// will be accepted on the given channel, and after additional timeout/the closing of all
		/// pending HTLCs, the channel will be closed on chain.
		///
		/// `target_feerate_sat_per_1000_weight` has different meanings depending on if we initiated
		/// the channel being closed or not:
		/// * If we are the channel initiator, we will pay at least this feerate on the closing
		/// transaction. The upper-bound is set by
		/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`] plus our [`NonAnchorChannelFee`]
		/// fee estimate (or `target_feerate_sat_per_1000_weight`, if it is greater).
		/// * If our counterparty is the channel initiator, we will refuse to accept a channel closure
		/// transaction feerate below `target_feerate_sat_per_1000_weight` (or the feerate which
		/// will appear on a force-closure transaction, whichever is lower).
		///
		/// The `shutdown_script` provided  will be used as the `scriptPubKey` for the closing transaction.
		/// Will fail if a shutdown script has already been set for this channel by
		/// ['ChannelHandshakeConfig::commit_upfront_shutdown_pubkey`]. The given shutdown script must
		/// also be compatible with our and the counterparty's features.
		///
		/// May generate a [`SendShutdown`] message event on success, which should be relayed.
		///
		/// Raises [`APIError::ChannelUnavailable`] if the channel cannot be closed due to failing to
		/// generate a shutdown scriptpubkey or destination script set by
		/// [`SignerProvider::get_shutdown_scriptpubkey`]. A force-closure may be needed to close the
		/// channel.
		///
		/// [`ChannelConfig::force_close_avoidance_max_fee_satoshis`]: crate::util::config::ChannelConfig::force_close_avoidance_max_fee_satoshis
		/// [`NonAnchorChannelFee`]: crate::chain::chaininterface::ConfirmationTarget::NonAnchorChannelFee
		/// [`SendShutdown`]: crate::events::MessageSendEvent::SendShutdown
		///
		/// Note that shutdown_script (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func closeChannelWithFeerateAndScript(
			channelId: ChannelId, counterpartyNodeId: [UInt8], targetFeerateSatsPer1000Weight: UInt32?,
			shutdownScript: ShutdownScript
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let targetFeerateSatsPer1000WeightOption = Option_u32Z(
				some: targetFeerateSatsPer1000Weight,
				instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: channelId.cType!) { (channelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_close_channel_with_feerate_and_script(
							thisArgPointer, channelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!,
							targetFeerateSatsPer1000WeightOption.cType!, shutdownScript.dynamicallyDangledClone().cType!
						)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Force closes a channel, immediately broadcasting the latest local transaction(s),
		/// rejecting new HTLCs.
		///
		/// The provided `error_message` is sent to connected peers for closing
		/// channels and should be a human-readable description of what went wrong.
		///
		/// Fails if `channel_id` is unknown to the manager, or if the `counterparty_node_id`
		/// isn't the counterparty of the corresponding channel.
		public func forceCloseBroadcastingLatestTxn(
			channelId: ChannelId, counterpartyNodeId: [UInt8], errorMessage: String
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let errorMessagePrimitiveWrapper = Str(
				value: errorMessage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: channelId.cType!) { (channelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_force_close_broadcasting_latest_txn(
							thisArgPointer, channelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!,
							errorMessagePrimitiveWrapper.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			errorMessagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Force closes a channel, rejecting new HTLCs on the given channel but skips broadcasting
		/// the latest local transaction(s).
		///
		/// The provided `error_message` is sent to connected peers for closing channels and should
		/// be a human-readable description of what went wrong.
		///
		/// Fails if `channel_id` is unknown to the manager, or if the
		/// `counterparty_node_id` isn't the counterparty of the corresponding channel.
		/// You can always broadcast the latest local transaction(s) via
		/// [`ChannelMonitor::broadcast_latest_holder_commitment_txn`].
		public func forceCloseWithoutBroadcastingTxn(
			channelId: ChannelId, counterpartyNodeId: [UInt8], errorMessage: String
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let errorMessagePrimitiveWrapper = Str(
				value: errorMessage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: channelId.cType!) { (channelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_force_close_without_broadcasting_txn(
							thisArgPointer, channelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!,
							errorMessagePrimitiveWrapper.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			errorMessagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Force close all channels, immediately broadcasting the latest local commitment transaction
		/// for each to the chain and rejecting new HTLCs on each.
		///
		/// The provided `error_message` is sent to connected peers for closing channels and should
		/// be a human-readable description of what went wrong.
		public func forceCloseAllChannelsBroadcastingLatestTxn(errorMessage: String) {
			// native call variable prep

			let errorMessagePrimitiveWrapper = Str(
				value: errorMessage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_force_close_all_channels_broadcasting_latest_txn(
						thisArgPointer, errorMessagePrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			errorMessagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Force close all channels rejecting new HTLCs on each but without broadcasting the latest
		/// local transaction(s).
		///
		/// The provided `error_message` is sent to connected peers for closing channels and
		/// should be a human-readable description of what went wrong.
		public func forceCloseAllChannelsWithoutBroadcastingTxn(errorMessage: String) {
			// native call variable prep

			let errorMessagePrimitiveWrapper = Str(
				value: errorMessage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_force_close_all_channels_without_broadcasting_txn(
						thisArgPointer, errorMessagePrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			errorMessagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sends a payment along a given route.
		///
		/// This method is *DEPRECATED*, use [`Self::send_payment`] instead. If you wish to fix the
		/// route for a payment, do so by matching the [`PaymentId`] passed to
		/// [`Router::find_route_with_id`].
		///
		/// Value parameters are provided via the last hop in route, see documentation for [`RouteHop`]
		/// fields for more info.
		///
		/// May generate [`UpdateHTLCs`] message(s) event on success, which should be relayed (e.g. via
		/// [`PeerManager::process_events`]).
		///
		/// # Avoiding Duplicate Payments
		///
		/// If a pending payment is currently in-flight with the same [`PaymentId`] provided, this
		/// method will error with an [`APIError::InvalidRoute`]. Note, however, that once a payment
		/// is no longer pending (either via [`ChannelManager::abandon_payment`], or handling of an
		/// [`Event::PaymentSent`] or [`Event::PaymentFailed`]) LDK will not stop you from sending a
		/// second payment with the same [`PaymentId`].
		///
		/// Thus, in order to ensure duplicate payments are not sent, you should implement your own
		/// tracking of payments, including state to indicate once a payment has completed. Because you
		/// should also ensure that [`PaymentHash`]es are not re-used, for simplicity, you should
		/// consider using the [`PaymentHash`] as the key for tracking payments. In that case, the
		/// [`PaymentId`] should be a copy of the [`PaymentHash`] bytes.
		///
		/// Additionally, in the scenario where we begin the process of sending a payment, but crash
		/// before `send_payment` returns (or prior to [`ChannelMonitorUpdate`] persistence if you're
		/// using [`ChannelMonitorUpdateStatus::InProgress`]), the payment may be lost on restart. See
		/// [`ChannelManager::list_recent_payments`] for more information.
		///
		/// # Possible Error States on [`PaymentSendFailure`]
		///
		/// Each path may have a different return value, and [`PaymentSendFailure`] may return a `Vec` with
		/// each entry matching the corresponding-index entry in the route paths, see
		/// [`PaymentSendFailure`] for more info.
		///
		/// In general, a path may raise:
		/// * [`APIError::InvalidRoute`] when an invalid route or forwarding parameter (cltv_delta, fee,
		/// node public key) is specified.
		/// * [`APIError::ChannelUnavailable`] if the next-hop channel is not available as it has been
		/// closed, doesn't exist, or the peer is currently disconnected.
		/// * [`APIError::MonitorUpdateInProgress`] if a new monitor update failure prevented sending the
		/// relevant updates.
		///
		/// Note that depending on the type of the [`PaymentSendFailure`] the HTLC may have been
		/// irrevocably committed to on our end. In such a case, do NOT retry the payment with a
		/// different route unless you intend to pay twice!
		///
		/// [`RouteHop`]: crate::routing::router::RouteHop
		/// [`Event::PaymentSent`]: events::Event::PaymentSent
		/// [`Event::PaymentFailed`]: events::Event::PaymentFailed
		/// [`UpdateHTLCs`]: events::MessageSendEvent::UpdateHTLCs
		/// [`PeerManager::process_events`]: crate::ln::peer_handler::PeerManager::process_events
		/// [`ChannelMonitorUpdateStatus::InProgress`]: crate::chain::ChannelMonitorUpdateStatus::InProgress
		public func sendPaymentWithRoute(
			route: Route, paymentHash: [UInt8], recipientOnion: RecipientOnionFields, paymentId: [UInt8]
		) -> Result_NonePaymentSendFailureZ {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_send_payment_with_route(
						thisArgPointer, route.dynamicallyDangledClone().cType!, paymentHashPrimitiveWrapper.cType!,
						recipientOnion.dynamicallyDangledClone().cType!, paymentIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NonePaymentSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Similar to [`ChannelManager::send_payment_with_route`], but will automatically find a route based on
		/// `route_params` and retry failed payment paths based on `retry_strategy`.
		public func sendPayment(
			paymentHash: [UInt8], recipientOnion: RecipientOnionFields, paymentId: [UInt8],
			routeParams: RouteParameters, retryStrategy: Retry
		) -> Result_NoneRetryableSendFailureZ {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_send_payment(
						thisArgPointer, paymentHashPrimitiveWrapper.cType!,
						recipientOnion.dynamicallyDangledClone().cType!, paymentIdPrimitiveWrapper.cType!,
						routeParams.dynamicallyDangledClone().cType!, retryStrategy.danglingClone().cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneRetryableSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Signals that no further attempts for the given payment should occur. Useful if you have a
		/// pending outbound payment with retries remaining, but wish to stop retrying the payment before
		/// retries are exhausted.
		///
		/// # Event Generation
		///
		/// If no [`Event::PaymentFailed`] event had been generated before, one will be generated as soon
		/// as there are no remaining pending HTLCs for this payment.
		///
		/// Note that calling this method does *not* prevent a payment from succeeding. You must still
		/// wait until you receive either a [`Event::PaymentFailed`] or [`Event::PaymentSent`] event to
		/// determine the ultimate status of a payment.
		///
		/// # Requested Invoices
		///
		/// In the case of paying a [`Bolt12Invoice`] via [`ChannelManager::pay_for_offer`], abandoning
		/// the payment prior to receiving the invoice will result in an [`Event::PaymentFailed`] and
		/// prevent any attempts at paying it once received.
		///
		/// # Restart Behavior
		///
		/// If an [`Event::PaymentFailed`] is generated and we restart without first persisting the
		/// [`ChannelManager`], another [`Event::PaymentFailed`] may be generated.
		///
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		public func abandonPayment(paymentId: [UInt8]) {
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_abandon_payment(thisArgPointer, paymentIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Send a spontaneous payment, which is a payment that does not require the recipient to have
		/// generated an invoice. Optionally, you may specify the preimage. If you do choose to specify
		/// the preimage, it must be a cryptographically secure random value that no intermediate node
		/// would be able to guess -- otherwise, an intermediate node may claim the payment and it will
		/// never reach the recipient.
		///
		/// See [`send_payment`] documentation for more details on the return value of this function
		/// and idempotency guarantees provided by the [`PaymentId`] key.
		///
		/// Similar to regular payments, you MUST NOT reuse a `payment_preimage` value. See
		/// [`send_payment`] for more information about the risks of duplicate preimage usage.
		///
		/// [`send_payment`]: Self::send_payment
		public func sendSpontaneousPayment(
			route: Route, paymentPreimage: [UInt8]?, recipientOnion: RecipientOnionFields, paymentId: [UInt8]
		) -> Result_ThirtyTwoBytesPaymentSendFailureZ {
			// native call variable prep

			let paymentPreimageOption = Option_ThirtyTwoBytesZ(
				some: paymentPreimage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
						ChannelManager_send_spontaneous_payment(
							thisArgPointer, routePointer, paymentPreimageOption.cType!,
							recipientOnion.dynamicallyDangledClone().cType!, paymentIdPrimitiveWrapper.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesPaymentSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Similar to [`ChannelManager::send_spontaneous_payment`], but will automatically find a route
		/// based on `route_params` and retry failed payment paths based on `retry_strategy`.
		///
		/// See [`PaymentParameters::for_keysend`] for help in constructing `route_params` for spontaneous
		/// payments.
		///
		/// [`PaymentParameters::for_keysend`]: crate::routing::router::PaymentParameters::for_keysend
		public func sendSpontaneousPaymentWithRetry(
			paymentPreimage: [UInt8]?, recipientOnion: RecipientOnionFields, paymentId: [UInt8],
			routeParams: RouteParameters, retryStrategy: Retry
		) -> Result_ThirtyTwoBytesRetryableSendFailureZ {
			// native call variable prep

			let paymentPreimageOption = Option_ThirtyTwoBytesZ(
				some: paymentPreimage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_send_spontaneous_payment_with_retry(
						thisArgPointer, paymentPreimageOption.cType!, recipientOnion.dynamicallyDangledClone().cType!,
						paymentIdPrimitiveWrapper.cType!, routeParams.dynamicallyDangledClone().cType!,
						retryStrategy.danglingClone().cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesRetryableSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Send a payment that is probing the given route for liquidity. We calculate the
		/// [`PaymentHash`] of probes based on a static secret and a random [`PaymentId`], which allows
		/// us to easily discern them from real payments.
		public func sendProbe(path: Path) -> Result_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZPaymentSendFailureZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_send_probe(thisArgPointer, path.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZPaymentSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sends payment probes over all paths of a route that would be used to pay the given
		/// amount to the given `node_id`.
		///
		/// See [`ChannelManager::send_preflight_probes`] for more information.
		public func sendSpontaneousPreflightProbes(
			nodeId: [UInt8], amountMsat: UInt64, finalCltvExpiryDelta: UInt32, liquidityLimitMultiplier: UInt64?
		) -> Result_CVec_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZZProbeSendFailureZ {
			// native call variable prep

			let nodeIdPrimitiveWrapper = PublicKey(
				value: nodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let liquidityLimitMultiplierOption = Option_u64Z(
				some: liquidityLimitMultiplier, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_send_spontaneous_preflight_probes(
						thisArgPointer, nodeIdPrimitiveWrapper.cType!, amountMsat, finalCltvExpiryDelta,
						liquidityLimitMultiplierOption.cType!)
				}


			// cleanup

			// for elided types, we need this
			nodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_CVec_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZZProbeSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sends payment probes over all paths of a route that would be used to pay a route found
		/// according to the given [`RouteParameters`].
		///
		/// This may be used to send \"pre-flight\" probes, i.e., to train our scorer before conducting
		/// the actual payment. Note this is only useful if there likely is sufficient time for the
		/// probe to settle before sending out the actual payment, e.g., when waiting for user
		/// confirmation in a wallet UI.
		///
		/// Otherwise, there is a chance the probe could take up some liquidity needed to complete the
		/// actual payment. Users should therefore be cautious and might avoid sending probes if
		/// liquidity is scarce and/or they don't expect the probe to return before they send the
		/// payment. To mitigate this issue, channels with available liquidity less than the required
		/// amount times the given `liquidity_limit_multiplier` won't be used to send pre-flight
		/// probes. If `None` is given as `liquidity_limit_multiplier`, it defaults to `3`.
		public func sendPreflightProbes(routeParams: RouteParameters, liquidityLimitMultiplier: UInt64?)
			-> Result_CVec_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZZProbeSendFailureZ
		{
			// native call variable prep

			let liquidityLimitMultiplierOption = Option_u64Z(
				some: liquidityLimitMultiplier, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_send_preflight_probes(
						thisArgPointer, routeParams.dynamicallyDangledClone().cType!,
						liquidityLimitMultiplierOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_CVec_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZZProbeSendFailureZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Call this upon creation of a funding transaction for the given channel.
		///
		/// Returns an [`APIError::APIMisuseError`] if the funding_transaction spent non-SegWit outputs
		/// or if no output was found which matches the parameters in [`Event::FundingGenerationReady`].
		///
		/// Returns [`APIError::APIMisuseError`] if the funding transaction is not final for propagation
		/// across the p2p network.
		///
		/// Returns [`APIError::ChannelUnavailable`] if a funding transaction has already been provided
		/// for the channel or if the channel has been closed as indicated by [`Event::ChannelClosed`].
		///
		/// May panic if the output found in the funding transaction is duplicative with some other
		/// channel (note that this should be trivially prevented by using unique funding transaction
		/// keys per-channel).
		///
		/// Do NOT broadcast the funding transaction yourself. When we have safely received our
		/// counterparty's signature the funding transaction will automatically be broadcast via the
		/// [`BroadcasterInterface`] provided when this `ChannelManager` was constructed.
		///
		/// Note that this includes RBF or similar transaction replacement strategies - lightning does
		/// not currently support replacing a funding transaction on an existing channel. Instead,
		/// create a new channel with a conflicting funding transaction.
		///
		/// Note to keep the miner incentives aligned in moving the blockchain forward, we recommend
		/// the wallet software generating the funding transaction to apply anti-fee sniping as
		/// implemented by Bitcoin Core wallet. See <https://bitcoinops.org/en/topics/fee-sniping/>
		/// for more details.
		///
		/// [`Event::FundingGenerationReady`]: crate::events::Event::FundingGenerationReady
		/// [`Event::ChannelClosed`]: crate::events::Event::ChannelClosed
		public func fundingTransactionGenerated(
			temporaryChannelId: ChannelId, counterpartyNodeId: [UInt8], fundingTransaction: [UInt8]
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let fundingTransactionPrimitiveWrapper = Transaction(
				value: fundingTransaction, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_funding_transaction_generated(
						thisArgPointer, temporaryChannelId.dynamicallyDangledClone().cType!,
						counterpartyNodeIdPrimitiveWrapper.cType!, fundingTransactionPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			fundingTransactionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// **Unsafe**: This method does not validate the spent output. It is the caller's
		/// responsibility to ensure the spent outputs are SegWit, as well as making sure the funding
		/// transaction has a final absolute locktime, i.e., its locktime is lower than the next block height.
		///
		/// For a safer method, please refer to [`ChannelManager::funding_transaction_generated`].
		///
		/// Call this in response to a [`Event::FundingGenerationReady`] event.
		///
		/// Note that if this method is called successfully, the funding transaction won't be
		/// broadcasted and you are expected to broadcast it manually when receiving the
		/// [`Event::FundingTxBroadcastSafe`] event.
		///
		/// Returns [`APIError::ChannelUnavailable`] if a funding transaction has already been provided
		/// for the channel or if the channel has been closed as indicated by [`Event::ChannelClosed`].
		///
		/// May panic if the funding output is duplicative with some other channel (note that this
		/// should be trivially prevented by using unique funding transaction keys per-channel).
		///
		/// Note to keep the miner incentives aligned in moving the blockchain forward, we recommend
		/// the wallet software generating the funding transaction to apply anti-fee sniping as
		/// implemented by Bitcoin Core wallet. See <https://bitcoinops.org/en/topics/fee-sniping/> for
		/// more details.
		///
		/// [`Event::FundingGenerationReady`]: crate::events::Event::FundingGenerationReady
		/// [`Event::FundingTxBroadcastSafe`]: crate::events::Event::FundingTxBroadcastSafe
		/// [`Event::ChannelClosed`]: crate::events::Event::ChannelClosed
		/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
		public func unsafeManualFundingTransactionGenerated(
			temporaryChannelId: ChannelId, counterpartyNodeId: [UInt8], funding: OutPoint
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_unsafe_manual_funding_transaction_generated(
						thisArgPointer, temporaryChannelId.dynamicallyDangledClone().cType!,
						counterpartyNodeIdPrimitiveWrapper.cType!, funding.dynamicallyDangledClone().cType!)
				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Call this upon creation of a batch funding transaction for the given channels.
		///
		/// Return values are identical to [`Self::funding_transaction_generated`], respective to
		/// each individual channel and transaction output.
		///
		/// Do NOT broadcast the funding transaction yourself. This batch funding transaction
		/// will only be broadcast when we have safely received and persisted the counterparty's
		/// signature for each channel.
		///
		/// If there is an error, all channels in the batch are to be considered closed.
		public func batchFundingTransactionGenerated(
			temporaryChannels: [(ChannelId, [UInt8])], fundingTransaction: [UInt8]
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let temporaryChannelsVector = Vec_C2Tuple_ChannelIdPublicKeyZZ(
				array: temporaryChannels, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()

			let fundingTransactionPrimitiveWrapper = Transaction(
				value: fundingTransaction, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_batch_funding_transaction_generated(
						thisArgPointer, temporaryChannelsVector.cType!, fundingTransactionPrimitiveWrapper.cType!)
				}


			// cleanup

			// temporaryChannelsVector.noOpRetain()

			// for elided types, we need this
			fundingTransactionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Atomically applies partial updates to the [`ChannelConfig`] of the given channels.
		///
		/// Once the updates are applied, each eligible channel (advertised with a known short channel
		/// ID and a change in [`forwarding_fee_proportional_millionths`], [`forwarding_fee_base_msat`],
		/// or [`cltv_expiry_delta`]) has a [`BroadcastChannelUpdate`] event message generated
		/// containing the new [`ChannelUpdate`] message which should be broadcast to the network.
		///
		/// Returns [`ChannelUnavailable`] when a channel is not found or an incorrect
		/// `counterparty_node_id` is provided.
		///
		/// Returns [`APIMisuseError`] when a [`cltv_expiry_delta`] update is to be applied with a value
		/// below [`MIN_CLTV_EXPIRY_DELTA`].
		///
		/// If an error is returned, none of the updates should be considered applied.
		///
		/// [`forwarding_fee_proportional_millionths`]: ChannelConfig::forwarding_fee_proportional_millionths
		/// [`forwarding_fee_base_msat`]: ChannelConfig::forwarding_fee_base_msat
		/// [`cltv_expiry_delta`]: ChannelConfig::cltv_expiry_delta
		/// [`BroadcastChannelUpdate`]: events::MessageSendEvent::BroadcastChannelUpdate
		/// [`ChannelUpdate`]: msgs::ChannelUpdate
		/// [`ChannelUnavailable`]: APIError::ChannelUnavailable
		/// [`APIMisuseError`]: APIError::APIMisuseError
		public func updatePartialChannelConfig(
			counterpartyNodeId: [UInt8], channelIds: [ChannelId], configUpdate: ChannelConfigUpdate
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let channelIdsVector = Vec_ChannelIdZ(
				array: channelIds, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: configUpdate.cType!) {
						(configUpdatePointer: UnsafePointer<LDKChannelConfigUpdate>) in
						ChannelManager_update_partial_channel_config(
							thisArgPointer, counterpartyNodeIdPrimitiveWrapper.cType!, channelIdsVector.cType!,
							configUpdatePointer)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// channelIdsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Atomically updates the [`ChannelConfig`] for the given channels.
		///
		/// Once the updates are applied, each eligible channel (advertised with a known short channel
		/// ID and a change in [`forwarding_fee_proportional_millionths`], [`forwarding_fee_base_msat`],
		/// or [`cltv_expiry_delta`]) has a [`BroadcastChannelUpdate`] event message generated
		/// containing the new [`ChannelUpdate`] message which should be broadcast to the network.
		///
		/// Returns [`ChannelUnavailable`] when a channel is not found or an incorrect
		/// `counterparty_node_id` is provided.
		///
		/// Returns [`APIMisuseError`] when a [`cltv_expiry_delta`] update is to be applied with a value
		/// below [`MIN_CLTV_EXPIRY_DELTA`].
		///
		/// If an error is returned, none of the updates should be considered applied.
		///
		/// [`forwarding_fee_proportional_millionths`]: ChannelConfig::forwarding_fee_proportional_millionths
		/// [`forwarding_fee_base_msat`]: ChannelConfig::forwarding_fee_base_msat
		/// [`cltv_expiry_delta`]: ChannelConfig::cltv_expiry_delta
		/// [`BroadcastChannelUpdate`]: events::MessageSendEvent::BroadcastChannelUpdate
		/// [`ChannelUpdate`]: msgs::ChannelUpdate
		/// [`ChannelUnavailable`]: APIError::ChannelUnavailable
		/// [`APIMisuseError`]: APIError::APIMisuseError
		public func updateChannelConfig(counterpartyNodeId: [UInt8], channelIds: [ChannelId], config: ChannelConfig)
			-> Result_NoneAPIErrorZ
		{
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let channelIdsVector = Vec_ChannelIdZ(
				array: channelIds, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: config.cType!) { (configPointer: UnsafePointer<LDKChannelConfig>) in
						ChannelManager_update_channel_config(
							thisArgPointer, counterpartyNodeIdPrimitiveWrapper.cType!, channelIdsVector.cType!,
							configPointer)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// channelIdsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Attempts to forward an intercepted HTLC over the provided channel id and with the provided
		/// amount to forward. Should only be called in response to an [`HTLCIntercepted`] event.
		///
		/// Intercepted HTLCs can be useful for Lightning Service Providers (LSPs) to open a just-in-time
		/// channel to a receiving node if the node lacks sufficient inbound liquidity.
		///
		/// To make use of intercepted HTLCs, set [`UserConfig::accept_intercept_htlcs`] and use
		/// [`ChannelManager::get_intercept_scid`] to generate short channel id(s) to put in the
		/// receiver's invoice route hints. These route hints will signal to LDK to generate an
		/// [`HTLCIntercepted`] event when it receives the forwarded HTLC, and this method or
		/// [`ChannelManager::fail_intercepted_htlc`] MUST be called in response to the event.
		///
		/// Note that LDK does not enforce fee requirements in `amt_to_forward_msat`, and will not stop
		/// you from forwarding more than you received. See
		/// [`HTLCIntercepted::expected_outbound_amount_msat`] for more on forwarding a different amount
		/// than expected.
		///
		/// Errors if the event was not handled in time, in which case the HTLC was automatically failed
		/// backwards.
		///
		/// [`UserConfig::accept_intercept_htlcs`]: crate::util::config::UserConfig::accept_intercept_htlcs
		/// [`HTLCIntercepted`]: events::Event::HTLCIntercepted
		/// [`HTLCIntercepted::expected_outbound_amount_msat`]: events::Event::HTLCIntercepted::expected_outbound_amount_msat
		public func forwardInterceptedHtlc(
			interceptId: [UInt8], nextHopChannelId: ChannelId, nextNodeId: [UInt8], amtToForwardMsat: UInt64
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let interceptIdPrimitiveWrapper = ThirtyTwoBytes(
				value: interceptId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let nextNodeIdPrimitiveWrapper = PublicKey(
				value: nextNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: nextHopChannelId.cType!) {
						(nextHopChannelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_forward_intercepted_htlc(
							thisArgPointer, interceptIdPrimitiveWrapper.cType!, nextHopChannelIdPointer,
							nextNodeIdPrimitiveWrapper.cType!, amtToForwardMsat)
					}

				}


			// cleanup

			// for elided types, we need this
			interceptIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			nextNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Fails the intercepted HTLC indicated by intercept_id. Should only be called in response to
		/// an [`HTLCIntercepted`] event. See [`ChannelManager::forward_intercepted_htlc`].
		///
		/// Errors if the event was not handled in time, in which case the HTLC was automatically failed
		/// backwards.
		///
		/// [`HTLCIntercepted`]: events::Event::HTLCIntercepted
		public func failInterceptedHtlc(interceptId: [UInt8]) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let interceptIdPrimitiveWrapper = ThirtyTwoBytes(
				value: interceptId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_fail_intercepted_htlc(thisArgPointer, interceptIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			interceptIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Processes HTLCs which are pending waiting on random forward delay.
		///
		/// Should only really ever be called in response to a PendingHTLCsForwardable event.
		/// Will likely generate further events.
		public func processPendingHtlcForwards() {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_process_pending_htlc_forwards(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Performs actions which should happen on startup and roughly once per minute thereafter.
		///
		/// This currently includes:
		/// * Increasing or decreasing the on-chain feerate estimates for our outbound channels,
		/// * Broadcasting [`ChannelUpdate`] messages if we've been disconnected from our peer for more
		/// than a minute, informing the network that they should no longer attempt to route over
		/// the channel.
		/// * Expiring a channel's previous [`ChannelConfig`] if necessary to only allow forwarding HTLCs
		/// with the current [`ChannelConfig`].
		/// * Removing peers which have disconnected but and no longer have any channels.
		/// * Force-closing and removing channels which have not completed establishment in a timely manner.
		/// * Forgetting about stale outbound payments, either those that have already been fulfilled
		/// or those awaiting an invoice that hasn't been delivered in the necessary amount of time.
		/// The latter is determined using the system clock in `std` and the highest seen block time
		/// minus two hours in `no-std`.
		///
		/// Note that this may cause reentrancy through [`chain::Watch::update_channel`] calls or feerate
		/// estimate fetches.
		///
		/// [`ChannelUpdate`]: msgs::ChannelUpdate
		/// [`ChannelConfig`]: crate::util::config::ChannelConfig
		public func timerTickOccurred() {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_timer_tick_occurred(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Indicates that the preimage for payment_hash is unknown or the received amount is incorrect
		/// after a PaymentClaimable event, failing the HTLC back to its origin and freeing resources
		/// along the path (including in our own channel on which we received it).
		///
		/// Note that in some cases around unclean shutdown, it is possible the payment may have
		/// already been claimed by you via [`ChannelManager::claim_funds`] prior to you seeing (a
		/// second copy of) the [`events::Event::PaymentClaimable`] event. Alternatively, the payment
		/// may have already been failed automatically by LDK if it was nearing its expiration time.
		///
		/// While LDK will never claim a payment automatically on your behalf (i.e. without you calling
		/// [`ChannelManager::claim_funds`]), you should still monitor for
		/// [`events::Event::PaymentClaimed`] events even for payments you intend to fail, especially on
		/// startup during which time claims that were in-progress at shutdown may be replayed.
		public func failHtlcBackwards(paymentHash: [UInt8]) {
			// native call variable prep

			let tupledPaymentHash = Bindings.arrayToUInt8Tuple32(array: paymentHash)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: tupledPaymentHash) {
						(tupledPaymentHashPointer: UnsafePointer<UInt8Tuple32>) in
						ChannelManager_fail_htlc_backwards(thisArgPointer, tupledPaymentHashPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This is a variant of [`ChannelManager::fail_htlc_backwards`] that allows you to specify the
		/// reason for the failure.
		///
		/// See [`FailureCode`] for valid failure codes.
		public func failHtlcBackwardsWithReason(paymentHash: [UInt8], failureCode: FailureCode) {
			// native call variable prep

			let tupledPaymentHash = Bindings.arrayToUInt8Tuple32(array: paymentHash)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: tupledPaymentHash) {
						(tupledPaymentHashPointer: UnsafePointer<UInt8Tuple32>) in
						ChannelManager_fail_htlc_backwards_with_reason(
							thisArgPointer, tupledPaymentHashPointer, failureCode.danglingClone().cType!)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Provides a payment preimage in response to [`Event::PaymentClaimable`], generating any
		/// [`MessageSendEvent`]s needed to claim the payment.
		///
		/// This method is guaranteed to ensure the payment has been claimed but only if the current
		/// height is strictly below [`Event::PaymentClaimable::claim_deadline`]. To avoid race
		/// conditions, you should wait for an [`Event::PaymentClaimed`] before considering the payment
		/// successful. It will generally be available in the next [`process_pending_events`] call.
		///
		/// Note that if you did not set an `amount_msat` when calling [`create_inbound_payment`] or
		/// [`create_inbound_payment_for_hash`] you must check that the amount in the `PaymentClaimable`
		/// event matches your expectation. If you fail to do so and call this method, you may provide
		/// the sender \"proof-of-payment\" when they did not fulfill the full expected payment.
		///
		/// This function will fail the payment if it has custom TLVs with even type numbers, as we
		/// will assume they are unknown. If you intend to accept even custom TLVs, you should use
		/// [`claim_funds_with_known_custom_tlvs`].
		///
		/// [`Event::PaymentClaimable`]: crate::events::Event::PaymentClaimable
		/// [`Event::PaymentClaimable::claim_deadline`]: crate::events::Event::PaymentClaimable::claim_deadline
		/// [`Event::PaymentClaimed`]: crate::events::Event::PaymentClaimed
		/// [`process_pending_events`]: EventsProvider::process_pending_events
		/// [`create_inbound_payment`]: Self::create_inbound_payment
		/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
		/// [`claim_funds_with_known_custom_tlvs`]: Self::claim_funds_with_known_custom_tlvs
		public func claimFunds(paymentPreimage: [UInt8]) {
			// native call variable prep

			let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(
				value: paymentPreimage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_claim_funds(thisArgPointer, paymentPreimagePrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentPreimagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This is a variant of [`claim_funds`] that allows accepting a payment with custom TLVs with
		/// even type numbers.
		///
		/// # Note
		///
		/// You MUST check you've understood all even TLVs before using this to
		/// claim, otherwise you may unintentionally agree to some protocol you do not understand.
		///
		/// [`claim_funds`]: Self::claim_funds
		public func claimFundsWithKnownCustomTlvs(paymentPreimage: [UInt8]) {
			// native call variable prep

			let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(
				value: paymentPreimage, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_claim_funds_with_known_custom_tlvs(
						thisArgPointer, paymentPreimagePrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentPreimagePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets the node_id held by this ChannelManager
		public func getOurNodeId() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_our_node_id(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Accepts a request to open a channel after a [`Event::OpenChannelRequest`].
		///
		/// The `temporary_channel_id` parameter indicates which inbound channel should be accepted,
		/// and the `counterparty_node_id` parameter is the id of the peer which has requested to open
		/// the channel.
		///
		/// The `user_channel_id` parameter will be provided back in
		/// [`Event::ChannelClosed::user_channel_id`] to allow tracking of which events correspond
		/// with which `accept_inbound_channel`/`accept_inbound_channel_from_trusted_peer_0conf` call.
		///
		/// Note that this method will return an error and reject the channel, if it requires support
		/// for zero confirmations. Instead, `accept_inbound_channel_from_trusted_peer_0conf` must be
		/// used to accept such channels.
		///
		/// [`Event::OpenChannelRequest`]: events::Event::OpenChannelRequest
		/// [`Event::ChannelClosed::user_channel_id`]: events::Event::ChannelClosed::user_channel_id
		public func acceptInboundChannel(
			temporaryChannelId: ChannelId, counterpartyNodeId: [UInt8], userChannelId: [UInt8]
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: temporaryChannelId.cType!) {
						(temporaryChannelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_accept_inbound_channel(
							thisArgPointer, temporaryChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!,
							userChannelIdPrimitiveWrapper.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Accepts a request to open a channel after a [`events::Event::OpenChannelRequest`], treating
		/// it as confirmed immediately.
		///
		/// The `user_channel_id` parameter will be provided back in
		/// [`Event::ChannelClosed::user_channel_id`] to allow tracking of which events correspond
		/// with which `accept_inbound_channel`/`accept_inbound_channel_from_trusted_peer_0conf` call.
		///
		/// Unlike [`ChannelManager::accept_inbound_channel`], this method accepts the incoming channel
		/// and (if the counterparty agrees), enables forwarding of payments immediately.
		///
		/// This fully trusts that the counterparty has honestly and correctly constructed the funding
		/// transaction and blindly assumes that it will eventually confirm.
		///
		/// If it does not confirm before we decide to close the channel, or if the funding transaction
		/// does not pay to the correct script the correct amount, *you will lose funds*.
		///
		/// [`Event::OpenChannelRequest`]: events::Event::OpenChannelRequest
		/// [`Event::ChannelClosed::user_channel_id`]: events::Event::ChannelClosed::user_channel_id
		public func acceptInboundChannelFromTrustedPeer0conf(
			temporaryChannelId: ChannelId, counterpartyNodeId: [UInt8], userChannelId: [UInt8]
		) -> Result_NoneAPIErrorZ {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: temporaryChannelId.cType!) {
						(temporaryChannelIdPointer: UnsafePointer<LDKChannelId>) in
						ChannelManager_accept_inbound_channel_from_trusted_peer_0conf(
							thisArgPointer, temporaryChannelIdPointer, counterpartyNodeIdPrimitiveWrapper.cType!,
							userChannelIdPrimitiveWrapper.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Creates an [`OfferBuilder`] such that the [`Offer`] it builds is recognized by the
		/// [`ChannelManager`] when handling [`InvoiceRequest`] messages for the offer. The offer's
		/// expiration will be `absolute_expiry` if `Some`, otherwise it will not expire.
		///
		/// # Privacy
		///
		/// Uses [`MessageRouter`] to construct a [`BlindedMessagePath`] for the offer based on the given
		/// `absolute_expiry` according to [`MAX_SHORT_LIVED_RELATIVE_EXPIRY`]. See those docs for
		/// privacy implications as well as those of the parameterized [`Router`], which implements
		/// [`MessageRouter`].
		///
		/// Also, uses a derived signing pubkey in the offer for recipient privacy.
		///
		/// # Limitations
		///
		/// Requires a direct connection to the introduction node in the responding [`InvoiceRequest`]'s
		/// reply path.
		///
		/// # Errors
		///
		/// Errors if the parameterized [`Router`] is unable to create a blinded path for the offer.
		///
		/// [`Offer`]: crate::offers::offer::Offer
		/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
		public func createOfferBuilder(absoluteExpiry: UInt64?)
			-> Result_OfferWithDerivedMetadataBuilderBolt12SemanticErrorZ
		{
			// native call variable prep

			let absoluteExpiryOption = Option_u64Z(
				some: absoluteExpiry, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_create_offer_builder(thisArgPointer, absoluteExpiryOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_OfferWithDerivedMetadataBuilderBolt12SemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Creates a [`RefundBuilder`] such that the [`Refund`] it builds is recognized by the
		/// [`ChannelManager`] when handling [`Bolt12Invoice`] messages for the refund.
		///
		/// # Payment
		///
		/// The provided `payment_id` is used to ensure that only one invoice is paid for the refund.
		/// See [Avoiding Duplicate Payments] for other requirements once the payment has been sent.
		///
		/// The builder will have the provided expiration set. Any changes to the expiration on the
		/// returned builder will not be honored by [`ChannelManager`]. For `no-std`, the highest seen
		/// block time minus two hours is used for the current time when determining if the refund has
		/// expired.
		///
		/// To revoke the refund, use [`ChannelManager::abandon_payment`] prior to receiving the
		/// invoice. If abandoned, or an invoice isn't received before expiration, the payment will fail
		/// with an [`Event::PaymentFailed`].
		///
		/// If `max_total_routing_fee_msat` is not specified, The default from
		/// [`RouteParameters::from_payment_params_and_value`] is applied.
		///
		/// # Privacy
		///
		/// Uses [`MessageRouter`] to construct a [`BlindedMessagePath`] for the refund based on the given
		/// `absolute_expiry` according to [`MAX_SHORT_LIVED_RELATIVE_EXPIRY`]. See those docs for
		/// privacy implications as well as those of the parameterized [`Router`], which implements
		/// [`MessageRouter`].
		///
		/// Also, uses a derived payer id in the refund for payer privacy.
		///
		/// # Limitations
		///
		/// Requires a direct connection to an introduction node in the responding
		/// [`Bolt12Invoice::payment_paths`].
		///
		/// # Errors
		///
		/// Errors if:
		/// - a duplicate `payment_id` is provided given the caveats in the aforementioned link,
		/// - `amount_msats` is invalid, or
		/// - the parameterized [`Router`] is unable to create a blinded path for the refund.
		///
		/// [`Refund`]: crate::offers::refund::Refund
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		/// [`Bolt12Invoice::payment_paths`]: crate::offers::invoice::Bolt12Invoice::payment_paths
		/// [Avoiding Duplicate Payments]: #avoiding-duplicate-payments
		public func createRefundBuilder(
			amountMsats: UInt64, absoluteExpiry: UInt64, paymentId: [UInt8], retryStrategy: Retry,
			maxTotalRoutingFeeMsat: UInt64?
		) -> Result_RefundMaybeWithDerivedMetadataBuilderBolt12SemanticErrorZ {
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let maxTotalRoutingFeeMsatOption = Option_u64Z(
				some: maxTotalRoutingFeeMsat, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_create_refund_builder(
						thisArgPointer, amountMsats, absoluteExpiry, paymentIdPrimitiveWrapper.cType!,
						retryStrategy.danglingClone().cType!, maxTotalRoutingFeeMsatOption.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RefundMaybeWithDerivedMetadataBuilderBolt12SemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Pays for an [`Offer`] using the given parameters by creating an [`InvoiceRequest`] and
		/// enqueuing it to be sent via an onion message. [`ChannelManager`] will pay the actual
		/// [`Bolt12Invoice`] once it is received.
		///
		/// Uses [`InvoiceRequestBuilder`] such that the [`InvoiceRequest`] it builds is recognized by
		/// the [`ChannelManager`] when handling a [`Bolt12Invoice`] message in response to the request.
		/// The optional parameters are used in the builder, if `Some`:
		/// - `quantity` for [`InvoiceRequest::quantity`] which must be set if
		/// [`Offer::expects_quantity`] is `true`.
		/// - `amount_msats` if overpaying what is required for the given `quantity` is desired, and
		/// - `payer_note` for [`InvoiceRequest::payer_note`].
		///
		/// If `max_total_routing_fee_msat` is not specified, The default from
		/// [`RouteParameters::from_payment_params_and_value`] is applied.
		///
		/// # Payment
		///
		/// The provided `payment_id` is used to ensure that only one invoice is paid for the request
		/// when received. See [Avoiding Duplicate Payments] for other requirements once the payment has
		/// been sent.
		///
		/// To revoke the request, use [`ChannelManager::abandon_payment`] prior to receiving the
		/// invoice. If abandoned, or an invoice isn't received in a reasonable amount of time, the
		/// payment will fail with an [`Event::PaymentFailed`].
		///
		/// # Privacy
		///
		/// For payer privacy, uses a derived payer id and uses [`MessageRouter::create_blinded_paths`]
		/// to construct a [`BlindedMessagePath`] for the reply path. For further privacy implications, see the
		/// docs of the parameterized [`Router`], which implements [`MessageRouter`].
		///
		/// # Limitations
		///
		/// Requires a direct connection to an introduction node in [`Offer::paths`] or to
		/// [`Offer::signing_pubkey`], if empty. A similar restriction applies to the responding
		/// [`Bolt12Invoice::payment_paths`].
		///
		/// # Errors
		///
		/// Errors if:
		/// - a duplicate `payment_id` is provided given the caveats in the aforementioned link,
		/// - the provided parameters are invalid for the offer,
		/// - the offer is for an unsupported chain, or
		/// - the parameterized [`Router`] is unable to create a blinded reply path for the invoice
		/// request.
		///
		/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
		/// [`InvoiceRequest::quantity`]: crate::offers::invoice_request::InvoiceRequest::quantity
		/// [`InvoiceRequest::payer_note`]: crate::offers::invoice_request::InvoiceRequest::payer_note
		/// [`InvoiceRequestBuilder`]: crate::offers::invoice_request::InvoiceRequestBuilder
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		/// [`Bolt12Invoice::payment_paths`]: crate::offers::invoice::Bolt12Invoice::payment_paths
		/// [Avoiding Duplicate Payments]: #avoiding-duplicate-payments
		public func payForOffer(
			offer: Offer, quantity: UInt64?, amountMsats: UInt64?, payerNote: String?, paymentId: [UInt8],
			retryStrategy: Retry, maxTotalRoutingFeeMsat: UInt64?
		) -> Result_NoneBolt12SemanticErrorZ {
			// native call variable prep

			let quantityOption = Option_u64Z(
				some: quantity, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let amountMsatsOption = Option_u64Z(
				some: amountMsats, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let payerNoteOption = Option_StrZ(
				some: payerNote, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let maxTotalRoutingFeeMsatOption = Option_u64Z(
				some: maxTotalRoutingFeeMsat, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: offer.cType!) { (offerPointer: UnsafePointer<LDKOffer>) in
						ChannelManager_pay_for_offer(
							thisArgPointer, offerPointer, quantityOption.cType!, amountMsatsOption.cType!,
							payerNoteOption.cType!, paymentIdPrimitiveWrapper.cType!,
							retryStrategy.danglingClone().cType!, maxTotalRoutingFeeMsatOption.cType!)
					}

				}


			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneBolt12SemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Creates a [`Bolt12Invoice`] for a [`Refund`] and enqueues it to be sent via an onion
		/// message.
		///
		/// The resulting invoice uses a [`PaymentHash`] recognized by the [`ChannelManager`] and a
		/// [`BlindedPaymentPath`] containing the [`PaymentSecret`] needed to reconstruct the
		/// corresponding [`PaymentPreimage`]. It is returned purely for informational purposes.
		///
		/// # Limitations
		///
		/// Requires a direct connection to an introduction node in [`Refund::paths`] or to
		/// [`Refund::payer_id`], if empty. This request is best effort; an invoice will be sent to each
		/// node meeting the aforementioned criteria, but there's no guarantee that they will be
		/// received and no retries will be made.
		///
		/// # Errors
		///
		/// Errors if:
		/// - the refund is for an unsupported chain, or
		/// - the parameterized [`Router`] is unable to create a blinded payment path or reply path for
		/// the invoice.
		///
		/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
		public func requestRefundPayment(refund: Refund) -> Result_Bolt12InvoiceBolt12SemanticErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in

					withUnsafePointer(to: refund.cType!) { (refundPointer: UnsafePointer<LDKRefund>) in
						ChannelManager_request_refund_payment(thisArgPointer, refundPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_Bolt12InvoiceBolt12SemanticErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets a payment secret and payment hash for use in an invoice given to a third party wishing
		/// to pay us.
		///
		/// This differs from [`create_inbound_payment_for_hash`] only in that it generates the
		/// [`PaymentHash`] and [`PaymentPreimage`] for you.
		///
		/// The [`PaymentPreimage`] will ultimately be returned to you in the [`PaymentClaimable`] event, which
		/// will have the [`PaymentClaimable::purpose`] return `Some` for [`PaymentPurpose::preimage`]. That
		/// should then be passed directly to [`claim_funds`].
		///
		/// See [`create_inbound_payment_for_hash`] for detailed documentation on behavior and requirements.
		///
		/// Note that a malicious eavesdropper can intuit whether an inbound payment was created by
		/// `create_inbound_payment` or `create_inbound_payment_for_hash` based on runtime.
		///
		/// # Note
		///
		/// If you register an inbound payment with this method, then serialize the `ChannelManager`, then
		/// deserialize it with a node running 0.0.103 and earlier, the payment will fail to be received.
		///
		/// Errors if `min_value_msat` is greater than total bitcoin supply.
		///
		/// If `min_final_cltv_expiry_delta` is set to some value, then the payment will not be receivable
		/// on versions of LDK prior to 0.0.114.
		///
		/// [`claim_funds`]: Self::claim_funds
		/// [`PaymentClaimable`]: events::Event::PaymentClaimable
		/// [`PaymentClaimable::purpose`]: events::Event::PaymentClaimable::purpose
		/// [`PaymentPurpose::preimage`]: events::PaymentPurpose::preimage
		/// [`create_inbound_payment_for_hash`]: Self::create_inbound_payment_for_hash
		public func createInboundPayment(
			minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32, minFinalCltvExpiryDelta: UInt16?
		) -> Result_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZNoneZ {
			// native call variable prep

			let minValueMsatOption = Option_u64Z(
				some: minValueMsat, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let minFinalCltvExpiryDeltaOption = Option_u16Z(
				some: minFinalCltvExpiryDelta, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_create_inbound_payment(
						thisArgPointer, minValueMsatOption.cType!, invoiceExpiryDeltaSecs,
						minFinalCltvExpiryDeltaOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_ThirtyTwoBytesThirtyTwoBytesZNoneZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets a [`PaymentSecret`] for a given [`PaymentHash`], for which the payment preimage is
		/// stored external to LDK.
		///
		/// A [`PaymentClaimable`] event will only be generated if the [`PaymentSecret`] matches a
		/// payment secret fetched via this method or [`create_inbound_payment`], and which is at least
		/// the `min_value_msat` provided here, if one is provided.
		///
		/// The [`PaymentHash`] (and corresponding [`PaymentPreimage`]) should be globally unique, though
		/// note that LDK will not stop you from registering duplicate payment hashes for inbound
		/// payments.
		///
		/// `min_value_msat` should be set if the invoice being generated contains a value. Any payment
		/// received for the returned [`PaymentHash`] will be required to be at least `min_value_msat`
		/// before a [`PaymentClaimable`] event will be generated, ensuring that we do not provide the
		/// sender \"proof-of-payment\" unless they have paid the required amount.
		///
		/// `invoice_expiry_delta_secs` describes the number of seconds that the invoice is valid for
		/// in excess of the current time. This should roughly match the expiry time set in the invoice.
		/// After this many seconds, we will remove the inbound payment, resulting in any attempts to
		/// pay the invoice failing. The BOLT spec suggests 3,600 secs as a default validity time for
		/// invoices when no timeout is set.
		///
		/// Note that we use block header time to time-out pending inbound payments (with some margin
		/// to compensate for the inaccuracy of block header timestamps). Thus, in practice we will
		/// accept a payment and generate a [`PaymentClaimable`] event for some time after the expiry.
		/// If you need exact expiry semantics, you should enforce them upon receipt of
		/// [`PaymentClaimable`].
		///
		/// Note that invoices generated for inbound payments should have their `min_final_cltv_expiry_delta`
		/// set to at least [`MIN_FINAL_CLTV_EXPIRY_DELTA`].
		///
		/// Note that a malicious eavesdropper can intuit whether an inbound payment was created by
		/// `create_inbound_payment` or `create_inbound_payment_for_hash` based on runtime.
		///
		/// # Note
		///
		/// If you register an inbound payment with this method, then serialize the `ChannelManager`, then
		/// deserialize it with a node running 0.0.103 and earlier, the payment will fail to be received.
		///
		/// Errors if `min_value_msat` is greater than total bitcoin supply.
		///
		/// If `min_final_cltv_expiry_delta` is set to some value, then the payment will not be receivable
		/// on versions of LDK prior to 0.0.114.
		///
		/// [`create_inbound_payment`]: Self::create_inbound_payment
		/// [`PaymentClaimable`]: events::Event::PaymentClaimable
		public func createInboundPaymentForHash(
			paymentHash: [UInt8], minValueMsat: UInt64?, invoiceExpiryDeltaSecs: UInt32, minFinalCltvExpiry: UInt16?
		) -> Result_ThirtyTwoBytesNoneZ {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let minValueMsatOption = Option_u64Z(
				some: minValueMsat, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let minFinalCltvExpiryOption = Option_u16Z(
				some: minFinalCltvExpiry, instantiationContext: "ChannelManager.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_create_inbound_payment_for_hash(
						thisArgPointer, paymentHashPrimitiveWrapper.cType!, minValueMsatOption.cType!,
						invoiceExpiryDeltaSecs, minFinalCltvExpiryOption.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesNoneZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets an LDK-generated payment preimage from a payment hash and payment secret that were
		/// previously returned from [`create_inbound_payment`].
		///
		/// [`create_inbound_payment`]: Self::create_inbound_payment
		public func getPaymentPreimage(paymentHash: [UInt8], paymentSecret: [UInt8]) -> Result_ThirtyTwoBytesAPIErrorZ {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")

			let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentSecret, instantiationContext: "ChannelManager.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_payment_preimage(
						thisArgPointer, paymentHashPrimitiveWrapper.cType!, paymentSecretPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentSecretPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesAPIErrorZ(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets a fake short channel id for use in receiving [phantom node payments]. These fake scids
		/// are used when constructing the phantom invoice's route hints.
		///
		/// [phantom node payments]: crate::sign::PhantomKeysManager
		public func getPhantomScid() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_phantom_scid(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets route hints for use in receiving [phantom node payments].
		///
		/// [phantom node payments]: crate::sign::PhantomKeysManager
		public func getPhantomRouteHints() -> PhantomRouteHints {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_phantom_route_hints(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PhantomRouteHints(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Gets a fake short channel id for use in receiving intercepted payments. These fake scids are
		/// used when constructing the route hints for HTLCs intended to be intercepted. See
		/// [`ChannelManager::forward_intercepted_htlc`].
		///
		/// Note that this method is not guaranteed to return unique values, you may need to call it a few
		/// times to get a unique scid.
		public func getInterceptScid() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_intercept_scid(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets inflight HTLC information by processing pending outbound payments that are in
		/// our channels. May be used during pathfinding to account for in-use channel liquidity.
		public func computeInflightHtlcs() -> InFlightHtlcs {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_compute_inflight_htlcs(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InFlightHtlcs(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constructs a new MessageSendEventsProvider which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned MessageSendEventsProvider must be freed before this_arg is
		public func asMessageSendEventsProvider() -> MessageSendEventsProvider {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_MessageSendEventsProvider(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedMessageSendEventsProvider(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new EventsProvider which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned EventsProvider must be freed before this_arg is
		public func asEventsProvider() -> EventsProvider {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_EventsProvider(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedEventsProvider(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new Listen which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned Listen must be freed before this_arg is
		public func asListen() -> Listen {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_Listen(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedListen(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new Confirm which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned Confirm must be freed before this_arg is
		public func asConfirm() -> Confirm {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_Confirm(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedConfirm(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Gets a [`Future`] that completes when this [`ChannelManager`] may need to be persisted or
		/// may have events that need processing.
		///
		/// In order to check if this [`ChannelManager`] needs persisting, call
		/// [`Self::get_and_clear_needs_persistence`].
		///
		/// Note that callbacks registered on the [`Future`] MUST NOT call back into this
		/// [`ChannelManager`] and should instead register actions to be taken later.
		public func getEventOrPersistenceNeededFuture() -> Future {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_event_or_persistence_needed_future(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Future(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns true if this [`ChannelManager`] needs to be persisted.
		///
		/// See [`Self::get_event_or_persistence_needed_future`] for retrieving a [`Future`] that
		/// indicates this should be checked.
		public func getAndClearNeedsPersistence() -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_get_and_clear_needs_persistence(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets the latest best block which was connected either via the [`chain::Listen`] or
		/// [`chain::Confirm`] interfaces.
		public func currentBestBlock() -> BestBlock {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_current_best_block(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BestBlock(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Fetches the set of [`NodeFeatures`] flags that are provided by or required by
		/// [`ChannelManager`].
		public func nodeFeatures() -> NodeFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_node_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NodeFeatures(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Fetches the set of [`ChannelFeatures`] flags that are provided by or required by
		/// [`ChannelManager`].
		public func channelFeatures() -> ChannelFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_channel_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelFeatures(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Fetches the set of [`ChannelTypeFeatures`] flags that are provided by or required by
		/// [`ChannelManager`].
		public func channelTypeFeatures() -> ChannelTypeFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_channel_type_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelTypeFeatures(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Fetches the set of [`InitFeatures`] flags that are provided by or required by
		/// [`ChannelManager`].
		public func initFeatures() -> InitFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_init_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InitFeatures(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constructs a new ChannelMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned ChannelMessageHandler must be freed before this_arg is
		public func asChannelMessageHandler() -> ChannelMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_ChannelMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedChannelMessageHandler(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new OffersMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OffersMessageHandler must be freed before this_arg is
		public func asOffersMessageHandler() -> OffersMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_OffersMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOffersMessageHandler(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new AsyncPaymentsMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned AsyncPaymentsMessageHandler must be freed before this_arg is
		public func asAsyncPaymentsMessageHandler() -> AsyncPaymentsMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_AsyncPaymentsMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedAsyncPaymentsMessageHandler(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new NodeIdLookUp which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned NodeIdLookUp must be freed before this_arg is
		public func asNodeIdLookUp() -> NodeIdLookUp {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_as_NodeIdLookUp(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedNodeIdLookUp(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Serialize the ChannelManager object into a byte array which can be read by ChannelManager_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelManager>) in
					ChannelManager_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ChannelManager.swift::\(#function):\(#line)",
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


		internal func setCFreeability(freeable: Bool) -> ChannelManager {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelManager {
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
						"Freeing ChannelManager \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelManager \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

