#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_ScalarZ = Bindings.Option_ScalarZ

extension Bindings {

	public class Option_ScalarZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_ScalarZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: [UInt8]?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_ScalarZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_ScalarZ_Some
					
						
						let somevalue = Bindings.new_LDKBigEndianScalar(array: value)
					
					self.cOpaqueStruct!.some = somevalue
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_ScalarZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_ScalarZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_ScalarZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> [UInt8]? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_ScalarZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_ScalarZ_Some {
					return Bindings.LDKBigEndianScalar_to_array(nativeType: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: [UInt8]) -> Option_ScalarZ {
			
			return Option_ScalarZ(pointer: COption_ScalarZ_some(Bindings.new_LDKBigEndianScalar(array: o)));
		}

		public class func none() -> Option_ScalarZ {
			
			return Option_ScalarZ(pointer: COption_ScalarZ_none());
		}

		internal func free() -> Void {
			
			return COption_ScalarZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_ScalarZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_ScalarZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_ScalarZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
