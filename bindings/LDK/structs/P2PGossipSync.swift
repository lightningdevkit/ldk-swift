#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class P2PGossipSync: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKP2PGossipSync?


	/* DEFAULT_CONSTRUCTOR_START */
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(network_graph: NetworkGraph, chain_access: Option_AccessZ, logger: Logger) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
P2PGossipSync_new(network_graphPointer, chain_access.cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
        super.init(conflictAvoidingVariableName: 0)
        try? self.addAnchor(anchor: network_graph)
try? self.addAnchor(anchor: chain_access)
try? self.addAnchor(anchor: logger)

    }
    /* DEFAULT_CONSTRUCTOR_END */

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKP2PGossipSync){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKP2PGossipSync, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func add_chain_access(chain_access: Option_AccessZ) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKP2PGossipSync>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return P2PGossipSync_add_chain_access(this_argPointer, chain_access.cOpaqueStruct!);
    }

    public func as_RoutingMessageHandler() -> NativelyImplementedRoutingMessageHandler {
    	
        return NativelyImplementedRoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKP2PGossipSync>) in
P2PGossipSync_as_RoutingMessageHandler(this_argPointer)
}, anchor: self);
    }

    public func as_MessageSendEventsProvider() -> NativelyImplementedMessageSendEventsProvider {
    	
        return NativelyImplementedMessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKP2PGossipSync>) in
P2PGossipSync_as_MessageSendEventsProvider(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return P2PGossipSync_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> P2PGossipSync {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing P2PGossipSync \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing P2PGossipSync \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
