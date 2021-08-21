import LDKHeaders

open class BaseSign: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public var cOpaqueStruct: LDKBaseSign?

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

		func channel_keys_idCallback(pointer: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::channel_keys_id")
			
			return Bindings.new_LDKThirtyTwoBytes(array: instance.channel_keys_id())
		}

		func sign_counterparty_commitmentCallback(pointer: UnsafeRawPointer?, commitment_txPointer: UnsafePointer<LDKCommitmentTransaction>) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_counterparty_commitment")
			let commitment_tx = CommitmentTransaction(pointer: commitment_txPointer.pointee);

			return instance.sign_counterparty_commitment(commitment_tx: commitment_tx).cOpaqueStruct!
		}

		func sign_holder_commitment_and_htlcsCallback(pointer: UnsafeRawPointer?, commitment_txPointer: UnsafePointer<LDKHolderCommitmentTransaction>) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_holder_commitment_and_htlcs")
			let commitment_tx = HolderCommitmentTransaction(pointer: commitment_txPointer.pointee);

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
							let htlc = HTLCOutputInCommitment(pointer: htlcPointer.pointee);

			return instance.sign_justice_revoked_htlc(justice_tx: Bindings.LDKTransaction_to_array(nativeType: justice_tx), input: input, amount: amount, per_commitment_key: per_commitment_key, htlc: htlc).cOpaqueStruct!
		}

		func sign_counterparty_htlc_transactionCallback(pointer: UnsafeRawPointer?, htlc_tx: LDKTransaction, input: uintptr_t, amount: UInt64, per_commitment_point: LDKPublicKey, htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_counterparty_htlc_transaction")
			let htlc = HTLCOutputInCommitment(pointer: htlcPointer.pointee);

			return instance.sign_counterparty_htlc_transaction(htlc_tx: Bindings.LDKTransaction_to_array(nativeType: htlc_tx), input: input, amount: amount, per_commitment_point: Bindings.tuple33_to_array(nativeType: per_commitment_point.compressed_form), htlc: htlc).cOpaqueStruct!
		}

		func sign_closing_transactionCallback(pointer: UnsafeRawPointer?, closing_tx: LDKTransaction) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_closing_transaction")
			
			return instance.sign_closing_transaction(closing_tx: Bindings.LDKTransaction_to_array(nativeType: closing_tx)).cOpaqueStruct!
		}

		func sign_channel_announcementCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::sign_channel_announcement")
			let msg = UnsignedChannelAnnouncement(pointer: msgPointer.pointee);

			return instance.sign_channel_announcement(msg: msg).cOpaqueStruct!
		}

		func ready_channelCallback(pointer: UnsafeMutableRawPointer?, channel_parametersPointer: UnsafePointer<LDKChannelTransactionParameters>) -> Void {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::ready_channel")
			let channel_parameters = ChannelTransactionParameters(pointer: channel_parametersPointer.pointee);

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
			pubkeys: LDKChannelPublicKeys(),
			set_pubkeys: nil,
			channel_keys_id: channel_keys_idCallback,
			sign_counterparty_commitment: sign_counterparty_commitmentCallback,
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
							print("Freeing BaseSign \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing BaseSign \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func get_per_commitment_point(idx: UInt64) -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func release_commitment_secret(idx: UInt64) -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func channel_keys_id() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func sign_counterparty_commitment(commitment_tx: CommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	/* EDIT ME */
		return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ())
    }

    open func sign_holder_commitment_and_htlcs(commitment_tx: HolderCommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	/* EDIT ME */
		return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ())
    }

    open func sign_justice_revoked_output(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    open func sign_justice_revoked_htlc(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?, htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    open func sign_counterparty_htlc_transaction(htlc_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_point: [UInt8], htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    open func sign_closing_transaction(closing_tx: [UInt8]) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    open func sign_channel_announcement(msg: UnsignedChannelAnnouncement) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    open func ready_channel(channel_parameters: ChannelTransactionParameters) -> Void {
    	/* EDIT ME */
		
    }

    open func free() -> Void {
    	/* EDIT ME */
		
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

	public override func channel_keys_id() -> [UInt8] {
		
				
				return 
				Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.channel_keys_id(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func sign_counterparty_commitment(commitment_tx: CommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
		
				
				return withUnsafePointer(to: commitment_tx.cOpaqueStruct!) { (commitment_txPointer: UnsafePointer<LDKCommitmentTransaction>) in

				Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: self.cOpaqueStruct!.sign_counterparty_commitment(self.cOpaqueStruct!.this_arg, commitment_txPointer))
				
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

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_justice_revoked_output(self.cOpaqueStruct!.this_arg, justice_txWrapper.cOpaqueStruct!, input, amount, per_commitment_keyPointer))
				
}
			
	}

	public override func sign_justice_revoked_htlc(justice_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_key: [UInt8]?, htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
		
				
						let justice_txWrapper = Bindings.new_LDKTransactionWrapper(array: justice_tx)
						defer {
							justice_txWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: Bindings.array_to_tuple32(array: per_commitment_key!)) { (per_commitment_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_justice_revoked_htlc(self.cOpaqueStruct!.this_arg, justice_txWrapper.cOpaqueStruct!, input, amount, per_commitment_keyPointer, htlcPointer))
				
}
}
			
	}

	public override func sign_counterparty_htlc_transaction(htlc_tx: [UInt8], input: UInt, amount: UInt64, per_commitment_point: [UInt8], htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
		
				
						let htlc_txWrapper = Bindings.new_LDKTransactionWrapper(array: htlc_tx)
						defer {
							htlc_txWrapper.noOpRetain()
						}
					
				return withUnsafePointer(to: htlc.cOpaqueStruct!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_counterparty_htlc_transaction(self.cOpaqueStruct!.this_arg, htlc_txWrapper.cOpaqueStruct!, input, amount, Bindings.new_LDKPublicKey(array: per_commitment_point), htlcPointer))
				
}
			
	}

	public override func sign_closing_transaction(closing_tx: [UInt8]) -> Result_SignatureNoneZ {
		
				
						let closing_txWrapper = Bindings.new_LDKTransactionWrapper(array: closing_tx)
						defer {
							closing_txWrapper.noOpRetain()
						}
					
				return 
				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_closing_transaction(self.cOpaqueStruct!.this_arg, closing_txWrapper.cOpaqueStruct!))
				
			
	}

	public override func sign_channel_announcement(msg: UnsignedChannelAnnouncement) -> Result_SignatureNoneZ {
		
				
				return withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in

				Result_SignatureNoneZ(pointer: self.cOpaqueStruct!.sign_channel_announcement(self.cOpaqueStruct!.this_arg, msgPointer))
				
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
