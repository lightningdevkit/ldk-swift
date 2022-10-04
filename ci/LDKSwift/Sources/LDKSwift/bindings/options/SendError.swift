#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias SendError = Bindings.SendError

extension Bindings {

	public class SendError: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKSendError?

		

		public init(pointer: LDKSendError){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKSendError, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum SendErrorValueType {
					case Secp256k1
				}

				public func getValueType() -> SendErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKSendError_Secp256k1:
						return .Secp256k1
                    default:
                        return nil
                    }
				}

				
					public func getValueAsSecp256k1() -> LDKSecp256k1Error? {
						if self.cOpaqueStruct?.tag != LDKSendError_Secp256k1 {
							return nil
						}
						return self.cOpaqueStruct!.secp256k1
					}
				
			
		internal func free() -> Void {
			
			return SendError_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> SendError {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing SendError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing SendError \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> SendError {
			
			return SendError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSendError>) in
SendError_clone(origPointer)
});
		}

					internal func danglingClone() -> SendError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func secp256k1(a: LDKSecp256k1Error) -> SendError {
			
			return SendError(pointer: SendError_secp256k1(a));
		}

		public class func too_big_packet() -> SendError {
			
			return SendError(pointer: SendError_too_big_packet());
		}

		public class func too_few_blinded_hops() -> SendError {
			
			return SendError(pointer: SendError_too_few_blinded_hops());
		}

		public class func invalid_first_hop() -> SendError {
			
			return SendError(pointer: SendError_invalid_first_hop());
		}

		public class func buffer_full() -> SendError {
			
			return SendError(pointer: SendError_buffer_full());
		}

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
