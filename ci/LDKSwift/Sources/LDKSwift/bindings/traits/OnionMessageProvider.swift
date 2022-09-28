#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias OnionMessageProvider = Bindings.OnionMessageProvider

extension Bindings {

	open class OnionMessageProvider: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKOnionMessageProvider?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func next_onion_message_for_peerCallback(pointer: UnsafeRawPointer?, peer_node_id: LDKPublicKey) -> LDKOnionMessage {
				let instance: OnionMessageProvider = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageProvider.swift::next_onion_message_for_peer")
				
				return instance.next_onion_message_for_peer(peer_node_id: Bindings.tuple33_to_array(nativeType: peer_node_id.compressed_form)).cOpaqueStruct!
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: OnionMessageProvider = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "OnionMessageProvider.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKOnionMessageProvider(this_arg: Bindings.instanceToPointer(instance: self), 
			next_onion_message_for_peer: next_onion_message_for_peerCallback,
			free: freeCallback)

		}

		public init(pointer: LDKOnionMessageProvider){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKOnionMessageProvider, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> OnionMessageProvider {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing OnionMessageProvider \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing OnionMessageProvider \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func next_onion_message_for_peer(peer_node_id: [UInt8]) -> OnionMessage {
			/* EDIT ME */
		Bindings.print("OnionMessageProvider::next_onion_message_for_peer MUST be overridden!", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating OnionMessageProvider \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedOnionMessageProvider: OnionMessageProvider {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func next_onion_message_for_peer(peer_node_id: [UInt8]) -> OnionMessage {
		
				
				return 
				OnionMessage(pointer: self.cOpaqueStruct!.next_onion_message_for_peer(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: peer_node_id)))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
