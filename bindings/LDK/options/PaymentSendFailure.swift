public class PaymentSendFailure: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPaymentSendFailure?

	

    public init(pointer: LDKPaymentSendFailure){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPaymentSendFailure, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
						return APIError(pointer: self.cOpaqueStruct!.parameter_error, anchor: self)
					}
				
					public func getValueAsPathParameterError() -> [Result_NoneAPIErrorZ]? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_PathParameterError {
							return nil
						}
						return Bindings.LDKCVec_CResult_NoneAPIErrorZZ_to_array(nativeType: self.cOpaqueStruct!.path_parameter_error, deallocate: false)
						
						.map { (cOpaqueStruct) in
							Result_NoneAPIErrorZ(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
					public func getValueAsAllFailedRetrySafe() -> [APIError]? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_AllFailedRetrySafe {
							return nil
						}
						return Bindings.LDKCVec_APIErrorZ_to_array(nativeType: self.cOpaqueStruct!.all_failed_retry_safe, deallocate: false)
						
						.map { (cOpaqueStruct) in
							APIError(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
					public func getValueAsPartialFailure() -> PartialFailure? {
						if self.cOpaqueStruct?.tag != LDKPaymentSendFailure_PartialFailure {
							return nil
						}
						return PartialFailure(pointer: self.cOpaqueStruct!.partial_failure, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return PaymentSendFailure_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PaymentSendFailure {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PaymentSendFailure \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PaymentSendFailure \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> PaymentSendFailure {
    	
        return PaymentSendFailure(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentSendFailure>) in
PaymentSendFailure_clone(origPointer)
});
    }

					internal func danglingClone() -> PaymentSendFailure {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func parameter_error(a: APIError) -> PaymentSendFailure {
    	
        return PaymentSendFailure(pointer: PaymentSendFailure_parameter_error(a.danglingClone().cOpaqueStruct!));
    }

    public class func path_parameter_error(a: [Result_NoneAPIErrorZ]) -> PaymentSendFailure {
    	
							let aUnwrapped = a.map { (aCurrentValue) in
							aCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let aWrapper = Bindings.new_LDKCVec_CResult_NoneAPIErrorZZWrapper(array: aUnwrapped)
						defer {
							aWrapper.noOpRetain()
						}
					
        return PaymentSendFailure(pointer: PaymentSendFailure_path_parameter_error(aWrapper.dangle().cOpaqueStruct!));
    }

    public class func all_failed_retry_safe(a: [APIError]) -> PaymentSendFailure {
    	
							let aUnwrapped = a.map { (aCurrentValue) in
							aCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let aWrapper = Bindings.new_LDKCVec_APIErrorZWrapper(array: aUnwrapped)
						defer {
							aWrapper.noOpRetain()
						}
					
        return PaymentSendFailure(pointer: PaymentSendFailure_all_failed_retry_safe(aWrapper.dangle().cOpaqueStruct!));
    }

    public class func partial_failure(results: [Result_NoneAPIErrorZ], failed_paths_retry: RouteParameters, payment_id: [UInt8]) -> PaymentSendFailure {
    	
							let resultsUnwrapped = results.map { (resultsCurrentValue) in
							resultsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let resultsWrapper = Bindings.new_LDKCVec_CResult_NoneAPIErrorZZWrapper(array: resultsUnwrapped)
						defer {
							resultsWrapper.noOpRetain()
						}
					
        return PaymentSendFailure(pointer: PaymentSendFailure_partial_failure(resultsWrapper.dangle().cOpaqueStruct!, failed_paths_retry.danglingClone().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: payment_id)));
    }

    /* OPTION_METHODS_END */

	

			public class PartialFailure: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKPaymentSendFailure_LDKPartialFailure_Body?;
				fileprivate init(pointer: LDKPaymentSendFailure_LDKPartialFailure_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKPaymentSendFailure_LDKPartialFailure_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getResults() -> [Result_NoneAPIErrorZ] {
						return Bindings.LDKCVec_CResult_NoneAPIErrorZZ_to_array(nativeType: self.cOpaqueStruct!.results, deallocate: false)
						
						.map { (cOpaqueStruct) in
							Result_NoneAPIErrorZ(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
					public func getFailed_paths_retry() -> RouteParameters {
						return RouteParameters(pointer: self.cOpaqueStruct!.failed_paths_retry, anchor: self)
					}
				
					public func getPayment_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_id)
					}
				
				
			}
		
}
