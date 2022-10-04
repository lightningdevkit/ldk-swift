#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Balance = Bindings.Balance

extension Bindings {

	public class Balance: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBalance?

		

		public init(pointer: LDKBalance){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKBalance, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum BalanceValueType {
					case ClaimableOnChannelClose, ClaimableAwaitingConfirmations, ContentiousClaimable, MaybeTimeoutClaimableHTLC, MaybePreimageClaimableHTLC, CounterpartyRevokedOutputClaimable
				}

				public func getValueType() -> BalanceValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKBalance_ClaimableOnChannelClose:
						return .ClaimableOnChannelClose
					case LDKBalance_ClaimableAwaitingConfirmations:
						return .ClaimableAwaitingConfirmations
					case LDKBalance_ContentiousClaimable:
						return .ContentiousClaimable
					case LDKBalance_MaybeTimeoutClaimableHTLC:
						return .MaybeTimeoutClaimableHTLC
					case LDKBalance_MaybePreimageClaimableHTLC:
						return .MaybePreimageClaimableHTLC
					case LDKBalance_CounterpartyRevokedOutputClaimable:
						return .CounterpartyRevokedOutputClaimable
                    default:
                        return nil
                    }
				}

				
					public func getValueAsClaimableOnChannelClose() -> ClaimableOnChannelClose? {
						if self.cOpaqueStruct?.tag != LDKBalance_ClaimableOnChannelClose {
							return nil
						}
						return ClaimableOnChannelClose(pointer: self.cOpaqueStruct!.claimable_on_channel_close, anchor: self)
					}
				
					public func getValueAsClaimableAwaitingConfirmations() -> ClaimableAwaitingConfirmations? {
						if self.cOpaqueStruct?.tag != LDKBalance_ClaimableAwaitingConfirmations {
							return nil
						}
						return ClaimableAwaitingConfirmations(pointer: self.cOpaqueStruct!.claimable_awaiting_confirmations, anchor: self)
					}
				
					public func getValueAsContentiousClaimable() -> ContentiousClaimable? {
						if self.cOpaqueStruct?.tag != LDKBalance_ContentiousClaimable {
							return nil
						}
						return ContentiousClaimable(pointer: self.cOpaqueStruct!.contentious_claimable, anchor: self)
					}
				
					public func getValueAsMaybeTimeoutClaimableHTLC() -> MaybeTimeoutClaimableHTLC? {
						if self.cOpaqueStruct?.tag != LDKBalance_MaybeTimeoutClaimableHTLC {
							return nil
						}
						return MaybeTimeoutClaimableHTLC(pointer: self.cOpaqueStruct!.maybe_timeout_claimable_htlc, anchor: self)
					}
				
					public func getValueAsMaybePreimageClaimableHTLC() -> MaybePreimageClaimableHTLC? {
						if self.cOpaqueStruct?.tag != LDKBalance_MaybePreimageClaimableHTLC {
							return nil
						}
						return MaybePreimageClaimableHTLC(pointer: self.cOpaqueStruct!.maybe_preimage_claimable_htlc, anchor: self)
					}
				
					public func getValueAsCounterpartyRevokedOutputClaimable() -> CounterpartyRevokedOutputClaimable? {
						if self.cOpaqueStruct?.tag != LDKBalance_CounterpartyRevokedOutputClaimable {
							return nil
						}
						return CounterpartyRevokedOutputClaimable(pointer: self.cOpaqueStruct!.counterparty_revoked_output_claimable, anchor: self)
					}
				
			
		internal func free() -> Void {
			
			return Balance_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Balance {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Balance \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Balance \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Balance {
			
			return Balance(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKBalance>) in
Balance_clone(origPointer)
});
		}

					internal func danglingClone() -> Balance {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func claimable_on_channel_close(claimable_amount_satoshis: UInt64) -> Balance {
			
			return Balance(pointer: Balance_claimable_on_channel_close(claimable_amount_satoshis));
		}

		public class func claimable_awaiting_confirmations(claimable_amount_satoshis: UInt64, confirmation_height: UInt32) -> Balance {
			
			return Balance(pointer: Balance_claimable_awaiting_confirmations(claimable_amount_satoshis, confirmation_height));
		}

		public class func contentious_claimable(claimable_amount_satoshis: UInt64, timeout_height: UInt32) -> Balance {
			
			return Balance(pointer: Balance_contentious_claimable(claimable_amount_satoshis, timeout_height));
		}

		public class func maybe_timeout_claimable_htlc(claimable_amount_satoshis: UInt64, claimable_height: UInt32) -> Balance {
			
			return Balance(pointer: Balance_maybe_timeout_claimable_htlc(claimable_amount_satoshis, claimable_height));
		}

		public class func maybe_preimage_claimable_htlc(claimable_amount_satoshis: UInt64, expiry_height: UInt32) -> Balance {
			
			return Balance(pointer: Balance_maybe_preimage_claimable_htlc(claimable_amount_satoshis, expiry_height));
		}

		public class func counterparty_revoked_output_claimable(claimable_amount_satoshis: UInt64) -> Balance {
			
			return Balance(pointer: Balance_counterparty_revoked_output_claimable(claimable_amount_satoshis));
		}

		public class func eq(a: Bindings.Balance, b: Bindings.Balance) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKBalance>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKBalance>) in
Balance_eq(aPointer, bPointer)
}
};
		}

		/* OPTION_METHODS_END */

		

			public class ClaimableOnChannelClose: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKBalance_LDKClaimableOnChannelClose_Body?;
				fileprivate init(pointer: LDKBalance_LDKClaimableOnChannelClose_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKBalance_LDKClaimableOnChannelClose_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getClaimable_amount_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.claimable_amount_satoshis
					}
				

			}
		

			public class ClaimableAwaitingConfirmations: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKBalance_LDKClaimableAwaitingConfirmations_Body?;
				fileprivate init(pointer: LDKBalance_LDKClaimableAwaitingConfirmations_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKBalance_LDKClaimableAwaitingConfirmations_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getClaimable_amount_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.claimable_amount_satoshis
					}
				
					public func getConfirmation_height() -> UInt32 {
						return self.cOpaqueStruct!.confirmation_height
					}
				

			}
		

			public class ContentiousClaimable: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKBalance_LDKContentiousClaimable_Body?;
				fileprivate init(pointer: LDKBalance_LDKContentiousClaimable_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKBalance_LDKContentiousClaimable_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getClaimable_amount_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.claimable_amount_satoshis
					}
				
					public func getTimeout_height() -> UInt32 {
						return self.cOpaqueStruct!.timeout_height
					}
				

			}
		

			public class MaybeTimeoutClaimableHTLC: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body?;
				fileprivate init(pointer: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKBalance_LDKMaybeTimeoutClaimableHTLC_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getClaimable_amount_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.claimable_amount_satoshis
					}
				
					public func getClaimable_height() -> UInt32 {
						return self.cOpaqueStruct!.claimable_height
					}
				

			}
		

			public class MaybePreimageClaimableHTLC: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKBalance_LDKMaybePreimageClaimableHTLC_Body?;
				fileprivate init(pointer: LDKBalance_LDKMaybePreimageClaimableHTLC_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKBalance_LDKMaybePreimageClaimableHTLC_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getClaimable_amount_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.claimable_amount_satoshis
					}
				
					public func getExpiry_height() -> UInt32 {
						return self.cOpaqueStruct!.expiry_height
					}
				

			}
		

			public class CounterpartyRevokedOutputClaimable: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body?;
				fileprivate init(pointer: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKBalance_LDKCounterpartyRevokedOutputClaimable_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getClaimable_amount_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.claimable_amount_satoshis
					}
				

			}
		
	}

}
