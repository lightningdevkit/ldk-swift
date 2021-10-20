import Foundation

open class Sign: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKSign?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Sign.swift::write")
			
			
					let returnWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: instance.write())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Sign = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Sign.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKSign(this_arg: Bindings.instanceToPointer(instance: self), 
			BaseSign: LDKBaseSign(),
			write: writeCallback,
			cloned: nil,
			free: freeCallback)

    }

    public init(pointer: LDKSign){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKSign, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
							Bindings.print("Freeing Sign \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Sign \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func write() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("Sign::write should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		Bindings.print("Sign::free should be overridden!", severity: .WARNING)


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
