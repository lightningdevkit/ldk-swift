import LDKHeaders

public class PaymentSendFailure {

    public internal(set) var cOpaqueStruct: LDKPaymentSendFailure?;

	

    public init(pointer: LDKPaymentSendFailure){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum PaymentSendFailureValueType {
					case ParameterError, PathParameterError, AllFailedRetrySafe, PartialFailure
				}
				
				public func getValueType() -> PaymentSendFailureValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKPaymentSendFailure_ParameterError:
						return .ParameterError
					case LDKPaymentSendFailure_PathParameterError:
						return .PathParameterError
					case LDKPaymentSendFailure_AllFailedRetrySafe:
						return .AllFailedRetrySafe
					case LDKPaymentSendFailure_PartialFailure:
						return .PartialFailure
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsParameterError() -> APIError? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_ParameterError {
							return nil
						}
						return APIError(pointer: self.cOpaqueStruct!.parameter_error)
					}
				
					public func getValueAsPathParameterError() -> [LDKCResult_NoneAPIErrorZ]? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_PathParameterError {
							return nil
						}
						return Bindings.LDKCVec_CResult_NoneAPIErrorZZ_to_array(nativeType: self.cOpaqueStruct!.path_parameter_error)
					}
				
					public func getValueAsAllFailedRetrySafe() -> [LDKAPIError]? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_AllFailedRetrySafe {
							return nil
						}
						return Bindings.LDKCVec_APIErrorZ_to_array(nativeType: self.cOpaqueStruct!.all_failed_retry_safe)
					}
				
					public func getValueAsPartialFailure() -> [LDKCResult_NoneAPIErrorZ]? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_PartialFailure {
							return nil
						}
						return Bindings.LDKCVec_CResult_NoneAPIErrorZZ_to_array(nativeType: self.cOpaqueStruct!.partial_failure)
					}
				
			
    public func free() -> Void {
    	
        return PaymentSendFailure_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> PaymentSendFailure {
    	
        return PaymentSendFailure(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentSendFailure>) in
PaymentSendFailure_clone(origPointer)
});
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
