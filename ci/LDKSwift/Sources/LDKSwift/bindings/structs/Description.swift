#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Description = Bindings.Description

extension Bindings {

	public class Description: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKDescription?


		

		public init(pointer: LDKDescription){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKDescription, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func clone() -> Description {
			
			return Description(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDescription>) in
Description_clone(origPointer)
});
		}

					internal func danglingClone() -> Description {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public func hash() -> UInt64 {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKDescription>) in
Description_hash(oPointer)
};
		}

		public class func eq(a: Description, b: Description) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKDescription>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKDescription>) in
Description_eq(aPointer, bPointer)
}
};
		}

		public class func new(description: String) -> Result_DescriptionCreationErrorZ {
			
			return Result_DescriptionCreationErrorZ(pointer: Description_new(Bindings.new_LDKStr(string: description, chars_is_owned: true)));
		}

		public func into_inner() -> String {
			
			return Bindings.LDKStr_to_string(nativeType: Description_into_inner(self.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return Description_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Description {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Description \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Description \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
