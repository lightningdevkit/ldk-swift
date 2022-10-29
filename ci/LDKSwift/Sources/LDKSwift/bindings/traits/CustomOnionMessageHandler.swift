#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias CustomOnionMessageHandler = Bindings.CustomOnionMessageHandler

extension Bindings {

	open class CustomOnionMessageHandler: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCustomOnionMessageHandler?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func handle_custom_messageCallback(pointer: UnsafeRawPointer?, msg: LDKCustomOnionMessageContents) -> Void {
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomOnionMessageHandler.swift::handle_custom_message")
				
				return instance.handle_custom_message(msg: CustomOnionMessageContents(pointer: msg))
			}

			func read_custom_messageCallback(pointer: UnsafeRawPointer?, message_type: UInt64, buffer: LDKu8slice) -> LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ {
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomOnionMessageHandler.swift::read_custom_message")
				
				return instance.read_custom_message(message_type: message_type, buffer: Bindings.LDKu8slice_to_array(nativeType: buffer)).cOpaqueStruct!
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: CustomOnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomOnionMessageHandler.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKCustomOnionMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_custom_message: handle_custom_messageCallback,
			read_custom_message: read_custom_messageCallback,
			free: freeCallback)

		}

		public init(pointer: LDKCustomOnionMessageHandler){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCustomOnionMessageHandler, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> CustomOnionMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomOnionMessageHandler \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing CustomOnionMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func handle_custom_message(msg: CustomOnionMessageContents) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: CustomOnionMessageHandler::handle_custom_message MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func read_custom_message(message_type: UInt64, buffer: [UInt8]) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: CustomOnionMessageHandler::read_custom_message MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating CustomOnionMessageHandler \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedCustomOnionMessageHandler: CustomOnionMessageHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_custom_message(msg: CustomOnionMessageContents) -> Void {
		
				
				
				self.cOpaqueStruct!.handle_custom_message(self.cOpaqueStruct!.this_arg, msg.danglingClone().cOpaqueStruct!)
				
			
	}

	public override func read_custom_message(message_type: UInt64, buffer: [UInt8]) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
		
				
						let bufferWrapper = Bindings.new_LDKu8sliceWrapper(array: buffer)
						defer {
							bufferWrapper.noOpRetain()
						}
					
				return 
				Result_COption_CustomOnionMessageContentsZDecodeErrorZ(pointer: self.cOpaqueStruct!.read_custom_message(self.cOpaqueStruct!.this_arg, message_type, bufferWrapper.cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
