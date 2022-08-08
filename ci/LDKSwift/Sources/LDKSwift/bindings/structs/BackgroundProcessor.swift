#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias BackgroundProcessor = Bindings.BackgroundProcessor

extension Bindings {

	public class BackgroundProcessor: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBackgroundProcessor?


		/* DEFAULT_CONSTRUCTOR_START */
		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(persister: Persister, event_handler: EventHandler, chain_monitor: ChainMonitor, channel_manager: ChannelManager, gossip_sync: GossipSync, peer_manager: PeerManager, logger: Logger, scorer: MultiThreadedLockableScore?) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
let nativeScorer = scorer?.cOpaqueStruct! ?? LDKMultiThreadedLockableScore(inner: nil, is_owned: true)

			self.cOpaqueStruct = withUnsafePointer(to: chain_monitor.cOpaqueStruct!) { (chain_monitorPointer: UnsafePointer<LDKChainMonitor>) in
withUnsafePointer(to: channel_manager.cOpaqueStruct!) { (channel_managerPointer: UnsafePointer<LDKChannelManager>) in
withUnsafePointer(to: peer_manager.cOpaqueStruct!) { (peer_managerPointer: UnsafePointer<LDKPeerManager>) in
BackgroundProcessor_start(persister.activate().cOpaqueStruct!, event_handler.activate().cOpaqueStruct!, chain_monitorPointer, channel_managerPointer, gossip_sync.cOpaqueStruct!, peer_managerPointer, logger.activate().cOpaqueStruct!, nativeScorer)
}
}
}
			super.init(conflictAvoidingVariableName: 0)
			try? self.addAnchor(anchor: persister)
try? self.addAnchor(anchor: event_handler)
try? self.addAnchor(anchor: chain_monitor)
try? self.addAnchor(anchor: channel_manager)
try? self.addAnchor(anchor: gossip_sync)
try? self.addAnchor(anchor: peer_manager)
try? self.addAnchor(anchor: logger)

					if let certainScorer = scorer {
						try? self.addAnchor(anchor: certainScorer)
					}
				

		}
		/* DEFAULT_CONSTRUCTOR_END */

		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKBackgroundProcessor){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKBackgroundProcessor, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func join() -> Result_NoneErrorZ {
			
			return Result_NoneErrorZ(pointer: BackgroundProcessor_join(self.cOpaqueStruct!));
		}

		public func stop() -> Result_NoneErrorZ {
			
			return Result_NoneErrorZ(pointer: BackgroundProcessor_stop(self.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return BackgroundProcessor_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> BackgroundProcessor {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BackgroundProcessor \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BackgroundProcessor \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
