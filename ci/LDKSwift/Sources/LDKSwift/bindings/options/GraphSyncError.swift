#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class GraphSyncError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKGraphSyncError?

	

    public init(pointer: LDKGraphSyncError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKGraphSyncError, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum GraphSyncErrorValueType {
					case DecodeError, LightningError
				}
				
				public func getValueType() -> GraphSyncErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKGraphSyncError_DecodeError:
						return .DecodeError
					case LDKGraphSyncError_LightningError:
						return .LightningError
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsDecodeError() -> DecodeError? {
						if self.cOpaqueStruct?.tag != LDKGraphSyncError_DecodeError {
							return nil
						}
						return DecodeError(pointer: self.cOpaqueStruct!.decode_error, anchor: self)
					}
				
					public func getValueAsLightningError() -> LightningError? {
						if self.cOpaqueStruct?.tag != LDKGraphSyncError_LightningError {
							return nil
						}
						return LightningError(pointer: self.cOpaqueStruct!.lightning_error, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return GraphSyncError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> GraphSyncError {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing GraphSyncError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing GraphSyncError \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> GraphSyncError {
    	
        return GraphSyncError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKGraphSyncError>) in
GraphSyncError_clone(origPointer)
});
    }

					internal func danglingClone() -> GraphSyncError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func decode_error(a: DecodeError) -> GraphSyncError {
    	
        return GraphSyncError(pointer: GraphSyncError_decode_error(a.danglingClone().cOpaqueStruct!));
    }

    public class func lightning_error(a: LightningError) -> GraphSyncError {
    	
        return GraphSyncError(pointer: GraphSyncError_lightning_error(a.danglingClone().cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
