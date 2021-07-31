public class Fallback {

    public internal(set) var cOpaqueStruct: LDKFallback?;

	

    public init(pointer: LDKFallback){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum FallbackValueType {
					case SegWitProgram, PubKeyHash, ScriptHash
				}
				
				public func getValueType() -> FallbackValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKFallback_SegWitProgram:
						return .SegWitProgram
					case LDKFallback_PubKeyHash:
						return .PubKeyHash
					case LDKFallback_ScriptHash:
						return .ScriptHash
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsSegWitProgram() -> SegWitProgram? {
						if self.cOpaqueStruct?.tag != LDKFallback_SegWitProgram {
							return nil
						}
						return SegWitProgram(pointer: self.cOpaqueStruct!.seg_wit_program)
					}
				
					public func getValueAsPubKeyHash() -> [UInt8]? {
						if self.cOpaqueStruct?.tag != LDKFallback_PubKeyHash {
							return nil
						}
						return Bindings.LDKTwentyBytes_to_array(nativeType: self.cOpaqueStruct!.pub_key_hash)
					}
				
					public func getValueAsScriptHash() -> [UInt8]? {
						if self.cOpaqueStruct?.tag != LDKFallback_ScriptHash {
							return nil
						}
						return Bindings.LDKTwentyBytes_to_array(nativeType: self.cOpaqueStruct!.script_hash)
					}
				
			
    public func free() -> Void {
    	
        return Fallback_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Fallback {
    	
        return Fallback(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFallback>) in
Fallback_clone(origPointer)
});
    }

    public func eq(a: Fallback, b: Fallback) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKFallback>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKFallback>) in
Fallback_eq(aPointer, bPointer)
}
};
    }

    /* OPTION_METHODS_END */

	

			public class SegWitProgram {
				
				
				var cOpaqueStruct: LDKFallback_LDKSegWitProgram_Body?;
				fileprivate init(pointer: LDKFallback_LDKSegWitProgram_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getVersion() -> UInt8 {
						return self.cOpaqueStruct!.version._0
					}
				
					public func getProgram() -> [UInt8] {
						return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.program)
					}
				
				
			}
		
}
