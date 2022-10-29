#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_CustomOnionMessageContentsZ = Bindings.Option_CustomOnionMessageContentsZ

extension Bindings {

	public class Option_CustomOnionMessageContentsZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_CustomOnionMessageContentsZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: CustomOnionMessageContents?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_CustomOnionMessageContentsZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_CustomOnionMessageContentsZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_CustomOnionMessageContentsZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_CustomOnionMessageContentsZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_CustomOnionMessageContentsZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> CustomOnionMessageContents? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_CustomOnionMessageContentsZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_CustomOnionMessageContentsZ_Some {
					return CustomOnionMessageContents(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.CustomOnionMessageContents) -> Option_CustomOnionMessageContentsZ {
			
			return Option_CustomOnionMessageContentsZ(pointer: COption_CustomOnionMessageContentsZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_CustomOnionMessageContentsZ {
			
			return Option_CustomOnionMessageContentsZ(pointer: COption_CustomOnionMessageContentsZ_none());
		}

		internal func free() -> Void {
			
			return COption_CustomOnionMessageContentsZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_CustomOnionMessageContentsZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_CustomOnionMessageContentsZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_CustomOnionMessageContentsZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_CustomOnionMessageContentsZ {
			
			return Option_CustomOnionMessageContentsZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_CustomOnionMessageContentsZ>) in
COption_CustomOnionMessageContentsZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_CustomOnionMessageContentsZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
