#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_ChannelMonitorUpdateDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_ChannelMonitorUpdateDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelMonitorUpdateDecodeErrorZ(contents: LDKCResult_ChannelMonitorUpdateDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelMonitorUpdateDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_ChannelMonitorUpdateDecodeErrorZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> ChannelMonitorUpdate? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelMonitorUpdate(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: ChannelMonitorUpdate) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: CResult_ChannelMonitorUpdateDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: CResult_ChannelMonitorUpdateDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ChannelMonitorUpdateDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ChannelMonitorUpdateDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ChannelMonitorUpdateDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ChannelMonitorUpdateDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelMonitorUpdateDecodeErrorZ>) in
CResult_ChannelMonitorUpdateDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_ChannelMonitorUpdateDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
