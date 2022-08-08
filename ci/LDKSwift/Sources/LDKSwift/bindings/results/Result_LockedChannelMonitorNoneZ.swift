#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_LockedChannelMonitorNoneZ = Bindings.Result_LockedChannelMonitorNoneZ

extension Bindings {

	public class Result_LockedChannelMonitorNoneZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_LockedChannelMonitorNoneZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_LockedChannelMonitorNoneZ(contents: LDKCResult_LockedChannelMonitorNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_LockedChannelMonitorNoneZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_LockedChannelMonitorNoneZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		public func isOk() -> Bool {
			return self.cOpaqueStruct?.result_ok == true
		}

		/* RESULT_METHODS_START */

			public func getValue() -> LockedChannelMonitor? {
				if self.cOpaqueStruct?.result_ok == true {
					return LockedChannelMonitor(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func ok(o: LockedChannelMonitor) -> Result_LockedChannelMonitorNoneZ {
			
			return Result_LockedChannelMonitorNoneZ(pointer: CResult_LockedChannelMonitorNoneZ_ok(o.cOpaqueStruct!));
		}

		public class func err() -> Result_LockedChannelMonitorNoneZ {
			
			return Result_LockedChannelMonitorNoneZ(pointer: CResult_LockedChannelMonitorNoneZ_err());
		}

		internal func free() -> Void {
			
			return CResult_LockedChannelMonitorNoneZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_LockedChannelMonitorNoneZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_LockedChannelMonitorNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_LockedChannelMonitorNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* RESULT_METHODS_END */

	}

}
