#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias HTLCDestination = Bindings.HTLCDestination

extension Bindings {

	public class HTLCDestination: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKHTLCDestination?

		

		public init(pointer: LDKHTLCDestination){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKHTLCDestination, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum HTLCDestinationValueType {
					case NextHopChannel, UnknownNextHop, FailedPayment
				}

				public func getValueType() -> HTLCDestinationValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKHTLCDestination_NextHopChannel:
						return .NextHopChannel
					case LDKHTLCDestination_UnknownNextHop:
						return .UnknownNextHop
					case LDKHTLCDestination_FailedPayment:
						return .FailedPayment
                    default:
                        return nil
                    }
				}

				
					public func getValueAsNextHopChannel() -> NextHopChannel? {
						if self.cOpaqueStruct?.tag != LDKHTLCDestination_NextHopChannel {
							return nil
						}
						return NextHopChannel(pointer: self.cOpaqueStruct!.next_hop_channel, anchor: self)
					}
				
					public func getValueAsUnknownNextHop() -> UnknownNextHop? {
						if self.cOpaqueStruct?.tag != LDKHTLCDestination_UnknownNextHop {
							return nil
						}
						return UnknownNextHop(pointer: self.cOpaqueStruct!.unknown_next_hop, anchor: self)
					}
				
					public func getValueAsFailedPayment() -> FailedPayment? {
						if self.cOpaqueStruct?.tag != LDKHTLCDestination_FailedPayment {
							return nil
						}
						return FailedPayment(pointer: self.cOpaqueStruct!.failed_payment, anchor: self)
					}
				
			
		internal func free() -> Void {
			
			return HTLCDestination_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> HTLCDestination {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing HTLCDestination \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing HTLCDestination \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> HTLCDestination {
			
			return HTLCDestination(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCDestination>) in
HTLCDestination_clone(origPointer)
});
		}

					internal func danglingClone() -> HTLCDestination {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func next_hop_channel(node_id: [UInt8], channel_id: [UInt8]) -> HTLCDestination {
			
			return HTLCDestination(pointer: HTLCDestination_next_hop_channel(Bindings.new_LDKPublicKey(array: node_id), Bindings.new_LDKThirtyTwoBytes(array: channel_id)));
		}

		public class func unknown_next_hop(requested_forward_scid: UInt64) -> HTLCDestination {
			
			return HTLCDestination(pointer: HTLCDestination_unknown_next_hop(requested_forward_scid));
		}

		public class func failed_payment(payment_hash: [UInt8]) -> HTLCDestination {
			
			return HTLCDestination(pointer: HTLCDestination_failed_payment(Bindings.new_LDKThirtyTwoBytes(array: payment_hash)));
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHTLCDestination>) in
HTLCDestination_write(objPointer)
});
		}

		public class func read(ser: [UInt8]) -> Result_COption_HTLCDestinationZDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_COption_HTLCDestinationZDecodeErrorZ(pointer: HTLCDestination_read(serWrapper.cOpaqueStruct!));
		}

		/* OPTION_METHODS_END */

		

			public class NextHopChannel: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKHTLCDestination_LDKNextHopChannel_Body?;
				fileprivate init(pointer: LDKHTLCDestination_LDKNextHopChannel_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKHTLCDestination_LDKNextHopChannel_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getChannel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.channel_id)
					}
				

			}
		

			public class UnknownNextHop: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKHTLCDestination_LDKUnknownNextHop_Body?;
				fileprivate init(pointer: LDKHTLCDestination_LDKUnknownNextHop_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKHTLCDestination_LDKUnknownNextHop_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getRequested_forward_scid() -> UInt64 {
						return self.cOpaqueStruct!.requested_forward_scid
					}
				

			}
		

			public class FailedPayment: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKHTLCDestination_LDKFailedPayment_Body?;
				fileprivate init(pointer: LDKHTLCDestination_LDKFailedPayment_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKHTLCDestination_LDKFailedPayment_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				

			}
		
	}

}
