#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Future = Bindings.Future

extension Bindings {

	public class Future: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKFuture?


		

		public init(pointer: LDKFuture){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKFuture, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func register_callback_fn(callback: FutureCallback) -> Void {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFuture>) in
Future_register_callback_fn(this_argPointer, callback.activate().cOpaqueStruct!)
};
		}

		internal func free() -> Void {
			
			return Future_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Future {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Future \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Future \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
