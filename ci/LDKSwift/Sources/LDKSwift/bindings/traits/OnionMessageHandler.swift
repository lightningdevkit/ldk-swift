#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias OnionMessageHandler = Bindings.OnionMessageHandler

extension Bindings {

	open class OnionMessageHandler: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKOnionMessageHandler?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func handle_onion_messageCallback(pointer: UnsafeRawPointer?, peer_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKOnionMessage>) -> Void {
				let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageHandler.swift::handle_onion_message")
				let msg = OnionMessage(pointer: msgPointer.pointee).dangle().clone();

				return instance.handle_onion_message(peer_node_id: Bindings.tuple33_to_array(nativeType: peer_node_id.compressed_form), msg: msg)
			}

			func peer_connectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, initValuePointer: UnsafePointer<LDKInit>) -> Void {
				let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageHandler.swift::peer_connected")
				let initValue = Init(pointer: initValuePointer.pointee).dangle().clone();

				return instance.peer_connected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), initValue: initValue)
			}

			func peer_disconnectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
				let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageHandler.swift::peer_disconnected")
				
				return instance.peer_disconnected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), no_connection_possible: no_connection_possible)
			}

			func provided_node_featuresCallback(pointer: UnsafeRawPointer?) -> LDKNodeFeatures {
				let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageHandler.swift::provided_node_features")
				
				return instance.provided_node_features().cOpaqueStruct!
			}

			func provided_init_featuresCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> LDKInitFeatures {
				let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageHandler.swift::provided_init_features")
				
				return instance.provided_init_features(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form)).cOpaqueStruct!
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageHandler.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKOnionMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_onion_message: handle_onion_messageCallback,
			peer_connected: peer_connectedCallback,
			peer_disconnected: peer_disconnectedCallback,
			provided_node_features: provided_node_featuresCallback,
			provided_init_features: provided_init_featuresCallback,
			OnionMessageProvider: LDKOnionMessageProvider(),
			free: freeCallback)

		}

		public init(pointer: LDKOnionMessageHandler){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKOnionMessageHandler, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> OnionMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing OnionMessageHandler \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing OnionMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func handle_onion_message(peer_node_id: [UInt8], msg: OnionMessage) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: OnionMessageHandler::handle_onion_message MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func peer_connected(their_node_id: [UInt8], initValue: Init) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: OnionMessageHandler::peer_connected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func peer_disconnected(their_node_id: [UInt8], no_connection_possible: Bool) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: OnionMessageHandler::peer_disconnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func provided_node_features() -> NodeFeatures {
			/* EDIT ME */
		
					Bindings.print("Error: OnionMessageHandler::provided_node_features MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func provided_init_features(their_node_id: [UInt8]) -> InitFeatures {
			/* EDIT ME */
		
					Bindings.print("Error: OnionMessageHandler::provided_init_features MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating OnionMessageHandler \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedOnionMessageHandler: OnionMessageHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_onion_message(peer_node_id: [UInt8], msg: OnionMessage) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKOnionMessage>) in

				self.cOpaqueStruct!.handle_onion_message(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: peer_node_id), msgPointer)
				
}
			
	}

	public override func peer_connected(their_node_id: [UInt8], initValue: Init) -> Void {
		
				
				withUnsafePointer(to: initValue.cOpaqueStruct!) { (initPointer: UnsafePointer<LDKInit>) in

				self.cOpaqueStruct!.peer_connected(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), initPointer)
				
}
			
	}

	public override func peer_disconnected(their_node_id: [UInt8], no_connection_possible: Bool) -> Void {
		
				
				
				self.cOpaqueStruct!.peer_disconnected(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), no_connection_possible)
				
			
	}

	public override func provided_node_features() -> NodeFeatures {
		
				
				return 
				NodeFeatures(pointer: self.cOpaqueStruct!.provided_node_features(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func provided_init_features(their_node_id: [UInt8]) -> InitFeatures {
		
				
				return 
				InitFeatures(pointer: self.cOpaqueStruct!.provided_init_features(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id)))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
