#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Fallback = Bindings.Fallback

extension Bindings {

	public class Fallback: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKFallback?

		

		public init(pointer: LDKFallback){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKFallback, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
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
						return SegWitProgram(pointer: self.cOpaqueStruct!.seg_wit_program, anchor: self)
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
				
			
		internal func free() -> Void {
			
			return Fallback_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Fallback {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Fallback \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Fallback \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Fallback {
			
			return Fallback(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFallback>) in
Fallback_clone(origPointer)
});
		}

					internal func danglingClone() -> Fallback {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func seg_wit_program(version: UInt8, program: [UInt8]) -> Fallback {
			
						let programWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: program)
						defer {
							programWrapper.noOpRetain()
						}
					
			return Fallback(pointer: Fallback_seg_wit_program(Bindings.new_LDKu5(array: version), programWrapper.dangle().cOpaqueStruct!));
		}

		public class func pub_key_hash(a: [UInt8]) -> Fallback {
			
			return Fallback(pointer: Fallback_pub_key_hash(Bindings.new_LDKTwentyBytes(array: a)));
		}

		public class func script_hash(a: [UInt8]) -> Fallback {
			
			return Fallback(pointer: Fallback_script_hash(Bindings.new_LDKTwentyBytes(array: a)));
		}

		public func hash() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKFallback>) in
Fallback_hash(oPointer)
};
		}

		public class func eq(a: Bindings.Fallback, b: Bindings.Fallback) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKFallback>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKFallback>) in
Fallback_eq(aPointer, bPointer)
}
};
		}

		/* OPTION_METHODS_END */

		

			public class SegWitProgram: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKFallback_LDKSegWitProgram_Body?;
				fileprivate init(pointer: LDKFallback_LDKSegWitProgram_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKFallback_LDKSegWitProgram_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getVersion() -> UInt8 {
						return self.cOpaqueStruct!.version._0
					}
				
					public func getProgram() -> [UInt8] {
						return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.program, deallocate: false)
					}
				

			}
		
	}

}
