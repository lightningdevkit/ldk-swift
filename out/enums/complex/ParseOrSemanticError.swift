import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias ParseOrSemanticError = Bindings.ParseOrSemanticError

extension Bindings {

	/// Indicates that something went wrong while parsing or validating the invoice. Parsing errors
	/// should be mostly seen as opaque and are only there for debugging reasons. Semantic errors
	/// like wrong signatures, missing fields etc. could mean that someone tampered with the invoice.
	public class ParseOrSemanticError: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKParseOrSemanticError?

		internal init(cType: LDKParseOrSemanticError, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKParseOrSemanticError, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKParseOrSemanticError, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum ParseOrSemanticErrorType {

			/// The invoice couldn't be decoded
			case ParseError

			/// The invoice could be decoded but violates the BOLT11 standard
			case SemanticError

		}

		public func getValueType() -> ParseOrSemanticErrorType {
			switch self.cType!.tag {
				case LDKParseOrSemanticError_ParseError:
					return .ParseError

				case LDKParseOrSemanticError_SemanticError:
					return .SemanticError

				default:
					Bindings.print("Error: Invalid value type for ParseOrSemanticError! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the ParseOrSemanticError
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ParseOrSemanticError_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ParseOrSemanticError
		internal func clone() -> ParseOrSemanticError {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKParseOrSemanticError>) in
					ParseOrSemanticError_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ParseOrSemanticError(
				cType: nativeCallResult, instantiationContext: "ParseOrSemanticError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ParseError-variant ParseOrSemanticError
		public class func initWithParseError(a: Bolt11ParseError) -> ParseOrSemanticError {
			// native call variable prep


			// native method call
			let nativeCallResult = ParseOrSemanticError_parse_error(a.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ParseOrSemanticError(
				cType: nativeCallResult, instantiationContext: "ParseOrSemanticError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new SemanticError-variant ParseOrSemanticError
		public class func initWithSemanticError(a: Bolt11SemanticError) -> ParseOrSemanticError {
			// native call variable prep


			// native method call
			let nativeCallResult = ParseOrSemanticError_semantic_error(a.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = ParseOrSemanticError(
				cType: nativeCallResult, instantiationContext: "ParseOrSemanticError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ParseOrSemanticErrors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: ParseOrSemanticError, b: ParseOrSemanticError) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKParseOrSemanticError>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKParseOrSemanticError>) in
						ParseOrSemanticError_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get the string representation of a ParseOrSemanticError object
		public func toStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKParseOrSemanticError>) in
					ParseOrSemanticError_to_str(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "ParseOrSemanticError.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}


		public func getValueAsParseError() -> Bolt11ParseError? {
			if self.cType?.tag != LDKParseOrSemanticError_ParseError {
				return nil
			}

			return Bolt11ParseError(
				cType: self.cType!.parse_error,
				instantiationContext: "ParseOrSemanticError.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsSemanticError() -> Bolt11SemanticError? {
			if self.cType?.tag != LDKParseOrSemanticError_SemanticError {
				return nil
			}

			return Bolt11SemanticError(value: self.cType!.semantic_error)
		}


		internal func danglingClone() -> ParseOrSemanticError {
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
						"Freeing ParseOrSemanticError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ParseOrSemanticError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
