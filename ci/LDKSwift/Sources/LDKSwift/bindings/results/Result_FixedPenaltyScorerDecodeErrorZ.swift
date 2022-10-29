#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_FixedPenaltyScorerDecodeErrorZ = Bindings.Result_FixedPenaltyScorerDecodeErrorZ

extension Bindings {

	public class Result_FixedPenaltyScorerDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_FixedPenaltyScorerDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_FixedPenaltyScorerDecodeErrorZ(contents: LDKCResult_FixedPenaltyScorerDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_FixedPenaltyScorerDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_FixedPenaltyScorerDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> FixedPenaltyScorer? {
				if self.cOpaqueStruct?.result_ok == true {
					return FixedPenaltyScorer(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: FixedPenaltyScorer) -> Result_FixedPenaltyScorerDecodeErrorZ {
			
			return Result_FixedPenaltyScorerDecodeErrorZ(pointer: CResult_FixedPenaltyScorerDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_FixedPenaltyScorerDecodeErrorZ {
			
			return Result_FixedPenaltyScorerDecodeErrorZ(pointer: CResult_FixedPenaltyScorerDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_FixedPenaltyScorerDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_FixedPenaltyScorerDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_FixedPenaltyScorerDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_FixedPenaltyScorerDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_FixedPenaltyScorerDecodeErrorZ {
			
			return Result_FixedPenaltyScorerDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_FixedPenaltyScorerDecodeErrorZ>) in
CResult_FixedPenaltyScorerDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_FixedPenaltyScorerDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
