import Foundation

open class Score: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKScore?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func channel_penalty_msatCallback(pointer: UnsafeRawPointer?, short_channel_id: UInt64) -> UInt64 {
			let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::channel_penalty_msat")
			
			return instance.channel_penalty_msat(short_channel_id: short_channel_id)
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKScore(this_arg: Bindings.instanceToPointer(instance: self), 
			channel_penalty_msat: channel_penalty_msatCallback,
			free: freeCallback)

    }

    public init(pointer: LDKScore){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKScore, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Score {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Score \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Score \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func channel_penalty_msat(short_channel_id: UInt64) -> UInt64 {
    	/* EDIT ME */
		Bindings.print("Score::channel_penalty_msat should be overridden!", severity: .WARNING)

return 0
    }

    open func free() -> Void {
    	/* EDIT ME */
		Bindings.print("Score::free should be overridden!", severity: .WARNING)


    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedScore: Score {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func channel_penalty_msat(short_channel_id: UInt64) -> UInt64 {
		
				
				return 
				self.cOpaqueStruct!.channel_penalty_msat(self.cOpaqueStruct!.this_arg, short_channel_id)
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
