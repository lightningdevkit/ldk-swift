#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_C2Tuple_u64u64ZZ = Bindings.Option_C2Tuple_u64u64ZZ

extension Bindings {

	public class Option_C2Tuple_u64u64ZZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_C2Tuple_u64u64ZZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: C2Tuple_u64u64Z?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_C2Tuple_u64u64ZZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_C2Tuple_u64u64ZZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_C2Tuple_u64u64ZZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_C2Tuple_u64u64ZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_C2Tuple_u64u64ZZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> C2Tuple_u64u64Z? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_C2Tuple_u64u64ZZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_C2Tuple_u64u64ZZ_Some {
					return C2Tuple_u64u64Z(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.C2Tuple_u64u64Z) -> Option_C2Tuple_u64u64ZZ {
			
			return Option_C2Tuple_u64u64ZZ(pointer: COption_C2Tuple_u64u64ZZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_C2Tuple_u64u64ZZ {
			
			return Option_C2Tuple_u64u64ZZ(pointer: COption_C2Tuple_u64u64ZZ_none());
		}

		internal func free() -> Void {
			
			return COption_C2Tuple_u64u64ZZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_C2Tuple_u64u64ZZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_C2Tuple_u64u64ZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_C2Tuple_u64u64ZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_C2Tuple_u64u64ZZ {
			
			return Option_C2Tuple_u64u64ZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_C2Tuple_u64u64ZZ>) in
COption_C2Tuple_u64u64ZZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_C2Tuple_u64u64ZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
