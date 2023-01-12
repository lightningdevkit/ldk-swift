/**
 * Represents an error returned from the bech32 library during validation of some bech32 data
 */
typedef enum LDKBech32Error_Tag {
   /**
    * String does not contain the separator character
    */
   LDKBech32Error_MissingSeparator,
   /**
    * The checksum does not match the rest of the data
    */
   LDKBech32Error_InvalidChecksum,
   /**
    * The data or human-readable part is too long or too short
    */
   LDKBech32Error_InvalidLength,
   /**
    * Some part of the string contains an invalid character
    */
   LDKBech32Error_InvalidChar,
   /**
    * Some part of the data has an invalid value
    */
   LDKBech32Error_InvalidData,
   /**
    * The bit conversion failed due to a padding issue
    */
   LDKBech32Error_InvalidPadding,
   /**
    * The whole string must be of one case
    */
   LDKBech32Error_MixedCase,
   /**
    * Must be last for serialization purposes
    */
   LDKBech32Error_Sentinel,
} LDKBech32Error_Tag;

typedef struct LDKBech32Error {
   LDKBech32Error_Tag tag;
   union {
      struct {
         uint32_t invalid_char;
      };
      struct {
         uint8_t invalid_data;
      };
   };
} LDKBech32Error;