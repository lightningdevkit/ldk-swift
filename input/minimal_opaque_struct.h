/**
 * A trait which should be implemented to provide feerate information on a number of time
 * horizons.
 *
 * Note that all of the functions implemented here *must* be reentrant-safe (obviously - they're
 * called from inside the library in response to chain events, P2P events, or timer events).
 */
typedef struct LDKFeeEstimator {
   void *this_arg;
   /**
    * Gets estimated satoshis of fee required per 1000 Weight-Units.
    *
    * Must be no smaller than 253 (ie 1 satoshi-per-byte rounded up to ensure later round-downs
    * don't put us below 1 satoshi-per-byte).
    *
    * This translates to:
    *  * satoshis-per-byte * 250
    *  * ceil(satoshis-per-kbyte / 4)
    */
   uint32_t (*get_est_sat_per_1000_weight)(const void *this_arg, enum LDKConfirmationTarget confirmation_target);
   void (*free)(void *this_arg);
} LDKFeeEstimator;

/**
 * A trait encapsulating the operations required of a logger
 */
typedef struct LDKLogger {
   void *this_arg;
   /**
    * Logs the `Record`
    */
   void (*log)(const void *this_arg, const char *record);
   void (*free)(void *this_arg);
} LDKLogger;



/**
 * Manager which keeps track of a number of channels and sends messages to the appropriate
 * channel, also tracking HTLC preimages and forwarding onion packets appropriately.
 *
 * Implements ChannelMessageHandler, handling the multi-channel parts and passing things through
 * to individual Channels.
 *
 * Implements Writeable to write out all channel state to disk. Implies peer_disconnected() for
 * all peers during write/read (though does not modify this instance, only the instance being
 * serialized). This will result in any channels which have not yet exchanged funding_created (ie
 * called funding_transaction_generated for outbound channels).
 *
 * Note that you can be a bit lazier about writing out ChannelManager than you can be with
 * ChannelMonitors. With ChannelMonitors you MUST write each monitor update out to disk before
 * returning from chain::Watch::watch_/update_channel, with ChannelManagers, writing updates
 * happens out-of-band (and will prevent any other ChannelManager operations from occurring during
 * the serialization process). If the deserialized version is out-of-date compared to the
 * ChannelMonitors passed by reference to read(), those channels will be force-closed based on the
 * ChannelMonitor state and no funds will be lost (mod on-chain transaction fees).
 *
 * Note that the deserializer is only implemented for (Sha256dHash, ChannelManager), which
 * tells you the last block hash which was block_connect()ed. You MUST rescan any blocks along
 * the \"reorg path\" (ie call block_disconnected() until you get to a common block and then call
 * block_connected() to step towards your best block) upon deserialization before using the
 * object!
 *
 * Note that ChannelManager is responsible for tracking liveness of its channels and generating
 * ChannelUpdate messages informing peers that the channel is temporarily disabled. To avoid
 * spam due to quick disconnection/reconnection, updates are not sent until the channel has been
 * offline for a full minute. In order to track this, you must call
 * timer_chan_freshness_every_min roughly once per minute, though it doesn't have to be perfect.
 *
 * Rather than using a plain ChannelManager, it is preferable to use either a SimpleArcChannelManager
 * a SimpleRefChannelManager, for conciseness. See their documentation for more details, but
 * essentially you should default to using a SimpleRefChannelManager, and use a
 * SimpleArcChannelManager when you require a ChannelManager with a static lifetime, such as when
 * you're using lightning-net-tokio.
 */
typedef struct MUST_USE_STRUCT LDKChannelManager {
   /**
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeChannelManager *inner;
   bool is_owned;
} LDKChannelManager;

void ChannelManager_free(struct LDKChannelManager this_ptr);

MUST_USE_RES struct LDKChannelManager ChannelManager_new(enum LDKNetwork network, struct LDKFeeEstimator fee_est, struct LDKWatch chain_monitor, struct LDKBroadcasterInterface tx_broadcaster, struct LDKLogger logger, struct LDKKeysInterface keys_manager, struct LDKUserConfig config, uintptr_t current_blockchain_height);
