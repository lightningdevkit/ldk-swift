#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_MonitorEventZ = Bindings.Option_MonitorEventZ

extension Bindings {

	public class Option_MonitorEventZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_MonitorEventZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: MonitorEvent?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_MonitorEventZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_MonitorEventZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_MonitorEventZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_MonitorEventZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_MonitorEventZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> MonitorEvent? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_MonitorEventZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_MonitorEventZ_Some {
					return MonitorEvent(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.MonitorEvent) -> Option_MonitorEventZ {
			
			return Option_MonitorEventZ(pointer: COption_MonitorEventZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_MonitorEventZ {
			
			return Option_MonitorEventZ(pointer: COption_MonitorEventZ_none());
		}

		internal func free() -> Void {
			
			return COption_MonitorEventZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_MonitorEventZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_MonitorEventZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_MonitorEventZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_MonitorEventZ {
			
			return Option_MonitorEventZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_MonitorEventZ>) in
COption_MonitorEventZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_MonitorEventZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
