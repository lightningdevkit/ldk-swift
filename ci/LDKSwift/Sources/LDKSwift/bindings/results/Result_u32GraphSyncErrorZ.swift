#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_u32GraphSyncErrorZ = Bindings.Result_u32GraphSyncErrorZ

extension Bindings {

	public class Result_u32GraphSyncErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_u32GraphSyncErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_u32GraphSyncErrorZ(contents: LDKCResult_u32GraphSyncErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_u32GraphSyncErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_u32GraphSyncErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> GraphSyncError? {
				if self.cOpaqueStruct?.result_ok == false {
					return GraphSyncError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> UInt32? {
				if self.cOpaqueStruct?.result_ok == true {
					return self.cOpaqueStruct!.contents.result.pointee
				}
				return nil
			}
			
		public class func ok(o: UInt32) -> Result_u32GraphSyncErrorZ {
			
			return Result_u32GraphSyncErrorZ(pointer: CResult_u32GraphSyncErrorZ_ok(o));
		}

		public class func err(e: GraphSyncError) -> Result_u32GraphSyncErrorZ {
			
			return Result_u32GraphSyncErrorZ(pointer: CResult_u32GraphSyncErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_u32GraphSyncErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_u32GraphSyncErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_u32GraphSyncErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_u32GraphSyncErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* RESULT_METHODS_END */

	}

}
