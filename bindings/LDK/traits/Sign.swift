open class Sign {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKSign?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Sign.swift::write")
			
			return Bindings.new_LDKCVec_u8ZWrapper(array: instance.write()).cOpaqueStruct!
		}

		func cloneCallback(pointer: UnsafeRawPointer?) -> UnsafeMutableRawPointer? {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Sign.swift::clone")
			
			
					let clone = instance.danglingClone()
					let clonePointer: UnsafeMutableRawPointer? = UnsafeMutableRawPointer(&clone.cOpaqueStruct)
					return clonePointer
				
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Sign.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKSign(this_arg: Bindings.instanceToPointer(instance: self), 
			BaseSign: LDKBaseSign(),
			BaseSign_clone: nil,
			write: writeCallback,
			clone: cloneCallback,
			free: freeCallback)
    }

    public init(pointer: LDKSign){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKSign, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */


				public func clone() -> Sign {
					
					return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSign>) in

					Sign(pointer: Sign_clone(origPointer))
					
}
				}
			

					internal func danglingClone() -> Sign {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				



					internal func dangle() -> Sign {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Sign \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Sign \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func write() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }



    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedSign: Sign {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func write() -> [UInt8] {
		
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.write(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
