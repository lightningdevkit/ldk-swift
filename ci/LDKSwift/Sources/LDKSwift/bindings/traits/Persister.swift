#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias Persister = Bindings.Persister

extension Bindings {

	open class Persister: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKPersister?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func persist_managerCallback(pointer: UnsafeRawPointer?, channel_managerPointer: UnsafePointer<LDKChannelManager>) -> LDKCResult_NoneErrorZ {
				let instance: Persister = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persister.swift::persist_manager")
				let channel_manager = ChannelManager(pointer: channel_managerPointer.pointee).dangle();

				return instance.persist_manager(channel_manager: channel_manager).cOpaqueStruct!
			}

			func persist_graphCallback(pointer: UnsafeRawPointer?, network_graphPointer: UnsafePointer<LDKNetworkGraph>) -> LDKCResult_NoneErrorZ {
				let instance: Persister = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persister.swift::persist_graph")
				let network_graph = NetworkGraph(pointer: network_graphPointer.pointee).dangle();

				return instance.persist_graph(network_graph: network_graph).cOpaqueStruct!
			}

			func persist_scorerCallback(pointer: UnsafeRawPointer?, scorerPointer: UnsafePointer<LDKWriteableScore>) -> LDKCResult_NoneErrorZ {
				let instance: Persister = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persister.swift::persist_scorer")
				let scorer = WriteableScore(pointer: scorerPointer.pointee).dangle();

				return instance.persist_scorer(scorer: scorer).cOpaqueStruct!
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: Persister = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persister.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKPersister(this_arg: Bindings.instanceToPointer(instance: self), 
			persist_manager: persist_managerCallback,
			persist_graph: persist_graphCallback,
			persist_scorer: persist_scorerCallback,
			free: freeCallback)

		}

		public init(pointer: LDKPersister){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKPersister, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> Persister {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Persister \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing Persister \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
			/* EDIT ME */
		Bindings.print("Persister::persist_manager MUST be overridden!", severity: .ERROR)

abort()
		}

		open func persist_graph(network_graph: NetworkGraph) -> Result_NoneErrorZ {
			/* EDIT ME */
		Bindings.print("Persister::persist_graph MUST be overridden!", severity: .ERROR)

abort()
		}

		open func persist_scorer(scorer: WriteableScore) -> Result_NoneErrorZ {
			/* EDIT ME */
		Bindings.print("Persister::persist_scorer MUST be overridden!", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating Persister \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedPersister: Persister {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
		
				
				return withUnsafePointer(to: channel_manager.cOpaqueStruct!) { (channel_managerPointer: UnsafePointer<LDKChannelManager>) in

				Result_NoneErrorZ(pointer: self.cOpaqueStruct!.persist_manager(self.cOpaqueStruct!.this_arg, channel_managerPointer))
				
}
			
	}

	public override func persist_graph(network_graph: NetworkGraph) -> Result_NoneErrorZ {
		
				
				return withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in

				Result_NoneErrorZ(pointer: self.cOpaqueStruct!.persist_graph(self.cOpaqueStruct!.this_arg, network_graphPointer))
				
}
			
	}

	public override func persist_scorer(scorer: WriteableScore) -> Result_NoneErrorZ {
		
				
				return withUnsafePointer(to: scorer.activateOnce().cOpaqueStruct!) { (scorerPointer: UnsafePointer<LDKWriteableScore>) in

				Result_NoneErrorZ(pointer: self.cOpaqueStruct!.persist_scorer(self.cOpaqueStruct!.this_arg, scorerPointer))
				
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
