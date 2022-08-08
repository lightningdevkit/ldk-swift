#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Hostname = Bindings.Hostname

extension Bindings {

	public class Hostname: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKHostname?


		

		public init(pointer: LDKHostname){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKHostname, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func clone() -> Hostname {
			
			return Hostname(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHostname>) in
Hostname_clone(origPointer)
});
		}

					internal func danglingClone() -> Hostname {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func len() -> UInt8 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKHostname>) in
Hostname_len(this_argPointer)
};
		}

		internal func free() -> Void {
			
			return Hostname_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Hostname {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Hostname \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Hostname \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
