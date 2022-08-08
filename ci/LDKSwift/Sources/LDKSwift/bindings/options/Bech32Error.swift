#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Bech32Error = Bindings.Bech32Error

extension Bindings {

	public class Bech32Error: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBech32Error?

		

		public init(pointer: LDKBech32Error){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKBech32Error, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum Bech32ErrorValueType {
					case InvalidChar, InvalidData
				}

				public func getValueType() -> Bech32ErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKBech32Error_InvalidChar:
						return .InvalidChar
					case LDKBech32Error_InvalidData:
						return .InvalidData
                    default:
                        return nil
                    }
				}

				
					public func getValueAsInvalidChar() -> UInt32? {
						if self.cOpaqueStruct?.tag != LDKBech32Error_InvalidChar {
							return nil
						}
						return self.cOpaqueStruct!.invalid_char
					}
				
					public func getValueAsInvalidData() -> UInt8? {
						if self.cOpaqueStruct?.tag != LDKBech32Error_InvalidData {
							return nil
						}
						return self.cOpaqueStruct!.invalid_data
					}
				
			
		public func clone() -> Bech32Error {
			
			return Bech32Error(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKBech32Error>) in
Bech32Error_clone(origPointer)
});
		}

					internal func danglingClone() -> Bech32Error {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		internal func free() -> Void {
			
			return Bech32Error_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Bech32Error {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Bech32Error \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Bech32Error \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
