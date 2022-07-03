#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Init: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKInit?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(features_arg: InitFeatures, remote_network_address_arg: Option_NetAddressZ) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Init_new(features_arg.danglingClone().cOpaqueStruct!, remote_network_address_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInit){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKInit, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> InitFeatures {
    	
        return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInit>) in
Init_get_features(this_ptrPointer)
});
    }

    public func set_features(val: InitFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInit>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Init_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_remote_network_address() -> Option_NetAddressZ {
    	
        return Option_NetAddressZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInit>) in
Init_get_remote_network_address(this_ptrPointer)
});
    }

    public func set_remote_network_address(val: Option_NetAddressZ) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInit>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Init_set_remote_network_address(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> Init {
    	
        return Init(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInit>) in
Init_clone(origPointer)
});
    }

					internal func danglingClone() -> Init {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInit>) in
Init_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_InitDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_InitDecodeErrorZ(pointer: Init_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Init_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Init {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Init \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Init \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
