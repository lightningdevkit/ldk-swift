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