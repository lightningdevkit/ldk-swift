#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias C2Tuple_BlockHashChannelMonitorZ = Bindings.C2Tuple_BlockHashChannelMonitorZ

extension Bindings {

	public class C2Tuple_BlockHashChannelMonitorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKC2Tuple_BlockHashChannelMonitorZ?

		public init(pointer: LDKC2Tuple_BlockHashChannelMonitorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKC2Tuple_BlockHashChannelMonitorZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* TUPLE_METHODS_START */

		public func clone() -> C2Tuple_BlockHashChannelMonitorZ {
			
			return C2Tuple_BlockHashChannelMonitorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_BlockHashChannelMonitorZ>) in
C2Tuple_BlockHashChannelMonitorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> C2Tuple_BlockHashChannelMonitorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func new(a: [UInt8], b: ChannelMonitor) -> C2Tuple_BlockHashChannelMonitorZ {
			
			return C2Tuple_BlockHashChannelMonitorZ(pointer: C2Tuple_BlockHashChannelMonitorZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), b.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return C2Tuple_BlockHashChannelMonitorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> C2Tuple_BlockHashChannelMonitorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_BlockHashChannelMonitorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_BlockHashChannelMonitorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.a);
				}
			
				public func getB() -> ChannelMonitor {
					return ChannelMonitor(pointer: self.cOpaqueStruct!.b, anchor: self);
				}
			
		/* TUPLE_METHODS_END */

	}

}
