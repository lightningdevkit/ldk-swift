#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_PhantomRouteHintsDecodeErrorZ = Bindings.Result_PhantomRouteHintsDecodeErrorZ

extension Bindings {

	public class Result_PhantomRouteHintsDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_PhantomRouteHintsDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PhantomRouteHintsDecodeErrorZ(contents: LDKCResult_PhantomRouteHintsDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_PhantomRouteHintsDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_PhantomRouteHintsDecodeErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self).dangle()
				}
				return nil
			}
			
			public func getValue() -> PhantomRouteHints? {
				if self.cOpaqueStruct?.result_ok == true {
					return PhantomRouteHints(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: PhantomRouteHints) -> Result_PhantomRouteHintsDecodeErrorZ {
			
			return Result_PhantomRouteHintsDecodeErrorZ(pointer: CResult_PhantomRouteHintsDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_PhantomRouteHintsDecodeErrorZ {
			
			return Result_PhantomRouteHintsDecodeErrorZ(pointer: CResult_PhantomRouteHintsDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_PhantomRouteHintsDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_PhantomRouteHintsDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PhantomRouteHintsDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PhantomRouteHintsDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_PhantomRouteHintsDecodeErrorZ {
			
			return Result_PhantomRouteHintsDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PhantomRouteHintsDecodeErrorZ>) in
CResult_PhantomRouteHintsDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_PhantomRouteHintsDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
