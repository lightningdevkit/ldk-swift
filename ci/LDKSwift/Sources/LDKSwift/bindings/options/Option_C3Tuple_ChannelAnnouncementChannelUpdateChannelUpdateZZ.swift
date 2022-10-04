#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ = Bindings.Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ

extension Bindings {

	public class Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ?

		/* DEFAULT_CONSTRUCTOR_START */
		public init(value: C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
				self.cOpaqueStruct = LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_None
				}
			
			
			super.init(conflictAvoidingVariableName: 0)
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

		public func getValue() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ? {
			

				if self.cOpaqueStruct!.tag == LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_Some {
					return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
			
		}

		public class func some(o: Bindings.C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ) -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			
			return Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(pointer: COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_some(o.danglingClone().cOpaqueStruct!));
		}

		public class func none() -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			
			return Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(pointer: COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_none());
		}

		internal func free() -> Void {
			
			return COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			
			return Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ>) in
COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
