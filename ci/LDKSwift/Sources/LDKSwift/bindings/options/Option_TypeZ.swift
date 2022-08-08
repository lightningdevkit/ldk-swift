#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_TypeZ = Bindings.Option_TypeZ

extension Bindings {

	public class Option_TypeZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_TypeZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: BindingsType?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_TypeZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_TypeZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_TypeZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_TypeZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_TypeZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> BindingsType? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_TypeZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_TypeZ_Some {
					return BindingsType(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.BindingsType) -> Option_TypeZ {
			
			return Option_TypeZ(pointer: COption_TypeZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_TypeZ {
			
			return Option_TypeZ(pointer: COption_TypeZ_none());
		}

		internal func free() -> Void {
			
			return COption_TypeZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_TypeZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_TypeZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_TypeZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_TypeZ {
			
			return Option_TypeZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_TypeZ>) in
COption_TypeZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_TypeZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
