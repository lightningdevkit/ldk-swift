#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_ClosureReasonZ = Bindings.Option_ClosureReasonZ

extension Bindings {

	public class Option_ClosureReasonZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_ClosureReasonZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: ClosureReason?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_ClosureReasonZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_ClosureReasonZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_ClosureReasonZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_ClosureReasonZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_ClosureReasonZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> ClosureReason? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_ClosureReasonZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_ClosureReasonZ_Some {
					return ClosureReason(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.ClosureReason) -> Option_ClosureReasonZ {
			
			return Option_ClosureReasonZ(pointer: COption_ClosureReasonZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_ClosureReasonZ {
			
			return Option_ClosureReasonZ(pointer: COption_ClosureReasonZ_none());
		}

		internal func free() -> Void {
			
			return COption_ClosureReasonZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_ClosureReasonZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_ClosureReasonZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_ClosureReasonZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_ClosureReasonZ {
			
			return Option_ClosureReasonZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_ClosureReasonZ>) in
COption_ClosureReasonZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_ClosureReasonZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
