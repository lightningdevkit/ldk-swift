open class Type: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKType?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func type_idCallback(pointer: UnsafeRawPointer?) -> UInt16 {
			let instance: Type = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Type.swift::type_id")
			
			return instance.type_id()
		}

		func debug_strCallback(pointer: UnsafeRawPointer?) -> String {
			let instance: Type = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Type.swift::debug_str")
			
			return instance.debug_str()
		}

		func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: Type = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Type.swift::write")
			
			
					let returnWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: instance.write())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Type = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Type.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKType(this_arg: Bindings.instanceToPointer(instance: self), 
			type_id: type_idCallback,
			debug_str: debug_strCallback,
			write: writeCallback,
			cloned: nil,
			free: freeCallback)

    }

    public init(pointer: LDKType){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKType, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */


				public func clone() -> Type {
					
					return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKType>) in

					Type(pointer: Type_clone(origPointer))
					
}
				}
			

					internal func danglingClone() -> Type {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				



					internal func dangle() -> Type {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Type \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Type \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func type_id() -> UInt16 {
    	/* EDIT ME */
		Bindings.print("Type::type_id should be overridden!", severity: .WARNING)

return 0
    }

    open func debug_str() -> String {
    	/* EDIT ME */
		Bindings.print("Type::debug_str should be overridden!", severity: .WARNING)


    }

    open func write() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("Type::write should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		Bindings.print("Type::free should be overridden!", severity: .WARNING)


    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedType: Type {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func type_id() -> UInt16 {
		
				
				return 
				self.cOpaqueStruct!.type_id(self.cOpaqueStruct!.this_arg)
				
			
	}

	public override func debug_str() -> String {
		
				
				return 
				Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.debug_str(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func write() -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.write(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
