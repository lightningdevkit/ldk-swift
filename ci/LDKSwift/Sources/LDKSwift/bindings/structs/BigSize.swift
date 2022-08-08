#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias BigSize = Bindings.BigSize

extension Bindings {

	public class BigSize: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBigSize?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(a_arg: UInt64) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = BigSize_new(a_arg)
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKBigSize){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKBigSize, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func get_a() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKBigSize>) in
BigSize_get_a(this_ptrPointer)
};
		}

		public func set_a(val: UInt64) -> Void {
			
							let this_ptrPointer = UnsafeMutablePointer<LDKBigSize>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
			return BigSize_set_a(this_ptrPointer, val);
		}

		internal func free() -> Void {
			
			return BigSize_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> BigSize {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BigSize \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BigSize \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
