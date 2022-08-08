#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_u64Z = Bindings.Option_u64Z

extension Bindings {

	public class Option_u64Z: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_u64Z?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: UInt64?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_u64Z()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_u64Z_Some
					
					self.cOpaqueStruct!.some = value
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_u64Z_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_u64Z){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_u64Z, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> UInt64? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_u64Z_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_u64Z_Some {
					return self.cOpaqueStruct!.some
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: UInt64) -> Option_u64Z {
			
			return Option_u64Z(pointer: COption_u64Z_some(o));
		}

		public class func none() -> Option_u64Z {
			
			return Option_u64Z(pointer: COption_u64Z_none());
		}

		internal func free() -> Void {
			
			return COption_u64Z_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_u64Z {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_u64Z \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_u64Z \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_u64Z {
			
			return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_u64Z>) in
COption_u64Z_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_u64Z {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
