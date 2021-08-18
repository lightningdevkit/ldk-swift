public class APIError {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKAPIError?;

	

    public init(pointer: LDKAPIError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum APIErrorValueType {
					case APIMisuseError, FeeRateTooHigh, RouteError, ChannelUnavailable
				}
				
				public func getValueType() -> APIErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKAPIError_APIMisuseError:
						return .APIMisuseError
					case LDKAPIError_FeeRateTooHigh:
						return .FeeRateTooHigh
					case LDKAPIError_RouteError:
						return .RouteError
					case LDKAPIError_ChannelUnavailable:
						return .ChannelUnavailable
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsAPIMisuseError() -> APIMisuseError? {
						if self.cOpaqueStruct?.tag != LDKAPIError_APIMisuseError {
							return nil
						}
						return APIMisuseError(pointer: self.cOpaqueStruct!.api_misuse_error)
					}
				
					public func getValueAsFeeRateTooHigh() -> FeeRateTooHigh? {
						if self.cOpaqueStruct?.tag != LDKAPIError_FeeRateTooHigh {
							return nil
						}
						return FeeRateTooHigh(pointer: self.cOpaqueStruct!.fee_rate_too_high)
					}
				
					public func getValueAsRouteError() -> RouteError? {
						if self.cOpaqueStruct?.tag != LDKAPIError_RouteError {
							return nil
						}
						return RouteError(pointer: self.cOpaqueStruct!.route_error)
					}
				
					public func getValueAsChannelUnavailable() -> ChannelUnavailable? {
						if self.cOpaqueStruct?.tag != LDKAPIError_ChannelUnavailable {
							return nil
						}
						return ChannelUnavailable(pointer: self.cOpaqueStruct!.channel_unavailable)
					}
				
			
    public func free() -> Void {
    	
        return APIError_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> APIError {
    	
        return APIError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKAPIError>) in
APIError_clone(origPointer)
});
    }

    /* OPTION_METHODS_END */

	

			public class APIMisuseError {
				
				
				var cOpaqueStruct: LDKAPIError_LDKAPIMisuseError_Body?;
				fileprivate init(pointer: LDKAPIError_LDKAPIMisuseError_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err)
					}
				
				
			}
		

			public class FeeRateTooHigh {
				
				
				var cOpaqueStruct: LDKAPIError_LDKFeeRateTooHigh_Body?;
				fileprivate init(pointer: LDKAPIError_LDKFeeRateTooHigh_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err)
					}
				
					public func getFeerate() -> UInt32 {
						return self.cOpaqueStruct!.feerate
					}
				
				
			}
		

			public class RouteError {
				
				
				var cOpaqueStruct: LDKAPIError_LDKRouteError_Body?;
				fileprivate init(pointer: LDKAPIError_LDKRouteError_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err)
					}
				
				
			}
		

			public class ChannelUnavailable {
				
				
				var cOpaqueStruct: LDKAPIError_LDKChannelUnavailable_Body?;
				fileprivate init(pointer: LDKAPIError_LDKChannelUnavailable_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err)
					}
				
				
			}
		
}
