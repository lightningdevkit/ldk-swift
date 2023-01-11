/**
 * A dynamically-allocated array of crate::lightning::chain::channelmonitor::Balances of arbitrary size.
 * This corresponds to std::vector in C++
 */
typedef struct LDKCVec_BalanceZ {
   /**
    * The elements in the array.
    * If datalen is non-0 this must be a valid, non-NULL pointer allocated by malloc().
    */
   uint8_t *data;
   /**
    * The number of elements pointed to by `data`.
    */
   uintptr_t datalen;
} LDKCVec_BalanceZ;

/**
 * The `Filter` trait defines behavior for indicating chain activity of interest pertaining to
 * channels.
 *
 * This is useful in order to have a [`Watch`] implementation convey to a chain source which
 * transactions to be notified of. Notification may take the form of pre-filtering blocks or, in
 * the case of [BIP 157]/[BIP 158], only fetching a block if the compact filter matches. If
 * receiving full blocks from a chain source, any further filtering is unnecessary.
 *
 * After an output has been registered, subsequent block retrievals from the chain source must not
 * exclude any transactions matching the new criteria nor any in-block descendants of such
 * transactions.
 *
 * Note that use as part of a [`Watch`] implementation involves reentrancy. Therefore, the `Filter`
 * should not block on I/O. Implementations should instead queue the newly monitored data to be
 * processed later. Then, in order to block until the data has been processed, any [`Watch`]
 * invocation that has called the `Filter` must return [`InProgress`].
 *
 * [`InProgress`]: ChannelMonitorUpdateStatus::InProgress
 * [BIP 157]: https://github.com/bitcoin/bips/blob/master/bip-0157.mediawiki
 * [BIP 158]: https://github.com/bitcoin/bips/blob/master/bip-0158.mediawiki
 */
typedef struct LDKFilter {
   /**
    * An opaque pointer which is passed to your function implementations as an argument.
    * This has no meaning in the LDK, and can be NULL or any other value.
    */
   void *this_arg;
   /**
    * Frees any resources associated with this object given its this_arg pointer.
    * Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
    */
   void (*free)(void *this_arg);
} LDKFilter;

/**
 * An enum which can either contain a crate::lightning::chain::Filter or not
 */
typedef enum LDKCOption_FilterZ_Tag {
   /**
    * When we're in this state, this COption_FilterZ contains a crate::lightning::chain::Filter
    */
   LDKCOption_FilterZ_Some,
   /**
    * When we're in this state, this COption_FilterZ contains nothing
    */
   LDKCOption_FilterZ_None,
   /**
    * Must be last for serialization purposes
    */
   LDKCOption_FilterZ_Sentinel,
} LDKCOption_FilterZ_Tag;

typedef struct LDKCOption_FilterZ {
   LDKCOption_FilterZ_Tag tag;
   union {
      struct {
         struct LDKFilter some;
      };
   };
} LDKCOption_FilterZ;

/**
 * An implementation of [`chain::Watch`] for monitoring channels.
 *
 * Connected and disconnected blocks must be provided to `ChainMonitor` as documented by
 * [`chain::Watch`]. May be used in conjunction with [`ChannelManager`] to monitor channels locally
 * or used independently to monitor channels remotely. See the [module-level documentation] for
 * details.
 *
 * [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
 * [module-level documentation]: crate::chain::chainmonitor
 */
typedef struct MUST_USE_STRUCT LDKChainMonitor {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeChainMonitor *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKChainMonitor;

/**
 * Frees any resources used by the ChainMonitor, if is_owned is set and inner is non-NULL.
 */
void ChainMonitor_free(struct LDKChainMonitor this_obj);

/**
 * Creates a new `ChainMonitor` used to watch on-chain activity pertaining to channels.
 *
 * When an optional chain source implementing [`chain::Filter`] is provided, the chain monitor
 * will call back to it indicating transactions and outputs of interest. This allows clients to
 * pre-filter blocks or only fetch blocks matching a compact filter. Otherwise, clients may
 * always need to fetch full blocks absent another means for determining which blocks contain
 * transactions relevant to the watched channels.
 */
MUST_USE_RES struct LDKChainMonitor ChainMonitor_new(struct LDKCOption_FilterZ chain_source);

/**
 * Gets the balances in the contained [`ChannelMonitor`]s which are claimable on-chain or
 * claims which are awaiting confirmation.
 *
 * Includes the balances from each [`ChannelMonitor`] *except* those included in
 * `ignored_channels`, allowing you to filter out balances from channels which are still open
 * (and whose balance should likely be pulled from the [`ChannelDetails`]).
 *
 * See [`ChannelMonitor::get_claimable_balances`] for more details on the exact criteria for
 * inclusion in the return value.
 */
MUST_USE_RES struct LDKCVec_BalanceZ ChainMonitor_get_claimable_balances(const struct LDKChainMonitor *NONNULL_PTR this_arg);