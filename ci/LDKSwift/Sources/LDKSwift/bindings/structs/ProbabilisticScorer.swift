#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class ProbabilisticScorer: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKProbabilisticScorer?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(params: ProbabilisticScoringParameters, network_graph: NetworkGraph, logger: Logger) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
ProbabilisticScorer_new(params.danglingClone().cOpaqueStruct!, network_graphPointer, logger.activate().cOpaqueStruct!)
}
        super.init(conflictAvoidingVariableName: 0)
        try? self.addAnchor(anchor: network_graph)
try? self.addAnchor(anchor: logger)

    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKProbabilisticScorer){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKProbabilisticScorer, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func debug_log_liquidity_stats() -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKProbabilisticScorer>) in
ProbabilisticScorer_debug_log_liquidity_stats(this_argPointer)
};
    }

    public func estimated_channel_liquidity_range(scid: UInt64, target: NodeId) -> Option_C2Tuple_u64u64ZZ {
    	
        return Option_C2Tuple_u64u64ZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKProbabilisticScorer>) in
withUnsafePointer(to: target.cOpaqueStruct!) { (targetPointer: UnsafePointer<LDKNodeId>) in
ProbabilisticScorer_estimated_channel_liquidity_range(this_argPointer, scid, targetPointer)
}
});
    }

    public func add_banned(node_id: NodeId) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKProbabilisticScorer>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return withUnsafePointer(to: node_id.cOpaqueStruct!) { (node_idPointer: UnsafePointer<LDKNodeId>) in
ProbabilisticScorer_add_banned(this_argPointer, node_idPointer)
};
    }

    public func remove_banned(node_id: NodeId) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKProbabilisticScorer>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return withUnsafePointer(to: node_id.cOpaqueStruct!) { (node_idPointer: UnsafePointer<LDKNodeId>) in
ProbabilisticScorer_remove_banned(this_argPointer, node_idPointer)
};
    }

    public func set_manual_penalty(node_id: NodeId, penalty: UInt64) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKProbabilisticScorer>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return withUnsafePointer(to: node_id.cOpaqueStruct!) { (node_idPointer: UnsafePointer<LDKNodeId>) in
ProbabilisticScorer_set_manual_penalty(this_argPointer, node_idPointer, penalty)
};
    }

    public func remove_manual_penalty(node_id: NodeId) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKProbabilisticScorer>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return withUnsafePointer(to: node_id.cOpaqueStruct!) { (node_idPointer: UnsafePointer<LDKNodeId>) in
ProbabilisticScorer_remove_manual_penalty(this_argPointer, node_idPointer)
};
    }

    public func clear_manual_penalties() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKProbabilisticScorer>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return ProbabilisticScorer_clear_manual_penalties(this_argPointer);
    }

    public func as_Score() -> NativelyImplementedScore {
    	
        return NativelyImplementedScore(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKProbabilisticScorer>) in
ProbabilisticScorer_as_Score(this_argPointer)
}, anchor: self);
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKProbabilisticScorer>) in
ProbabilisticScorer_write(objPointer)
});
    }

    public class func read(ser: [UInt8], arg_a: ProbabilisticScoringParameters, arg_b: NetworkGraph, arg_c: Logger) -> Result_ProbabilisticScorerDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ProbabilisticScorerDecodeErrorZ(pointer: withUnsafePointer(to: arg_b.cOpaqueStruct!) { (arg_bPointer: UnsafePointer<LDKNetworkGraph>) in
ProbabilisticScorer_read(serWrapper.cOpaqueStruct!, arg_a.danglingClone().cOpaqueStruct!, arg_bPointer, arg_c.activate().cOpaqueStruct!)
});
    }

    internal func free() -> Void {
    	
        return ProbabilisticScorer_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ProbabilisticScorer {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ProbabilisticScorer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ProbabilisticScorer \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
