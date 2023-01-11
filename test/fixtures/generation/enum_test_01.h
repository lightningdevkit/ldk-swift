/**
 * An error when accessing the chain via [`Access`].
 */
typedef enum LDKAccessError {
   /**
    * The requested chain is unknown.
    */
   LDKAccessError_UnknownChain,
   /**
    * The requested transaction doesn't exist or hasn't confirmed.
    */
   LDKAccessError_UnknownTx,
   /**
    * Must be last for serialization purposes
    */
   LDKAccessError_Sentinel,
} LDKAccessError;

/**
 * An enum which can either contain a  or not
 */
typedef enum LDKCOption_NoneZ {
   /**
    * When we're in this state, this COption_NoneZ contains a
    */
   LDKCOption_NoneZ_Some,
   /**
    * When we're in this state, this COption_NoneZ contains nothing
    */
   LDKCOption_NoneZ_None,
   /**
    * Must be last for serialization purposes
    */
   LDKCOption_NoneZ_Sentinel,
} LDKCOption_NoneZ;

/**
 * An enum which can either contain a u32 or not
 */
typedef enum LDKCOption_u32Z_Tag {
   /**
    * When we're in this state, this COption_u32Z contains a u32
    */
   LDKCOption_u32Z_Some,
   /**
    * When we're in this state, this COption_u32Z contains nothing
    */
   LDKCOption_u32Z_None,
   /**
    * Must be last for serialization purposes
    */
   LDKCOption_u32Z_Sentinel,
} LDKCOption_u32Z_Tag;

typedef struct LDKCOption_u32Z {
   LDKCOption_u32Z_Tag tag;
   union {
      struct {
         uint32_t some;
      };
   };
} LDKCOption_u32Z;

/**
 * Constructs a new COption_NoneZ containing a
 */
enum LDKCOption_NoneZ COption_NoneZ_some(void);

/**
 * Constructs a new COption_NoneZ containing nothing
 */
enum LDKCOption_NoneZ COption_NoneZ_none(void);

/**
 * Onion messages can be sent and received to blinded routes, which serve to hide the identity of
 * the recipient.
 */
typedef struct MUST_USE_STRUCT LDKBlindedRoute {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeBlindedRoute *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKBlindedRoute;

/**
 * The contents of CResult_BlindedRouteNoneZ
 */
typedef union LDKCResult_BlindedRouteNoneZPtr {
   /**
    * A pointer to the contents in the success state.
    * Reading from this pointer when `result_ok` is not set is undefined.
    */
   struct LDKBlindedRoute *result;
   /**
    * Note that this value is always NULL, as there are no contents in the Err variant
    */
   void *err;
} LDKCResult_BlindedRouteNoneZPtr;

/**
 * A CResult_BlindedRouteNoneZ represents the result of a fallible operation,
 * containing a crate::lightning::onion_message::blinded_route::BlindedRoute on success and a () on failure.
 * `result_ok` indicates the overall state, and the contents are provided via `contents`.
 */
typedef struct LDKCResult_BlindedRouteNoneZ {
   /**
    * The contents of this CResult_BlindedRouteNoneZ, accessible via either
    * `err` or `result` depending on the state of `result_ok`.
    */
   union LDKCResult_BlindedRouteNoneZPtr contents;
   /**
    * Whether this CResult_BlindedRouteNoneZ represents a success state.
    */
   bool result_ok;
} LDKCResult_BlindedRouteNoneZ;

/**
 * An enum representing the status of a channel monitor update persistence.
 */
typedef enum LDKChannelMonitorUpdateStatus {
   /**
    * The update has been durably persisted and all copies of the relevant [`ChannelMonitor`]
    * have been updated.
    *
    * This includes performing any `fsync()` calls required to ensure the update is guaranteed to
    * be available on restart even if the application crashes.
    */
   LDKChannelMonitorUpdateStatus_Completed,
   /**
    * Used to indicate a temporary failure (eg connection to a watchtower or remote backup of
    * our state failed, but is expected to succeed at some point in the future).
    *
    * Such a failure will \"freeze\" a channel, preventing us from revoking old states or
    * submitting new commitment transactions to the counterparty. Once the update(s) which failed
    * have been successfully applied, a [`MonitorEvent::Completed`] can be used to restore the
    * channel to an operational state.
    *
    * Note that a given [`ChannelManager`] will *never* re-generate a [`ChannelMonitorUpdate`].
    * If you return this error you must ensure that it is written to disk safely before writing
    * the latest [`ChannelManager`] state, or you should return [`PermanentFailure`] instead.
    *
    * Even when a channel has been \"frozen\", updates to the [`ChannelMonitor`] can continue to
    * occur (e.g. if an inbound HTLC which we forwarded was claimed upstream, resulting in us
    * attempting to claim it on this channel) and those updates must still be persisted.
    *
    * No updates to the channel will be made which could invalidate other [`ChannelMonitor`]s
    * until a [`MonitorEvent::Completed`] is provided, even if you return no error on a later
    * monitor update for the same channel.
    *
    * For deployments where a copy of ChannelMonitors and other local state are backed up in a
    * remote location (with local copies persisted immediately), it is anticipated that all
    * updates will return [`InProgress`] until the remote copies could be updated.
    *
    * [`PermanentFailure`]: ChannelMonitorUpdateStatus::PermanentFailure
    * [`InProgress`]: ChannelMonitorUpdateStatus::InProgress
    * [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
    */
   LDKChannelMonitorUpdateStatus_InProgress,
   /**
    * Used to indicate no further channel monitor updates will be allowed (likely a disk failure
    * or a remote copy of this [`ChannelMonitor`] is no longer reachable and thus not updatable).
    *
    * When this is returned, [`ChannelManager`] will force-close the channel but *not* broadcast
    * our current commitment transaction. This avoids a dangerous case where a local disk failure
    * (e.g. the Linux-default remounting of the disk as read-only) causes [`PermanentFailure`]s
    * for all monitor updates. If we were to broadcast our latest commitment transaction and then
    * restart, we could end up reading a previous [`ChannelMonitor`] and [`ChannelManager`],
    * revoking our now-broadcasted state before seeing it confirm and losing all our funds.
    *
    * Note that this is somewhat of a tradeoff - if the disk is really gone and we may have lost
    * the data permanently, we really should broadcast immediately. If the data can be recovered
    * with manual intervention, we'd rather close the channel, rejecting future updates to it,
    * and broadcast the latest state only if we have HTLCs to claim which are timing out (which
    * we do as long as blocks are connected).
    *
    * In order to broadcast the latest local commitment transaction, you'll need to call
    * [`ChannelMonitor::get_latest_holder_commitment_txn`] and broadcast the resulting
    * transactions once you've safely ensured no further channel updates can be generated by your
    * [`ChannelManager`].
    *
    * Note that at least one final [`ChannelMonitorUpdate`] may still be provided, which must
    * still be processed by a running [`ChannelMonitor`]. This final update will mark the
    * [`ChannelMonitor`] as finalized, ensuring no further updates (e.g. revocation of the latest
    * commitment transaction) are allowed.
    *
    * Note that even if you return a [`PermanentFailure`] due to unavailability of secondary
    * [`ChannelMonitor`] copies, you should still make an attempt to store the update where
    * possible to ensure you can claim HTLC outputs on the latest commitment transaction
    * broadcasted later.
    *
    * In case of distributed watchtowers deployment, the new version must be written to disk, as
    * state may have been stored but rejected due to a block forcing a commitment broadcast. This
    * storage is used to claim outputs of rejected state confirmed onchain by another watchtower,
    * lagging behind on block processing.
    *
    * [`PermanentFailure`]: ChannelMonitorUpdateStatus::PermanentFailure
    * [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
    */
   LDKChannelMonitorUpdateStatus_PermanentFailure,
   /**
    * Must be last for serialization purposes
    */
   LDKChannelMonitorUpdateStatus_Sentinel,
} LDKChannelMonitorUpdateStatus;