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
 * A dynamically-allocated array of crate::c_types::derived::CVec_RouteHopZs of arbitrary size.
 * This corresponds to std::vector in C++
 */
typedef struct LDKCVec_CVec_RouteHopZZ {
   /**
    * The elements in the array.
    * If datalen is non-0 this must be a valid, non-NULL pointer allocated by malloc().
    */
   struct LDKCVec_RouteHopZ *data;
   /**
    * The number of elements pointed to by `data`.
    */
   uintptr_t datalen;
} LDKCVec_CVec_RouteHopZZ;

/**
 * Frees the buffer pointed to by `data` if `datalen` is non-0.
 */
void CVec_CVec_RouteHopZZ_free(struct LDKCVec_CVec_RouteHopZZ _res);