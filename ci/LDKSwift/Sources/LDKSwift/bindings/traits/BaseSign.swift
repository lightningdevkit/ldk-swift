#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

open class BaseSign: NativeTraitWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKBaseSign?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func get_per_commitment_pointCallback(pointer: UnsafeRawPointer?, idx: UInt64) -> LDKPublicKey {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::get_per_commitment_point")
			
			return Bindings.new_LDKPublicKey(array: instance.get_per_commitment_point(idx: idx))
		}

		func release_commitment_secretCallback(pointer: UnsafeRawPointer?, idx: UInt64) -> LDKThirtyTwoBytes {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::release_commitment_secret")
			
			return Bindings.new_LDKThirtyTwoBytes(array: instance.release_commitment_secret(idx: idx))
		}

		func validate_holder_commitmentCallback(pointer: UnsafeRawPointer?, holder_txPointer: UnsafePointer<LDKHolderCommitmentTransaction>, preimages: LDKCVec_PaymentPreimageZ) -> LDKCResult_NoneNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::validate_holder_commitment")
			let holder_tx = HolderCommitmentTransaction(pointer: holder_txPointer.pointee).dangle().clone();

			return instance.validate_holder_commitment(holder_tx: holder_tx, preimages: Bindings.LDKCVec_PaymentPreimageZ_to_array(nativeType: preimages)).cOpaqueStruct!
		}

		func channel_keys_idCallback(pointer: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::channel_keys_id")
			
			return Bindings.new_LDKThirtyTwoBytes(array: instance.channel_keys_id())
		}

		func sign_counterparty_commitmentCallback(pointer: UnsafeRawPointer?, commitment_txPointer: UnsafePointer<LDKCommitmentTransaction>, preimages: LDKCVec_PaymentPreimageZ) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_counterparty_commitment")
			let commitment_tx = CommitmentTransaction(pointer: commitment_txPointer.pointee).dangle().clone();

			return instance.sign_counterparty_commitment(commitment_tx: commitment_tx, preimages: Bindings.LDKCVec_PaymentPreimageZ_to_array(nativeType: preimages)).cOpaqueStruct!
		}

		func validate_counterparty_revocationCallback(pointer: UnsafeRawPointer?, idx: UInt64, secretPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?) -> LDKCResult_NoneNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::validate_counterparty_revocation")
			
								var secret: [UInt8]? = nil
								if let secretUnwrapped = secretPointer {
									secret = Bindings.tuple32_to_array(nativeType: secretUnwrapped.pointee)
								}
							
			return instance.validate_counterparty_revocation(idx: idx, secret: secret).cOpaqueStruct!
		}

		func sign_holder_commitment_and_htlcsCallback(pointer: UnsafeRawPointer?, commitment_txPointer: UnsafePointer<LDKHolderCommitmentTransaction>) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_holder_commitment_and_htlcs")
			let commitment_tx = HolderCommitmentTransaction(pointer: commitment_txPointer.pointee).dangle().clone();

			return instance.sign_holder_commitment_and_htlcs(commitment_tx: commitment_tx).cOpaqueStruct!
		}

		func sign_justice_revoked_outputCallback(pointer: UnsafeRawPointer?, justice_tx: LDKTransaction, input: uintptr_t, amount: UInt64, per_commitment_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_justice_revoked_output")
			
								var per_commitment_key: [UInt8]? = nil
								if let per_commitment_keyUnwrapped = per_commitment_keyPointer {
									per_commitment_key = Bindings.tuple32_to_array(nativeType: per_commitment_keyUnwrapped.pointee)
								}
							
			return instance.sign_justice_revoked_output(justice_tx: Bindings.LDKTransaction_to_array(nativeType: justice_tx), input: input, amount: amount, per_commitment_key: per_commitment_key).cOpaqueStruct!
		}

		func sign_justice_revoked_htlcCallback(pointer: UnsafeRawPointer?, justice_tx: LDKTransaction, input: uintptr_t, amount: UInt64, per_commitment_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_justice_revoked_htlc")
			
								var per_commitment_key: [UInt8]? = nil
								if let per_commitment_keyUnwrapped = per_commitment_keyPointer {
									per_commitment_key = Bindings.tuple32_to_array(nativeType: per_commitment_keyUnwrapped.pointee)
								}
							let htlc = HTLCOutputInCommitment(pointer: htlcPointer.pointee).dangle().clone();

			return instance.sign_justice_revoked_htlc(justice_tx: Bindings.LDKTransaction_to_array(nativeType: justice_tx), input: input, amount: amount, per_commitment_key: per_commitment_key, htlc: htlc).cOpaqueStruct!
		}

		func sign_counterparty_htlc_transactionCallback(pointer: UnsafeRawPointer?, htlc_tx: LDKTransaction, input: uintptr_t, amount: UInt64, per_commitment_point: LDKPublicKey, htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_counterparty_htlc_transaction")
			let htlc = HTLCOutputInCommitment(pointer: htlcPointer.pointee).dangle().clone();

			return instance.sign_counterparty_htlc_transaction(htlc_tx: Bindings.LDKTransaction_to_array(nativeType: htlc_tx), input: input, amount: amount, per_commitment_point: Bindings.tuple33_to_array(nativeType: per_commitment_point.compressed_form), htlc: htlc).cOpaqueStruct!
		}

		func sign_closing_transactionCallback(pointer: UnsafeRawPointer?, closing_txPointer: UnsafePointer<LDKClosingTransaction>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_closing_transaction")
			let closing_tx = ClosingTransaction(pointer: closing_txPointer.pointee).dangle().clone();

			return instance.sign_closing_transaction(closing_tx: closing_tx).cOpaqueStruct!
		}

		func sign_channel_announcementCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) -> LDKCResult_C2Tuple_SignatureSignatureZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_channel_announcement")
			let msg = UnsignedChannelAnnouncement(pointer: msgPointer.pointee).dangle().clone();

			return instance.sign_channel_announcement(msg: msg).cOpaqueStruct!
		}

		func ready_channelCallback(pointer: UnsafeMutableRawPointer?, channel_parametersPointer: UnsafePointer<LDKChannelTransactionParameters>) -> Void {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::ready_channel")
			let channel_parameters = ChannelTransactionParameters(pointer: channel_parametersPointer.pointee).dangle().clone();

			return instance.ready_channel(channel_parameters: channel_parameters)
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKBaseSign(this_arg: Bindings.instanceToPointer(instance: self), 
			get_per_commitment_point: get_per_commitment_pointCallback,
			release_commitment_secret: release_commitment_secretCallback,
			validate_holder_commitment: validate_holder_commitmentCallback,
			pubkeys: LDKChannelPublicKeys(),
			set_pubkeys: nil,
			channel_keys_id: channel_keys_idCallback,
			sign_counterparty_commitment: sign_counterparty_commitmentCallback,
			validate_counterparty_revocation: validate_counterparty_revocationCallback,
			sign_holder_commitment_and_htlcs: sign_holder_commitment_and_htlcsCallback,
			sign_justice_revoked_output: sign_justice_revoked_outputCallback,
			sign_justice_revoked_htlc: sign_justice_revoked_htlcCallback,
			sign_counterparty_htlc_transaction: sign_counterparty_htlc_transactionCallback,
			sign_closing_transaction: sign_closing_transactionCallback,
			sign_channel_announcement: sign_channel_announcementCallback,
			ready_channel: ready_channelCallback,
			free: freeCallback)

    }

    public init(pointer: LDKBaseSign){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKBaseSign, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> BaseSign {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BaseSign \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing BaseSign \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func get_per_commitment_point(idx: UInt64) -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("BaseSign::get_per_commitment_point should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func release_commitment_secret(idx: UInt64) -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("BaseSign::release_commitment_secret should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func validate_holder_commitment(holder_tx: HolderCommitmentTransaction, preimages: [[UInt8]]) -> Result_NoneNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::validate_holder_commitment should be overridden!", severity: .WARNING)

return Result_NoneNoneZ()
    }

    open func channel_keys_id() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("BaseSign::channel_keys_id should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func sign_counterparty_commitment(commitment_tx: CommitmentTransaction, preimages: [[UInt8]]) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_counterparty_commitment should be overridden!", severity: .WARNING)

return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ()
    }

    open func validate_counterparty_revocation(idx: UInt64, secret: [UInt8]?) -> Result_NoneNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::validate_counterparty_revocation should be overridden!", severity: .WARNING)

return Result_NoneNoneZ()
    }

    open func sign_holder_commitment_and_htlcs(commitment_tx: HolderCommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_holder_commitment_and_htlcs should be overridden!", severity: .WARNING)

return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ()
    }

    open func sign_justice_revoked_output(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_justice_revoked_output should be overridden!", severity: .WARNING)

return Result_SignatureNoneZ()
    }

    open func sign_justice_revoked_htlc(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?, htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_justice_revoked_htlc should be overridden!", severity: .WARNING)

return Result_SignatureNoneZ()
    }

    open func sign_counterparty_htlc_transaction(htlc_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_point: [UInt8], htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_counterparty_htlc_transaction should be overridden!", severity: .WARNING)

return Result_SignatureNoneZ()
    }

    open func sign_closing_transaction(closing_tx: ClosingTransaction) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_closing_transaction should be overridden!", severity: .WARNING)

return Result_SignatureNoneZ()
    }

    open func sign_channel_announcement(msg: UnsignedChannelAnnouncement) -> Result_C2Tuple_SignatureSignatureZNoneZ {
    	/* EDIT ME */
		Bindings.print("BaseSign::sign_channel_announcement should be overridden!", severity: .WARNING)

return Result_C2Tuple_SignatureSignatureZNoneZ()
    }

    open func ready_channel(channel_parameters: ChannelTransactionParameters) -> Void {
    	/* EDIT ME */
		Bindings.print("BaseSign::ready_channel should be overridden!", severity: .WARNING)


    }

    open func free() -> Void {
    	/* EDIT ME */
		
					Bindings.print("Deactivating BaseSign \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedBaseSign: BaseSign {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_per_commitment_point(idx: UInt64) -> [UInt8] {
		
				
				return 
				Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.get_per_commitment_point(self.cOpaqueStruct!.this_arg, idx))
				
			
	}

	public override func release_commitment_secret(idx: UInt64) -> [UInt8] {
		
				
				return 
				Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.release_commitment_secret(self.cOpaqueStruct!.this_arg, idx))
				
			
	}

	public override func validate_holder_commitment(holder_tx: HolderCommitmentTransaction, preimages: [[UInt8]]) -> Result_NoneNoneZ {
		
				
						let preimagesWrapper = Bindings.new_LDKCVec_PaymentPreimageZWrapper(array: preimages)
						defer {
							preimagesWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: holder_tx.cOpaqueStruct!) { (holder_txPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in

				Result_NoneNoneZ(pointer: self.cOpaqueStruct!.validate_holder_commitment(self.cOpaqueStruct!.this_arg, holder_txPointer, preimagesWrapper.dangle().cOpaqueStruct!))
				
}
			
	}

	public override func channel_keys_id() -> [UInt8] {
		
				
				return 
				Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.channel_keys_id(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func sign_counterparty_commitment(commitment_tx: CommitmentTransaction, preimages: [[UInt8]]) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
		
				
						let preimagesWrapper = Bindings.new_LDKCVec_PaymentPreimageZWrapper(array: preimages)
						defer {
							preimagesWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: commitment_tx.cOpaqueStruct!) { (commitment_txPointer: UnsafePointer<LDKCommitmentTransaction>) in

				Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: self.cOpaqueStruct!.sign_counterparty_commitment(self.cOpaqueStruct!.this_arg, commitment_txPointer, preimagesWrapper.dangle().cOpaqueStruct!))
				
}
			
	}

	public override func validate_counterparty_revocation(idx: UInt64, secret: [UInt8]?) -> Result_NoneNoneZ {
		
				
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: secret!)) { (secretPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_NoneNoneZ(pointer: self.cOpaqueStruct!.validate_counterparty_revocation(self.cOpaqueStruct!.this_arg, idx, secretPointer))
				
}
			
	}

	public override func sign_holder_commitment_and_htlcs(commitment_tx: HolderCommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
		
				
				return withUnsafePointer(to: commitment_tx.cOpaqueStruct!) { (commitment_txPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in

				Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: self.cOpaqueStruct!.sign_holder_commitment_and_htlcs(self.cOpaqueStruct!.this_arg, commitment_txPointer))
				
}
			
	}

	public override func sign_justice_revoked_output(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?) -> Result_SignatureNoneZ {
		
				
						let justice_txWrapper = Bindings.new_LDKTransactionWrapper(array: justice_tx)
						defer {
							justice_txWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: per_commitment_key!)) { (per_commitment_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_justice_revoked_output(self.cOpaqueStruct!.this_arg, justice_txWrapper.dangle().cOpaqueStruct!, input, amount, per_commitment_keyPointer))
				
}
			
	}

	public override func sign_justice_revoked_htlc(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?, htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
		
				
						let justice_txWrapper = Bindings.new_LDKTransactionWrapper(array: justice_tx)
						defer {
							justice_txWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: per_commitment_key!)) { (per_commitment_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_justice_revoked_htlc(self.cOpaqueStruct!.this_arg, justice_txWrapper.dangle().cOpaqueStruct!, input, amount, per_commitment_keyPointer, htlcPointer))
				
}
}
			
	}

	public override func sign_counterparty_htlc_transaction(htlc_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_point: [UInt8], htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
		
				
						let htlc_txWrapper = Bindings.new_LDKTransactionWrapper(array: htlc_tx)
						defer {
							htlc_txWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_counterparty_htlc_transaction(self.cOpaqueStruct!.this_arg, htlc_txWrapper.dangle().cOpaqueStruct!, input, amount, Bindings.new_LDKPublicKey(array: per_commitment_point), htlcPointer))
				
}
			
	}

	public override func sign_closing_transaction(closing_tx: ClosingTransaction) -> Result_SignatureNoneZ {
		
				
				return withUnsafePointer(to: closing_tx.cOpaqueStruct!) { (closing_txPointer: UnsafePointer<LDKClosingTransaction>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_closing_transaction(self.cOpaqueStruct!.this_arg, closing_txPointer))
				
}
			
	}

	public override func sign_channel_announcement(msg: UnsignedChannelAnnouncement) -> Result_C2Tuple_SignatureSignatureZNoneZ {
		
				
				return withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in

				Result_C2Tuple_SignatureSignatureZNoneZ(pointer: self.cOpaqueStruct!.sign_channel_announcement(self.cOpaqueStruct!.this_arg, msgPointer))
				
}
			
	}

	public override func ready_channel(channel_parameters: ChannelTransactionParameters) -> Void {
		
				
				withUnsafePointer(to: channel_parameters.cOpaqueStruct!) { (channel_parametersPointer: UnsafePointer<LDKChannelTransactionParameters>) in

				self.cOpaqueStruct!.ready_channel(self.cOpaqueStruct!.this_arg, channel_parametersPointer)
				
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
