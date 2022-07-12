#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

open class KeysInterface: NativeTraitWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKKeysInterface?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func get_node_secretCallback(pointer: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_SecretKeyNoneZ {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_node_secret")
			
			return instance.get_node_secret(recipient: recipient).cOpaqueStruct!
		}

		func get_destination_scriptCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_destination_script")
			
			
					let returnWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: instance.get_destination_script())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func get_shutdown_scriptpubkeyCallback(pointer: UnsafeRawPointer?) -> LDKShutdownScript {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_shutdown_scriptpubkey")
			
			return instance.get_shutdown_scriptpubkey().cOpaqueStruct!
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

		func sign_invoiceCallback(pointer: UnsafeRawPointer?, hrp_bytes: LDKu8slice, invoice_data: LDKCVec_u5Z, receipient: LDKRecipient) -> LDKCResult_RecoverableSignatureNoneZ {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::sign_invoice")
			
			return instance.sign_invoice(hrp_bytes: Bindings.LDKu8slice_to_array(nativeType: hrp_bytes), invoice_data: Bindings.LDKCVec_u5Z_to_array(nativeType: invoice_data), receipient: receipient).cOpaqueStruct!
		}

		func get_inbound_payment_key_materialCallback(pointer: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_inbound_payment_key_material")
			
			return Bindings.new_LDKThirtyTwoBytes(array: instance.get_inbound_payment_key_material())
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKKeysInterface(this_arg: Bindings.instanceToPointer(instance: self), 
			get_node_secret: get_node_secretCallback,
			get_destination_script: get_destination_scriptCallback,
			get_shutdown_scriptpubkey: get_shutdown_scriptpubkeyCallback,
			get_channel_signer: get_channel_signerCallback,
			get_secure_random_bytes: get_secure_random_bytesCallback,
			read_chan_signer: read_chan_signerCallback,
			sign_invoice: sign_invoiceCallback,
			get_inbound_payment_key_material: get_inbound_payment_key_materialCallback,
			free: freeCallback)

    }

    public init(pointer: LDKKeysInterface){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKKeysInterface, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> KeysInterface {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing KeysInterface \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing KeysInterface \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func get_node_secret(recipient: LDKRecipient) -> Result_SecretKeyNoneZ {
    	/* EDIT ME */
		Bindings.print("KeysInterface::get_node_secret should be overridden!", severity: .WARNING)

return Result_SecretKeyNoneZ()
    }

    open func get_destination_script() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("KeysInterface::get_destination_script should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func get_shutdown_scriptpubkey() -> ShutdownScript {
    	/* EDIT ME */
		Bindings.print("KeysInterface::get_shutdown_scriptpubkey MUST be overridden!", severity: .ERROR)

abort()
    }

    open func get_channel_signer(inbound: Bool, channel_value_satoshis: UInt64) -> Sign {
    	/* EDIT ME */
		Bindings.print("KeysInterface::get_channel_signer should be overridden!", severity: .WARNING)

return Sign()
    }

    open func get_secure_random_bytes() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("KeysInterface::get_secure_random_bytes should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func read_chan_signer(reader: [UInt8]) -> Result_SignDecodeErrorZ {
    	/* EDIT ME */
		Bindings.print("KeysInterface::read_chan_signer should be overridden!", severity: .WARNING)

return Result_SignDecodeErrorZ()
    }

    open func sign_invoice(hrp_bytes: [UInt8], invoice_data: [UInt8], receipient: LDKRecipient) -> Result_RecoverableSignatureNoneZ {
    	/* EDIT ME */
		Bindings.print("KeysInterface::sign_invoice should be overridden!", severity: .WARNING)

return Result_RecoverableSignatureNoneZ()
    }

    open func get_inbound_payment_key_material() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("KeysInterface::get_inbound_payment_key_material should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
					Bindings.print("Deactivating KeysInterface \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedKeysInterface: KeysInterface {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_node_secret(recipient: LDKRecipient) -> Result_SecretKeyNoneZ {
		
				
				return 
				Result_SecretKeyNoneZ(pointer: self.cOpaqueStruct!.get_node_secret(self.cOpaqueStruct!.this_arg, recipient))
				
			
	}

	public override func get_destination_script() -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.get_destination_script(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func get_shutdown_scriptpubkey() -> ShutdownScript {
		
				
				return 
				ShutdownScript(pointer: self.cOpaqueStruct!.get_shutdown_scriptpubkey(self.cOpaqueStruct!.this_arg))
				
			
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
		
				
						let readerWrapper = Bindings.new_LDKu8sliceWrapper(array: reader)
						defer {
							readerWrapper.noOpRetain()
						}
					
				return 
				Result_SignDecodeErrorZ(pointer: self.cOpaqueStruct!.read_chan_signer(self.cOpaqueStruct!.this_arg, readerWrapper.cOpaqueStruct!))
				
			
	}

	public override func sign_invoice(hrp_bytes: [UInt8], invoice_data: [UInt8], receipient: LDKRecipient) -> Result_RecoverableSignatureNoneZ {
		
				
						let hrp_bytesWrapper = Bindings.new_LDKu8sliceWrapper(array: hrp_bytes)
						defer {
							hrp_bytesWrapper.noOpRetain()
						}
					
						let invoice_dataWrapper = Bindings.new_LDKCVec_u5ZWrapper(array: invoice_data)
						defer {
							invoice_dataWrapper.noOpRetain()
						}
					
				return 
				Result_RecoverableSignatureNoneZ(pointer: self.cOpaqueStruct!.sign_invoice(self.cOpaqueStruct!.this_arg, hrp_bytesWrapper.cOpaqueStruct!, invoice_dataWrapper.dangle().cOpaqueStruct!, receipient))
				
			
	}

	public override func get_inbound_payment_key_material() -> [UInt8] {
		
				
				return 
				Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.get_inbound_payment_key_material(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
