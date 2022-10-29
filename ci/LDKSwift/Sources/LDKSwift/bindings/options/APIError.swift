#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias APIError = Bindings.APIError

extension Bindings {

	public class APIError: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKAPIError?

		

		public init(pointer: LDKAPIError){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKAPIError, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum APIErrorValueType {
					case APIMisuseError, FeeRateTooHigh, RouteError, ChannelUnavailable, IncompatibleShutdownScript
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
					case LDKAPIError_IncompatibleShutdownScript:
						return .IncompatibleShutdownScript
                    default:
                        return nil
                    }
				}

				
					public func getValueAsAPIMisuseError() -> APIMisuseError? {
						if self.cOpaqueStruct?.tag != LDKAPIError_APIMisuseError {
							return nil
						}
						return APIMisuseError(pointer: self.cOpaqueStruct!.api_misuse_error, anchor: self)
					}
				
					public func getValueAsFeeRateTooHigh() -> FeeRateTooHigh? {
						if self.cOpaqueStruct?.tag != LDKAPIError_FeeRateTooHigh {
							return nil
						}
						return FeeRateTooHigh(pointer: self.cOpaqueStruct!.fee_rate_too_high, anchor: self)
					}
				
					public func getValueAsRouteError() -> RouteError? {
						if self.cOpaqueStruct?.tag != LDKAPIError_RouteError {
							return nil
						}
						return RouteError(pointer: self.cOpaqueStruct!.route_error, anchor: self)
					}
				
					public func getValueAsChannelUnavailable() -> ChannelUnavailable? {
						if self.cOpaqueStruct?.tag != LDKAPIError_ChannelUnavailable {
							return nil
						}
						return ChannelUnavailable(pointer: self.cOpaqueStruct!.channel_unavailable, anchor: self)
					}
				
					public func getValueAsIncompatibleShutdownScript() -> IncompatibleShutdownScript? {
						if self.cOpaqueStruct?.tag != LDKAPIError_IncompatibleShutdownScript {
							return nil
						}
						return IncompatibleShutdownScript(pointer: self.cOpaqueStruct!.incompatible_shutdown_script, anchor: self)
					}
				
			
		internal func free() -> Void {
			
			return APIError_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> APIError {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing APIError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing APIError \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> APIError {
			
			return APIError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKAPIError>) in
APIError_clone(origPointer)
});
		}

					internal func danglingClone() -> APIError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		public class func apimisuse_error(err: String) -> APIError {
			
			return APIError(pointer: APIError_apimisuse_error(Bindings.new_LDKStr(string: err, chars_is_owned: true)));
		}

		public class func fee_rate_too_high(err: String, feerate: UInt32) -> APIError {
			
			return APIError(pointer: APIError_fee_rate_too_high(Bindings.new_LDKStr(string: err, chars_is_owned: true), feerate));
		}

		public class func route_error(err: String) -> APIError {
			
			return APIError(pointer: APIError_route_error(Bindings.new_LDKStr(string: err, chars_is_owned: true)));
		}

		public class func channel_unavailable(err: String) -> APIError {
			
			return APIError(pointer: APIError_channel_unavailable(Bindings.new_LDKStr(string: err, chars_is_owned: true)));
		}

		public class func monitor_update_in_progress() -> APIError {
			
			return APIError(pointer: APIError_monitor_update_in_progress());
		}

		public class func incompatible_shutdown_script(script: Bindings.ShutdownScript) -> APIError {
			
			return APIError(pointer: APIError_incompatible_shutdown_script(script.danglingClone().cOpaqueStruct!));
		}

		public class func eq(a: Bindings.APIError, b: Bindings.APIError) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKAPIError>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKAPIError>) in
APIError_eq(aPointer, bPointer)
}
};
		}

		/* OPTION_METHODS_END */

		

			public class APIMisuseError: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKAPIError_LDKAPIMisuseError_Body?;
				fileprivate init(pointer: LDKAPIError_LDKAPIMisuseError_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKAPIError_LDKAPIMisuseError_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err, callerContext: "APIError::APIMisuseError::getErr", deallocate: false)
					}
				

			}
		

			public class FeeRateTooHigh: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKAPIError_LDKFeeRateTooHigh_Body?;
				fileprivate init(pointer: LDKAPIError_LDKFeeRateTooHigh_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKAPIError_LDKFeeRateTooHigh_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err, callerContext: "APIError::FeeRateTooHigh::getErr", deallocate: false)
					}
				
					public func getFeerate() -> UInt32 {
						return self.cOpaqueStruct!.feerate
					}
				

			}
		

			public class RouteError: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKAPIError_LDKRouteError_Body?;
				fileprivate init(pointer: LDKAPIError_LDKRouteError_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKAPIError_LDKRouteError_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err, callerContext: "APIError::RouteError::getErr", deallocate: false)
					}
				

			}
		

			public class ChannelUnavailable: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKAPIError_LDKChannelUnavailable_Body?;
				fileprivate init(pointer: LDKAPIError_LDKChannelUnavailable_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKAPIError_LDKChannelUnavailable_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getErr() -> String {
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.err, callerContext: "APIError::ChannelUnavailable::getErr", deallocate: false)
					}
				

			}
		

			public class IncompatibleShutdownScript: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKAPIError_LDKIncompatibleShutdownScript_Body?;
				fileprivate init(pointer: LDKAPIError_LDKIncompatibleShutdownScript_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKAPIError_LDKIncompatibleShutdownScript_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getScript() -> Bindings.ShutdownScript {
						return Bindings.ShutdownScript(pointer: self.cOpaqueStruct!.script, anchor: self).dangle()
					}
				

			}
		
	}

}
