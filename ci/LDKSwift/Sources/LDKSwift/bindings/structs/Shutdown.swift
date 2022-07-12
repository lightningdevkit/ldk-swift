#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Shutdown: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKShutdown?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], scriptpubkey_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let scriptpubkey_argWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: scriptpubkey_arg)
						defer {
							scriptpubkey_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = Shutdown_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), scriptpubkey_argWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKShutdown){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKShutdown, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKShutdown>) in
Shutdown_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKShutdown>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Shutdown_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_scriptpubkey() -> [UInt8] {
    	
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKShutdown>) in
Shutdown_get_scriptpubkey(this_ptrPointer)
});
    }

    public func set_scriptpubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKShutdown>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return Shutdown_set_scriptpubkey(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> Shutdown {
    	
        return Shutdown(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKShutdown>) in
Shutdown_clone(origPointer)
});
    }

					internal func danglingClone() -> Shutdown {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKShutdown>) in
Shutdown_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ShutdownDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ShutdownDecodeErrorZ(pointer: Shutdown_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Shutdown_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Shutdown {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Shutdown \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Shutdown \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
