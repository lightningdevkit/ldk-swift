#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias KeysInterface = Bindings.KeysInterface

extension Bindings {

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

			func get_node_idCallback(pointer: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_PublicKeyNoneZ {
				let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::get_node_id")
				
				return instance.get_node_id(recipient: recipient).cOpaqueStruct!
			}

			func ecdhCallback(pointer: UnsafeRawPointer?, recipient: LDKRecipient, other_key: LDKPublicKey, tweak: LDKCOption_ScalarZ) -> LDKCResult_SharedSecretNoneZ {
				let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "KeysInterface.swift::ecdh")
				
				return instance.ecdh(recipient: recipient, other_key: Bindings.tuple33_to_array(nativeType: other_key.compressed_form), tweak: Option_ScalarZ(pointer: tweak)).cOpaqueStruct!
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
				
				return instance.sign_invoice(hrp_bytes: Bindings.LDKu8slice_to_array(nativeType: hrp_bytes), invoice_data: Bindings.LDKCVec_u5Z_to_array(nativeType: invoice_data, callerContext: "KeysInterface::init::sign_invoiceCallback"), receipient: receipient).cOpaqueStruct!
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
			get_node_id: get_node_idCallback,
			ecdh: ecdhCallback,
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
		
					Bindings.print("Error: KeysInterface::get_node_secret MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_node_id(recipient: LDKRecipient) -> Result_PublicKeyNoneZ {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::get_node_id MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func ecdh(recipient: LDKRecipient, other_key: [UInt8], tweak: Option_ScalarZ) -> Result_SharedSecretNoneZ {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::ecdh MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_destination_script() -> [UInt8] {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::get_destination_script MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_shutdown_scriptpubkey() -> ShutdownScript {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::get_shutdown_scriptpubkey MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_channel_signer(inbound: Bool, channel_value_satoshis: UInt64) -> Sign {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::get_channel_signer MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_secure_random_bytes() -> [UInt8] {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::get_secure_random_bytes MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func read_chan_signer(reader: [UInt8]) -> Result_SignDecodeErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::read_chan_signer MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func sign_invoice(hrp_bytes: [UInt8], invoice_data: [UInt8], receipient: LDKRecipient) -> Result_RecoverableSignatureNoneZ {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::sign_invoice MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_inbound_payment_key_material() -> [UInt8] {
			/* EDIT ME */
		
					Bindings.print("Error: KeysInterface::get_inbound_payment_key_material MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating KeysInterface \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedKeysInterface: KeysInterface {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_node_secret(recipient: LDKRecipient) -> Result_SecretKeyNoneZ {
		
				
				return 
				Result_SecretKeyNoneZ(pointer: self.cOpaqueStruct!.get_node_secret(self.cOpaqueStruct!.this_arg, recipient))
				
			
	}

	public override func get_node_id(recipient: LDKRecipient) -> Result_PublicKeyNoneZ {
		
				
				return 
				Result_PublicKeyNoneZ(pointer: self.cOpaqueStruct!.get_node_id(self.cOpaqueStruct!.this_arg, recipient))
				
			
	}

	public override func ecdh(recipient: LDKRecipient, other_key: [UInt8], tweak: Option_ScalarZ) -> Result_SharedSecretNoneZ {
		
				
				return 
				Result_SharedSecretNoneZ(pointer: self.cOpaqueStruct!.ecdh(self.cOpaqueStruct!.this_arg, recipient, Bindings.new_LDKPublicKey(array: other_key), tweak.cOpaqueStruct!))
				
			
	}

	public override func get_destination_script() -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.get_destination_script(self.cOpaqueStruct!.this_arg), callerContext: "KeysInterface::NativelyImplementedKeysInterface::get_destination_script")
				
			
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
