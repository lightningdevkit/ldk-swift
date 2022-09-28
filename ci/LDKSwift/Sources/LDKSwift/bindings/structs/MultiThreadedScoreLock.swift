#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias MultiThreadedScoreLock = Bindings.MultiThreadedScoreLock

extension Bindings {

	public class MultiThreadedScoreLock: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKMultiThreadedScoreLock?


		

		public init(pointer: LDKMultiThreadedScoreLock){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKMultiThreadedScoreLock, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func as_Score() -> NativelyImplementedScore {
			
			return NativelyImplementedScore(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKMultiThreadedScoreLock>) in
MultiThreadedScoreLock_as_Score(this_argPointer)
}, anchor: self);
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKMultiThreadedScoreLock>) in
MultiThreadedScoreLock_write(objPointer)
});
		}

		internal func free() -> Void {
			
			return MultiThreadedScoreLock_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> MultiThreadedScoreLock {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing MultiThreadedScoreLock \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MultiThreadedScoreLock \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
