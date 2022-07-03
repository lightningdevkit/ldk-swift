#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Record: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRecord?


	

    public init(pointer: LDKRecord){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRecord, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_level() -> LDKLevel {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRecord>) in
Record_get_level(this_ptrPointer)
};
    }

    public func set_level(val: LDKLevel) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRecord>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Record_set_level(this_ptrPointer, val);
    }

    public func get_args() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRecord>) in
Record_get_args(this_ptrPointer)
});
    }

    public func set_args(val: String) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRecord>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Record_set_args(this_ptrPointer, Bindings.new_LDKStr(string: val, chars_is_owned: true));
    }

    public func get_module_path() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRecord>) in
Record_get_module_path(this_ptrPointer)
});
    }

    public func set_module_path(val: String) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRecord>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Record_set_module_path(this_ptrPointer, Bindings.new_LDKStr(string: val, chars_is_owned: true));
    }

    public func get_file() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRecord>) in
Record_get_file(this_ptrPointer)
});
    }

    public func set_file(val: String) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRecord>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Record_set_file(this_ptrPointer, Bindings.new_LDKStr(string: val, chars_is_owned: true));
    }

    public func get_line() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRecord>) in
Record_get_line(this_ptrPointer)
};
    }

    public func set_line(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRecord>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Record_set_line(this_ptrPointer, val);
    }

    public func clone() -> Record {
    	
        return Record(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRecord>) in
Record_clone(origPointer)
});
    }

					internal func danglingClone() -> Record {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return Record_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Record {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Record \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Record \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
