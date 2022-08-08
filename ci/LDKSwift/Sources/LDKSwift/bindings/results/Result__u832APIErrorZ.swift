#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result__u832APIErrorZ = Bindings.Result__u832APIErrorZ

extension Bindings {

	public class Result__u832APIErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult__u832APIErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult__u832APIErrorZ(contents: LDKCResult__u832APIErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult__u832APIErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult__u832APIErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> APIError? {
				if self.cOpaqueStruct?.result_ok == false {
					return APIError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
		public class func ok(o: [UInt8]) -> Result__u832APIErrorZ {
			
			return Result__u832APIErrorZ(pointer: CResult__u832APIErrorZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
		}

		public class func err(e: APIError) -> Result__u832APIErrorZ {
			
			return Result__u832APIErrorZ(pointer: CResult__u832APIErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult__u832APIErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result__u832APIErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result__u832APIErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result__u832APIErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result__u832APIErrorZ {
			
			return Result__u832APIErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult__u832APIErrorZ>) in
CResult__u832APIErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result__u832APIErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
