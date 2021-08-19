open class KeysInterface {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKKeysInterface?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func get_node_secretCallback(pointer: UnsafeRawPointer?) -> LDKSecretKey {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_node_secret")
			
			return Bindings.new_LDKSecretKey(array: instance.get_node_secret())
		}

		func get_destination_scriptCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_destination_script")
			
			return Bindings.new_LDKCVec_u8ZWrapper(array: instance.get_destination_script()).cOpaqueStruct!
		}

		func get_shutdown_pubkeyCallback(pointer: UnsafeRawPointer?) -> LDKPublicKey {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_shutdown_pubkey")
			
			return Bindings.new_LDKPublicKey(array: instance.get_shutdown_pubkey())
		}

		func get_channel_signerCallback(pointer: UnsafeRawPointer?, inbound: Bool, channel_value_satoshis: UInt64) -> LDKSign {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_channel_signer")
			
			return instance.get_channel_signer(inbound: inbound, channel_value_satoshis: channel_value_satoshis).cOpaqueStruct!
		}

		func get_secure_random_bytesCallback(pointer: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_secure_random_bytes")
			
			return Bindings.new_LDKThirtyTwoBytes(array: instance.get_secure_random_bytes())
		}

		func read_chan_signerCallback(pointer: UnsafeRawPointer?, reader: LDKu8slice) -> LDKCResult_SignDecodeErrorZ {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::read_chan_signer")
			
			return instance.read_chan_signer(reader: Bindings.LDKu8slice_to_array(nativeType: reader)).cOpaqueStruct!
		}

		func sign_invoiceCallback(pointer: UnsafeRawPointer?, invoice_preimage: LDKCVec_u8Z) -> LDKCResult_RecoverableSignatureNoneZ {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::sign_invoice")
			
			return instance.sign_invoice(invoice_preimage: Bindings.LDKCVec_u8Z_to_array(nativeType: invoice_preimage)).cOpaqueStruct!
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKKeysInterface(this_arg: Bindings.instanceToPointer(instance: self), 
			get_node_secret: get_node_secretCallback,
			get_destination_script: get_destination_scriptCallback,
			get_shutdown_pubkey: get_shutdown_pubkeyCallback,
			get_channel_signer: get_channel_signerCallback,
			get_secure_random_bytes: get_secure_random_bytesCallback,
			read_chan_signer: read_chan_signerCallback,
			sign_invoice: sign_invoiceCallback,
			free: freeCallback)
    }

    public init(pointer: LDKKeysInterface){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKKeysInterface, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> KeysInterface {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing KeysInterface \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing KeysInterface \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func get_node_secret() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func get_destination_script() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func get_shutdown_pubkey() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func get_channel_signer(inbound: Bool, channel_value_satoshis: UInt64) -> Sign {
    	/* EDIT ME */
		return Sign(pointer: LDKSign())
    }

    open func get_secure_random_bytes() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    open func read_chan_signer(reader: [UInt8]) -> Result_SignDecodeErrorZ {
    	/* EDIT ME */
		return Result_SignDecodeErrorZ(pointer: LDKCResult_SignDecodeErrorZ())
    }

    open func sign_invoice(invoice_preimage: [UInt8]) -> Result_RecoverableSignatureNoneZ {
    	/* EDIT ME */
		return Result_RecoverableSignatureNoneZ(pointer: LDKCResult_RecoverableSignatureNoneZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedKeysInterface: KeysInterface {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_node_secret() -> [UInt8] {
		
				return 
				Bindings.LDKSecretKey_to_array(nativeType: self.cOpaqueStruct!.get_node_secret(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func get_destination_script() -> [UInt8] {
		
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.get_destination_script(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func get_shutdown_pubkey() -> [UInt8] {
		
				return 
				Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.get_shutdown_pubkey(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func get_channel_signer(inbound: Bool, channel_value_satoshis: UInt64) -> Sign {
		
				return 
				Sign(pointer: self.cOpaqueStruct!.get_channel_signer(self.cOpaqueStruct!.this_arg, inbound, channel_value_satoshis))
				
			
	}

	public override func get_secure_random_bytes() -> [UInt8] {
		
				return 
				Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.get_secure_random_bytes(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func read_chan_signer(reader: [UInt8]) -> Result_SignDecodeErrorZ {
		
				return 
				Result_SignDecodeErrorZ(pointer: self.cOpaqueStruct!.read_chan_signer(self.cOpaqueStruct!.this_arg, Bindings.new_LDKu8slice(array: reader)))
				
			
	}

	public override func sign_invoice(invoice_preimage: [UInt8]) -> Result_RecoverableSignatureNoneZ {
		
				return 
				Result_RecoverableSignatureNoneZ(pointer: self.cOpaqueStruct!.sign_invoice(self.cOpaqueStruct!.this_arg, Bindings.new_LDKCVec_u8ZWrapper(array: invoice_preimage).cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
