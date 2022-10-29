#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ = Bindings.C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ

extension Bindings {

	public class C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ?

		public init(pointer: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* TUPLE_METHODS_START */

		public func clone() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
			
			return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>) in
C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_clone(origPointer)
});
		}

					internal func danglingClone() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func new(a: ChannelAnnouncement, b: ChannelUpdate, c: ChannelUpdate) -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
			
			return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_new(a.danglingClone().cOpaqueStruct!, b.danglingClone().cOpaqueStruct!, c.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> ChannelAnnouncement {
					return ChannelAnnouncement(pointer: self.cOpaqueStruct!.a, anchor: self).dangle();
				}
			
				public func getB() -> ChannelUpdate {
					return ChannelUpdate(pointer: self.cOpaqueStruct!.b, anchor: self).dangle();
				}
			
				public func getC() -> ChannelUpdate {
					return ChannelUpdate(pointer: self.cOpaqueStruct!.c, anchor: self).dangle();
				}
			
		/* TUPLE_METHODS_END */

	}

}
