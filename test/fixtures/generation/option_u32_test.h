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
 * Constructs a new COption_u32Z containing a u32
 */
struct LDKCOption_u32Z COption_u32Z_some(uint32_t o);

/**
 * Constructs a new COption_u32Z containing nothing
 */
struct LDKCOption_u32Z COption_u32Z_none(void);

/**
 * Frees any resources associated with the u32, if we are in the Some state
 */
void COption_u32Z_free(struct LDKCOption_u32Z _res);

/**
 * Creates a new COption_u32Z which has the same data as `orig`
 * but with all dynamically-allocated buffers duplicated in new buffers.
 */
struct LDKCOption_u32Z COption_u32Z_clone(const struct LDKCOption_u32Z *NONNULL_PTR orig);