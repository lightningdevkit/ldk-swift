public class Result_GossipTimestampFilterDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_GossipTimestampFilterDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_GossipTimestampFilterDecodeErrorZ(contents: LDKCResult_GossipTimestampFilterDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_GossipTimestampFilterDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> GossipTimestampFilter? {
				if self.cOpaqueStruct?.result_ok == true {
					return GossipTimestampFilter(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: GossipTimestampFilter) -> Result_GossipTimestampFilterDecodeErrorZ {
    	
        return Result_GossipTimestampFilterDecodeErrorZ(pointer: CResult_GossipTimestampFilterDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_GossipTimestampFilterDecodeErrorZ {
    	
        return Result_GossipTimestampFilterDecodeErrorZ(pointer: CResult_GossipTimestampFilterDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_GossipTimestampFilterDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_GossipTimestampFilterDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_GossipTimestampFilterDecodeErrorZ {
    	
        return Result_GossipTimestampFilterDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_GossipTimestampFilterDecodeErrorZ>) in
CResult_GossipTimestampFilterDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_GossipTimestampFilterDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
