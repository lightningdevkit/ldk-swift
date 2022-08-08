#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Sha256 = Bindings.Sha256

extension Bindings {

	public class Sha256: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKSha256?


		

		public init(pointer: LDKSha256){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKSha256, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func clone() -> Sha256 {
			
			return Sha256(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSha256>) in
Sha256_clone(origPointer)
});
		}

					internal func danglingClone() -> Sha256 {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func hash() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKSha256>) in
Sha256_hash(oPointer)
};
		}

		public class func eq(a: Sha256, b: Sha256) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKSha256>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKSha256>) in
Sha256_eq(aPointer, bPointer)
}
};
		}

		internal func free() -> Void {
			
			return Sha256_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Sha256 {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Sha256 \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Sha256 \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
