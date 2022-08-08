#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ParseOrSemanticError = Bindings.ParseOrSemanticError

extension Bindings {

	public class ParseOrSemanticError: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKParseOrSemanticError?

		

		public init(pointer: LDKParseOrSemanticError){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKParseOrSemanticError, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum ParseOrSemanticErrorValueType {
					case ParseError, SemanticError
				}

				public func getValueType() -> ParseOrSemanticErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKParseOrSemanticError_ParseError:
						return .ParseError
					case LDKParseOrSemanticError_SemanticError:
						return .SemanticError
                    default:
                        return nil
                    }
				}

				
					public func getValueAsParseError() -> Bindings.ParseError? {
						if self.cOpaqueStruct?.tag != LDKParseOrSemanticError_ParseError {
							return nil
						}
						return Bindings.ParseError(pointer: self.cOpaqueStruct!.parse_error, anchor: self)
					}
				
					public func getValueAsSemanticError() -> LDKSemanticError? {
						if self.cOpaqueStruct?.tag != LDKParseOrSemanticError_SemanticError {
							return nil
						}
						return self.cOpaqueStruct!.semantic_error
					}
				
			
		internal func free() -> Void {
			
			return ParseOrSemanticError_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ParseOrSemanticError {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ParseOrSemanticError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ParseOrSemanticError \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> ParseOrSemanticError {
			
			return ParseOrSemanticError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKParseOrSemanticError>) in
ParseOrSemanticError_clone(origPointer)
});
		}

					internal func danglingClone() -> ParseOrSemanticError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func parse_error(a: Bindings.ParseError) -> ParseOrSemanticError {
			
			return ParseOrSemanticError(pointer: ParseOrSemanticError_parse_error(a.danglingClone().cOpaqueStruct!));
		}

		public class func semantic_error(a: LDKSemanticError) -> ParseOrSemanticError {
			
			return ParseOrSemanticError(pointer: ParseOrSemanticError_semantic_error(a));
		}

		public func to_str() -> String {
			
			return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKParseOrSemanticError>) in
ParseOrSemanticError_to_str(oPointer)
});
		}

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
