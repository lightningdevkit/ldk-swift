#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ClosureReason = Bindings.ClosureReason

extension Bindings {

	public class ClosureReason: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKClosureReason?

		

		public init(pointer: LDKClosureReason){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKClosureReason, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum ClosureReasonValueType {
					case CounterpartyForceClosed, ProcessingError
				}

				public func getValueType() -> ClosureReasonValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKClosureReason_CounterpartyForceClosed:
						return .CounterpartyForceClosed
					case LDKClosureReason_ProcessingError:
						return .ProcessingError
                    default:
                        return nil
                    }
				}

				
					public func getValueAsCounterpartyForceClosed() -> CounterpartyForceClosed? {
						if self.cOpaqueStruct?.tag != LDKClosureReason_CounterpartyForceClosed {
							return nil
						}
						return CounterpartyForceClosed(pointer: self.cOpaqueStruct!.counterparty_force_closed, anchor: self)
					}
				
					public func getValueAsProcessingError() -> ProcessingError? {
						if self.cOpaqueStruct?.tag != LDKClosureReason_ProcessingError {
							return nil
						}
						return ProcessingError(pointer: self.cOpaqueStruct!.processing_error, anchor: self)
					}
				
			
		internal func free() -> Void {
			
			return ClosureReason_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ClosureReason {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ClosureReason \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ClosureReason \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> ClosureReason {
			
			return ClosureReason(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKClosureReason>) in
ClosureReason_clone(origPointer)
});
		}

					internal func danglingClone() -> ClosureReason {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func counterparty_force_closed(peer_msg: String) -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_counterparty_force_closed(Bindings.new_LDKStr(string: peer_msg, chars_is_owned: true)));
		}

		public class func holder_force_closed() -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_holder_force_closed());
		}

		public class func cooperative_closure() -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_cooperative_closure());
		}

		public class func commitment_tx_confirmed() -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_commitment_tx_confirmed());
		}

		public class func funding_timed_out() -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_funding_timed_out());
		}

		public class func processing_error(err: String) -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_processing_error(Bindings.new_LDKStr(string: err, chars_is_owned: true)));
		}

		public class func disconnected_peer() -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_disconnected_peer());
		}

		public class func outdated_channel_manager() -> ClosureReason {
			
			return ClosureReason(pointer: ClosureReason_outdated_channel_manager());
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKClosureReason>) in
ClosureReason_write(objPointer)
}, callerContext: "ClosureReason::write");
		}

		public class func read(ser: [UInt8]) -> Result_COption_ClosureReasonZDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_COption_ClosureReasonZDecodeErrorZ(pointer: ClosureReason_read(serWrapper.cOpaqueStruct!));
		}

		/* OPTION_METHODS_END */

		

			public class CounterpartyForceClosed: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKClosureReason_LDKCounterpartyForceClosed_Body?;
				fileprivate init(pointer: LDKClosureReason_LDKCounterpartyForceClosed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKClosureReason_LDKCounterpartyForceClosed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getPeer_msg() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.peer_msg, callerContext: "ClosureReason::CounterpartyForceClosed::getPeer_msg", deallocate: false)
					}
				

			}
		

			public class ProcessingError: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKClosureReason_LDKProcessingError_Body?;
				fileprivate init(pointer: LDKClosureReason_LDKProcessingError_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKClosureReason_LDKProcessingError_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err, callerContext: "ClosureReason::ProcessingError::getErr", deallocate: false)
					}
				

			}
		
	}

}
