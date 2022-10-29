#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_NodeAliasDecodeErrorZ = Bindings.Result_NodeAliasDecodeErrorZ

extension Bindings {

	public class Result_NodeAliasDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_NodeAliasDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NodeAliasDecodeErrorZ(contents: LDKCResult_NodeAliasDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_NodeAliasDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_NodeAliasDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> NodeAlias? {
				if self.cOpaqueStruct?.result_ok == true {
					return NodeAlias(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: NodeAlias) -> Result_NodeAliasDecodeErrorZ {
			
			return Result_NodeAliasDecodeErrorZ(pointer: CResult_NodeAliasDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_NodeAliasDecodeErrorZ {
			
			return Result_NodeAliasDecodeErrorZ(pointer: CResult_NodeAliasDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_NodeAliasDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_NodeAliasDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NodeAliasDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NodeAliasDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_NodeAliasDecodeErrorZ {
			
			return Result_NodeAliasDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NodeAliasDecodeErrorZ>) in
CResult_NodeAliasDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_NodeAliasDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
