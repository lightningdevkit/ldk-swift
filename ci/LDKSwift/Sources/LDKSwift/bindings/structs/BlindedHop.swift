#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias BlindedHop = Bindings.BlindedHop

extension Bindings {

	public class BlindedHop: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBlindedHop?


		

		public init(pointer: LDKBlindedHop){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKBlindedHop, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKBlindedHop>) in
BlindedHop_write(objPointer)
}, callerContext: "BlindedHop::write");
		}

		public class func read(ser: [UInt8]) -> Result_BlindedHopDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_BlindedHopDecodeErrorZ(pointer: BlindedHop_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return BlindedHop_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> BlindedHop {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BlindedHop \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BlindedHop \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
