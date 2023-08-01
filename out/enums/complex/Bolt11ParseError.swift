import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Bolt11ParseError = Bindings.Bolt11ParseError

extension Bindings {

	/// Errors that indicate what is wrong with the invoice. They have some granularity for debug
	/// reasons, but should generally result in an \"invalid BOLT11 invoice\" message for the user.
	public class Bolt11ParseError: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKBolt11ParseError?

		internal init(cType: LDKBolt11ParseError, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBolt11ParseError, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBolt11ParseError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum Bolt11ParseErrorType {

			///
			case Bech32Error

			///
			case ParseAmountError

			///
			case MalformedSignature

			///
			case BadPrefix

			///
			case UnknownCurrency

			///
			case UnknownSiPrefix

			///
			case MalformedHRP

			///
			case TooShortDataPart

			///
			case UnexpectedEndOfTaggedFields

			///
			case DescriptionDecodeError

			///
			case PaddingError

			///
			case IntegerOverflowError

			///
			case InvalidSegWitProgramLength

			///
			case InvalidPubKeyHashLength

			///
			case InvalidScriptHashLength

			///
			case InvalidRecoveryId

			///
			case InvalidSliceLength

			/// Not an error, but used internally to signal that a part of the invoice should be ignored
			/// according to BOLT11
			case Skip

		}

		public func getValueType() -> Bolt11ParseErrorType {
			switch self.cType!.tag {
				case LDKBolt11ParseError_Bech32Error:
					return .Bech32Error

				case LDKBolt11ParseError_ParseAmountError:
					return .ParseAmountError

				case LDKBolt11ParseError_MalformedSignature:
					return .MalformedSignature

				case LDKBolt11ParseError_BadPrefix:
					return .BadPrefix

				case LDKBolt11ParseError_UnknownCurrency:
					return .UnknownCurrency

				case LDKBolt11ParseError_UnknownSiPrefix:
					return .UnknownSiPrefix

				case LDKBolt11ParseError_MalformedHRP:
					return .MalformedHRP

				case LDKBolt11ParseError_TooShortDataPart:
					return .TooShortDataPart

				case LDKBolt11ParseError_UnexpectedEndOfTaggedFields:
					return .UnexpectedEndOfTaggedFields

				case LDKBolt11ParseError_DescriptionDecodeError:
					return .DescriptionDecodeError

				case LDKBolt11ParseError_PaddingError:
					return .PaddingError

				case LDKBolt11ParseError_IntegerOverflowError:
					return .IntegerOverflowError

				case LDKBolt11ParseError_InvalidSegWitProgramLength:
					return .InvalidSegWitProgramLength

				case LDKBolt11ParseError_InvalidPubKeyHashLength:
					return .InvalidPubKeyHashLength

				case LDKBolt11ParseError_InvalidScriptHashLength:
					return .InvalidScriptHashLength

				case LDKBolt11ParseError_InvalidRecoveryId:
					return .InvalidRecoveryId

				case LDKBolt11ParseError_InvalidSliceLength:
					return .InvalidSliceLength

				case LDKBolt11ParseError_Skip:
					return .Skip

				default:
					Bindings.print("Error: Invalid value type for Bolt11ParseError! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Bolt11ParseError
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Bolt11ParseError
		internal func clone() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBolt11ParseError>) in
					Bolt11ParseError_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Bech32Error-variant Bolt11ParseError
		public class func initWithBech32Error(a: Bech32Error) -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_bech32_error(a.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ParseAmountError-variant Bolt11ParseError
		public class func initWithParseAmountError(a: Bindings.BindingsError) -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_parse_amount_error(a.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new MalformedSignature-variant Bolt11ParseError
		public class func initWithMalformedSignature(a: Secp256k1Error) -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_malformed_signature(a.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BadPrefix-variant Bolt11ParseError
		public class func initWithBadPrefix() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_bad_prefix()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnknownCurrency-variant Bolt11ParseError
		public class func initWithUnknownCurrency() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_unknown_currency()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnknownSiPrefix-variant Bolt11ParseError
		public class func initWithUnknownSiPrefix() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_unknown_si_prefix()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new MalformedHRP-variant Bolt11ParseError
		public class func initWithMalformedHrp() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_malformed_hrp()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new TooShortDataPart-variant Bolt11ParseError
		public class func initWithTooShortDataPart() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_too_short_data_part()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnexpectedEndOfTaggedFields-variant Bolt11ParseError
		public class func initWithUnexpectedEndOfTaggedFields() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_unexpected_end_of_tagged_fields()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DescriptionDecodeError-variant Bolt11ParseError
		public class func initWithDescriptionDecodeError(a: Bindings.BindingsError) -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_description_decode_error(a.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaddingError-variant Bolt11ParseError
		public class func initWithPaddingError() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_padding_error()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new IntegerOverflowError-variant Bolt11ParseError
		public class func initWithIntegerOverflowError() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_integer_overflow_error()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidSegWitProgramLength-variant Bolt11ParseError
		public class func initWithInvalidSegWitProgramLength() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_invalid_seg_wit_program_length()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidPubKeyHashLength-variant Bolt11ParseError
		public class func initWithInvalidPubKeyHashLength() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_invalid_pub_key_hash_length()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidScriptHashLength-variant Bolt11ParseError
		public class func initWithInvalidScriptHashLength() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_invalid_script_hash_length()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidRecoveryId-variant Bolt11ParseError
		public class func initWithInvalidRecoveryId() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_invalid_recovery_id()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvalidSliceLength-variant Bolt11ParseError
		public class func initWithInvalidSliceLength(a: String) -> Bolt11ParseError {
			// native call variable prep

			let aPrimitiveWrapper = Str(value: a, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = Bolt11ParseError_invalid_slice_length(aPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Skip-variant Bolt11ParseError
		public class func initWithSkip() -> Bolt11ParseError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt11ParseError_skip()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt11ParseError(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Bolt11ParseErrors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Bolt11ParseError, b: Bolt11ParseError) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBolt11ParseError>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBolt11ParseError>) in
						Bolt11ParseError_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get the string representation of a Bolt11ParseError object
		public func toStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKBolt11ParseError>) in
					Bolt11ParseError_to_str(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}


		public func getValueAsBech32Error() -> Bech32Error? {
			if self.cType?.tag != LDKBolt11ParseError_Bech32Error {
				return nil
			}

			return Bech32Error(
				cType: self.cType!.bech32_error, instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsParseAmountError() -> Bindings.BindingsError? {
			if self.cType?.tag != LDKBolt11ParseError_ParseAmountError {
				return nil
			}

			return BindingsError(
				cType: self.cType!.parse_amount_error,
				instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsMalformedSignature() -> Secp256k1Error? {
			if self.cType?.tag != LDKBolt11ParseError_MalformedSignature {
				return nil
			}

			return Secp256k1Error(value: self.cType!.malformed_signature)
		}

		public func getValueAsDescriptionDecodeError() -> Bindings.BindingsError? {
			if self.cType?.tag != LDKBolt11ParseError_DescriptionDecodeError {
				return nil
			}

			return BindingsError(
				cType: self.cType!.description_decode_error,
				instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsInvalidSliceLength() -> String? {
			if self.cType?.tag != LDKBolt11ParseError_InvalidSliceLength {
				return nil
			}

			return Str(
				cType: self.cType!.invalid_slice_length,
				instantiationContext: "Bolt11ParseError.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()
		}


		internal func danglingClone() -> Bolt11ParseError {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Bolt11ParseError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Bolt11ParseError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
