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
				
			
    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
