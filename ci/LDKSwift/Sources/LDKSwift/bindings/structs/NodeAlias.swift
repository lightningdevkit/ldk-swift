#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class NodeAlias: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKNodeAlias?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(a_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = NodeAlias_new(Bindings.new_LDKThirtyTwoBytes(array: a_arg))
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAlias){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKNodeAlias, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_a() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAlias>) in
NodeAlias_get_a(this_ptrPointer)
}.pointee);
    }

    public func set_a(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAlias>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAlias_set_a(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func clone() -> NodeAlias {
    	
        return NodeAlias(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeAlias>) in
NodeAlias_clone(origPointer)
});
    }

					internal func danglingClone() -> NodeAlias {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeAlias>) in
NodeAlias_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeAliasDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_NodeAliasDecodeErrorZ(pointer: NodeAlias_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return NodeAlias_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NodeAlias {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeAlias \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeAlias \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
