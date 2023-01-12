/**
 * A dynamically-allocated array of u8s of arbitrary size.
 * This corresponds to std::vector in C++
 */
typedef struct LDKCVec_u8Z {
   /**
    * The elements in the array.
    * If datalen is non-0 this must be a valid, non-NULL pointer allocated by malloc().
    */
   uint8_t *data;
   /**
    * The number of elements pointed to by `data`.
    */
   uintptr_t datalen;
} LDKCVec_u8Z;

/**
 * Represents the compressed public key of a node
 */
typedef struct MUST_USE_STRUCT LDKNodeId {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeNodeId *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKNodeId;

/**
 * Proposed use of a channel passed as a parameter to [`Score::channel_penalty_msat`].
 */
typedef struct MUST_USE_STRUCT LDKChannelUsage {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeChannelUsage *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKChannelUsage;

/**
 * A hop in a route
 */
typedef struct MUST_USE_STRUCT LDKRouteHop {
   /**
    * A pointer to the opaque Rust object.
    * Nearly everywhere, inner must be non-null, however in places where
    * the Rust equivalent takes an Option, it may be set to null to indicate None.
    */
   LDKnativeRouteHop *inner;
   /**
    * Indicates that this is the only struct which contains the same pointer.
    * Rust functions which take ownership of an object provided via an argument require
    * this to be true and invalidate the object pointed to by inner.
    */
   bool is_owned;
} LDKRouteHop;

/**
 * A dynamically-allocated array of crate::lightning::routing::router::RouteHops of arbitrary size.
 * This corresponds to std::vector in C++
 */
typedef struct LDKCVec_RouteHopZ {
   /**
    * The elements in the array.
    * If datalen is non-0 this must be a valid, non-NULL pointer allocated by malloc().
    */
   struct LDKRouteHop *data;
   /**
    * The number of elements pointed to by `data`.
    */
   uintptr_t datalen;
} LDKCVec_RouteHopZ;

/**
 * An interface used to score payment channels for path finding.
 *
 *\tScoring is in terms of fees willing to be paid in order to avoid routing through a channel.
 */
typedef struct LDKScore {
   /**
    * An opaque pointer which is passed to your function implementations as an argument.
    * This has no meaning in the LDK, and can be NULL or any other value.
    */
   void *this_arg;
   /**
    * Returns the fee in msats willing to be paid to avoid routing `send_amt_msat` through the
    * given channel in the direction from `source` to `target`.
    *
    * The channel's capacity (less any other MPP parts that are also being considered for use in
    * the same payment) is given by `capacity_msat`. It may be determined from various sources
    * such as a chain data, network gossip, or invoice hints. For invoice hints, a capacity near
    * [`u64::max_value`] is given to indicate sufficient capacity for the invoice's full amount.
    * Thus, implementations should be overflow-safe.
    */
   uint64_t (*channel_penalty_msat)(const void *this_arg, uint64_t short_channel_id, const struct LDKNodeId *NONNULL_PTR source, const struct LDKNodeId *NONNULL_PTR target, struct LDKChannelUsage usage);
   /**
    * Handles updating channel penalties after failing to route through a channel.
    */
   void (*payment_path_failed)(void *this_arg, struct LDKCVec_RouteHopZ path, uint64_t short_channel_id);
   /**
    * Handles updating channel penalties after successfully routing along a path.
    */
   void (*payment_path_successful)(void *this_arg, struct LDKCVec_RouteHopZ path);
   /**
    * Handles updating channel penalties after a probe over the given path failed.
    */
   void (*probe_failed)(void *this_arg, struct LDKCVec_RouteHopZ path, uint64_t short_channel_id);
   /**
    * Handles updating channel penalties after a probe over the given path succeeded.
    */
   void (*probe_successful)(void *this_arg, struct LDKCVec_RouteHopZ path);
   /**
    * Serialize the object into a byte array
    */
   struct LDKCVec_u8Z (*write)(const void *this_arg);
   /**
    * Frees any resources associated with this object given its this_arg pointer.
    * Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
    */
   void (*free)(void *this_arg);
} LDKScore;

/**
 * A scorer that is accessed under a lock.
 *
 * Needed so that calls to [`Score::channel_penalty_msat`] in [`find_route`] can be made while
 * having shared ownership of a scorer but without requiring internal locking in [`Score`]
 * implementations. Internal locking would be detrimental to route finding performance and could
 * result in [`Score::channel_penalty_msat`] returning a different value for the same channel.
 *
 * [`find_route`]: crate::routing::router::find_route
 */
typedef struct LDKLockableScore {
   /**
    * An opaque pointer which is passed to your function implementations as an argument.
    * This has no meaning in the LDK, and can be NULL or any other value.
    */
   void *this_arg;
   /**
    * Returns the locked scorer.
    */
   struct LDKScore (*lock)(const void *this_arg);
   /**
    * Frees any resources associated with this object given its this_arg pointer.
    * Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
    */
   void (*free)(void *this_arg);
} LDKLockableScore;

/**
 * Refers to a scorer that is accessible under lock and also writeable to disk
 *
 * We need this trait to be able to pass in a scorer to `lightning-background-processor` that will enable us to
 * use the Persister to persist it.
 */
typedef struct LDKWriteableScore {
   /**
    * An opaque pointer which is passed to your function implementations as an argument.
    * This has no meaning in the LDK, and can be NULL or any other value.
    */
   void *this_arg;
   /**
    * Implementation of LockableScore for this object.
    */
   struct LDKLockableScore LockableScore;
   /**
    * Serialize the object into a byte array
    */
   struct LDKCVec_u8Z (*write)(const void *this_arg);
   /**
    * Frees any resources associated with this object given its this_arg pointer.
    * Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
    */
   void (*free)(void *this_arg);
} LDKWriteableScore;