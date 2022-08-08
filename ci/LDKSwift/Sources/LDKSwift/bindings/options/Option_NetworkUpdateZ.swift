#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_NetworkUpdateZ = Bindings.Option_NetworkUpdateZ

extension Bindings {

	public class Option_NetworkUpdateZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_NetworkUpdateZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: NetworkUpdate?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_NetworkUpdateZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_NetworkUpdateZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_NetworkUpdateZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_NetworkUpdateZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_NetworkUpdateZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> NetworkUpdate? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_NetworkUpdateZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_NetworkUpdateZ_Some {
					return NetworkUpdate(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.NetworkUpdate) -> Option_NetworkUpdateZ {
			
			return Option_NetworkUpdateZ(pointer: COption_NetworkUpdateZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_NetworkUpdateZ {
			
			return Option_NetworkUpdateZ(pointer: COption_NetworkUpdateZ_none());
		}

		internal func free() -> Void {
			
			return COption_NetworkUpdateZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_NetworkUpdateZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_NetworkUpdateZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_NetworkUpdateZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_NetworkUpdateZ {
			
			return Option_NetworkUpdateZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_NetworkUpdateZ>) in
COption_NetworkUpdateZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_NetworkUpdateZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
