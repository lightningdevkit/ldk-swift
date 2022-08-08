#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ExpandedKey = Bindings.ExpandedKey

extension Bindings {

	public class ExpandedKey: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKExpandedKey?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(key_material: [UInt8]) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = withUnsafePointer(to: Bindings.array_to_tuple32(array: key_material)) { (key_materialPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ExpandedKey_new(key_materialPointer)
}
			super.init(conflictAvoidingVariableName: 0)
			
		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKExpandedKey){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKExpandedKey, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		internal func free() -> Void {
			
			return ExpandedKey_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ExpandedKey {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ExpandedKey \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ExpandedKey \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
