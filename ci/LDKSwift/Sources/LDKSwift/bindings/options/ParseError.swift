#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ParseError = Bindings.ParseError

extension Bindings {

	public class ParseError: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKParseError?

		

		public init(pointer: LDKParseError){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKParseError, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum ParseErrorValueType {
					case Bech32Error, ParseAmountError, MalformedSignature, DescriptionDecodeError, InvalidSliceLength
				}

				public func getValueType() -> ParseErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKParseError_Bech32Error:
						return .Bech32Error
					case LDKParseError_ParseAmountError:
						return .ParseAmountError
					case LDKParseError_MalformedSignature:
						return .MalformedSignature
					case LDKParseError_DescriptionDecodeError:
						return .DescriptionDecodeError
					case LDKParseError_InvalidSliceLength:
						return .InvalidSliceLength
                    default:
                        return nil
                    }
				}

				
					public func getValueAsBech32Error() -> Bindings.Bech32Error? {
						if self.cOpaqueStruct?.tag != LDKParseError_Bech32Error {
							return nil
						}
						return Bindings.Bech32Error(pointer: self.cOpaqueStruct!.bech32_error, anchor: self)
					}
				
					public func getValueAsParseAmountError() -> ()? {
						if self.cOpaqueStruct?.tag != LDKParseError_ParseAmountError {
							return nil
						}
						return ()
					}
				
					public func getValueAsMalformedSignature() -> LDKSecp256k1Error? {
						if self.cOpaqueStruct?.tag != LDKParseError_MalformedSignature {
							return nil
						}
						return self.cOpaqueStruct!.malformed_signature
					}
				
					public func getValueAsDescriptionDecodeError() -> ()? {
						if self.cOpaqueStruct?.tag != LDKParseError_DescriptionDecodeError {
							return nil
						}
						return ()
					}
				
					public func getValueAsInvalidSliceLength() -> String? {
						if self.cOpaqueStruct?.tag != LDKParseError_InvalidSliceLength {
							return nil
						}
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.invalid_slice_length, deallocate: false)
					}
				
			
		internal func free() -> Void {
			
			return ParseError_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ParseError {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ParseError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ParseError \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> ParseError {
			
			return ParseError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKParseError>) in
ParseError_clone(origPointer)
});
		}

					internal func danglingClone() -> ParseError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func bech32_error(a: Bindings.Bech32Error) -> ParseError {
			
			return ParseError(pointer: ParseError_bech32_error(a.danglingClone().cOpaqueStruct!));
		}

		public class func malformed_signature(a: LDKSecp256k1Error) -> ParseError {
			
			return ParseError(pointer: ParseError_malformed_signature(a));
		}

		public class func bad_prefix() -> ParseError {
			
			return ParseError(pointer: ParseError_bad_prefix());
		}

		public class func unknown_currency() -> ParseError {
			
			return ParseError(pointer: ParseError_unknown_currency());
		}

		public class func unknown_si_prefix() -> ParseError {
			
			return ParseError(pointer: ParseError_unknown_si_prefix());
		}

		public class func malformed_hrp() -> ParseError {
			
			return ParseError(pointer: ParseError_malformed_hrp());
		}

		public class func too_short_data_part() -> ParseError {
			
			return ParseError(pointer: ParseError_too_short_data_part());
		}

		public class func unexpected_end_of_tagged_fields() -> ParseError {
			
			return ParseError(pointer: ParseError_unexpected_end_of_tagged_fields());
		}

		public class func padding_error() -> ParseError {
			
			return ParseError(pointer: ParseError_padding_error());
		}

		public class func integer_overflow_error() -> ParseError {
			
			return ParseError(pointer: ParseError_integer_overflow_error());
		}

		public class func invalid_seg_wit_program_length() -> ParseError {
			
			return ParseError(pointer: ParseError_invalid_seg_wit_program_length());
		}

		public class func invalid_pub_key_hash_length() -> ParseError {
			
			return ParseError(pointer: ParseError_invalid_pub_key_hash_length());
		}

		public class func invalid_script_hash_length() -> ParseError {
			
			return ParseError(pointer: ParseError_invalid_script_hash_length());
		}

		public class func invalid_recovery_id() -> ParseError {
			
			return ParseError(pointer: ParseError_invalid_recovery_id());
		}

		public class func invalid_slice_length(a: String) -> ParseError {
			
			return ParseError(pointer: ParseError_invalid_slice_length(Bindings.new_LDKStr(string: a, chars_is_owned: true)));
		}

		public class func skip() -> ParseError {
			
			return ParseError(pointer: ParseError_skip());
		}

		public func to_str() -> String {
			
			return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKParseError>) in
ParseError_to_str(oPointer)
});
		}

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
