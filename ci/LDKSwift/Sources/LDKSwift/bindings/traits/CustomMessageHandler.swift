#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias CustomMessageHandler = Bindings.CustomMessageHandler

extension Bindings {

	open class CustomMessageHandler: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCustomMessageHandler?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func handle_custom_messageCallback(pointer: UnsafeRawPointer?, msg: LDKType, sender_node_id: LDKPublicKey) -> LDKCResult_NoneLightningErrorZ {
				let instance: CustomMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomMessageHandler.swift::handle_custom_message")
				
				return instance.handle_custom_message(msg: BindingsType(pointer: msg), sender_node_id: Bindings.tuple33_to_array(nativeType: sender_node_id.compressed_form)).cOpaqueStruct!
			}

			func get_and_clear_pending_msgCallback(pointer: UnsafeRawPointer?) -> LDKCVec_C2Tuple_PublicKeyTypeZZ {
				let instance: CustomMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomMessageHandler.swift::get_and_clear_pending_msg")
				
				
					let returnWrapper = Bindings.new_LDKCVec_C2Tuple_PublicKeyTypeZZWrapper(array: instance.get_and_clear_pending_msg())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: CustomMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomMessageHandler.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKCustomMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_custom_message: handle_custom_messageCallback,
			get_and_clear_pending_msg: get_and_clear_pending_msgCallback,
			CustomMessageReader: LDKCustomMessageReader(),
			free: freeCallback)

		}

		public init(pointer: LDKCustomMessageHandler){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCustomMessageHandler, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> CustomMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomMessageHandler \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing CustomMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func handle_custom_message(msg: BindingsType, sender_node_id: [UInt8]) -> Result_NoneLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: CustomMessageHandler::handle_custom_message MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_and_clear_pending_msg() -> [LDKC2Tuple_PublicKeyTypeZ] {
			/* EDIT ME */
		
					Bindings.print("Error: CustomMessageHandler::get_and_clear_pending_msg MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating CustomMessageHandler \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedCustomMessageHandler: CustomMessageHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_custom_message(msg: BindingsType, sender_node_id: [UInt8]) -> Result_NoneLightningErrorZ {
		
				
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_custom_message(self.cOpaqueStruct!.this_arg, msg.danglingClone().cOpaqueStruct!, Bindings.new_LDKPublicKey(array: sender_node_id)))
				
			
	}

	public override func get_and_clear_pending_msg() -> [LDKC2Tuple_PublicKeyTypeZ] {
		
				
				return 
				Bindings.LDKCVec_C2Tuple_PublicKeyTypeZZ_to_array(nativeType: self.cOpaqueStruct!.get_and_clear_pending_msg(self.cOpaqueStruct!.this_arg), callerContext: "CustomMessageHandler::NativelyImplementedCustomMessageHandler::get_and_clear_pending_msg")
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
