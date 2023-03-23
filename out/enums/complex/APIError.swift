
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias APIError = Bindings.APIError

			extension Bindings {

				/// Indicates an error on the client's part (usually some variant of attempting to use too-low or
				/// too-high values)
				public class APIError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKAPIError?

					internal init(cType: LDKAPIError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKAPIError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum APIErrorType {
						
						/// Indicates the API was wholly misused (see err for more). Cases where these can be returned
						/// are documented, but generally indicates some precondition of a function was violated.
						case APIMisuseError
			
						/// Due to a high feerate, we were unable to complete the request.
						/// For example, this may be returned if the feerate implies we cannot open a channel at the
						/// requested value, but opening a larger channel would succeed.
						case FeeRateTooHigh
			
						/// A malformed Route was provided (eg overflowed value, node id mismatch, overly-looped route,
						/// too-many-hops, etc).
						case InvalidRoute
			
						/// We were unable to complete the request as the Channel required to do so is unable to
						/// complete the request (or was not found). This can take many forms, including disconnected
						/// peer, channel at capacity, channel shutting down, etc.
						case ChannelUnavailable
			
						/// An attempt to call [`chain::Watch::watch_channel`]/[`chain::Watch::update_channel`]
						/// returned a [`ChannelMonitorUpdateStatus::InProgress`] indicating the persistence of a
						/// monitor update is awaiting async resolution. Once it resolves the attempted action should
						/// complete automatically.
						/// 
						/// [`chain::Watch::watch_channel`]: crate::chain::Watch::watch_channel
						/// [`chain::Watch::update_channel`]: crate::chain::Watch::update_channel
						/// [`ChannelMonitorUpdateStatus::InProgress`]: crate::chain::ChannelMonitorUpdateStatus::InProgress
						case MonitorUpdateInProgress
			
						/// [`SignerProvider::get_shutdown_scriptpubkey`] returned a shutdown scriptpubkey incompatible
						/// with the channel counterparty as negotiated in [`InitFeatures`].
						/// 
						/// Using a SegWit v0 script should resolve this issue. If you cannot, you won't be able to open
						/// a channel or cooperatively close one with this peer (and will have to force-close instead).
						/// 
						/// [`SignerProvider::get_shutdown_scriptpubkey`]: crate::chain::keysinterface::SignerProvider::get_shutdown_scriptpubkey
						/// [`InitFeatures`]: crate::ln::features::InitFeatures
						case IncompatibleShutdownScript
			
					}

					public func getValueType() -> APIErrorType {
						switch self.cType!.tag {
							case LDKAPIError_APIMisuseError:
								return .APIMisuseError
			
							case LDKAPIError_FeeRateTooHigh:
								return .FeeRateTooHigh
			
							case LDKAPIError_InvalidRoute:
								return .InvalidRoute
			
							case LDKAPIError_ChannelUnavailable:
								return .ChannelUnavailable
			
							case LDKAPIError_MonitorUpdateInProgress:
								return .MonitorUpdateInProgress
			
							case LDKAPIError_IncompatibleShutdownScript:
								return .IncompatibleShutdownScript
			
							default:
								Bindings.print("Error: Invalid value type for APIError! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the APIError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the APIError
					internal func clone() -> APIError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAPIError>) in
				APIError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new APIMisuseError-variant APIError
					public class func initWithApimisuseError(err: String) -> APIError {
						// native call variable prep
						
						let errPrimitiveWrapper = Str(value: err).dangle()
				

						// native method call
						let nativeCallResult = APIError_apimisuse_error(errPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						errPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new FeeRateTooHigh-variant APIError
					public class func initWithFeeRateTooHigh(err: String, feerate: UInt32) -> APIError {
						// native call variable prep
						
						let errPrimitiveWrapper = Str(value: err).dangle()
				

						// native method call
						let nativeCallResult = APIError_fee_rate_too_high(errPrimitiveWrapper.cType!, feerate)

						// cleanup
						
						// for elided types, we need this
						errPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new InvalidRoute-variant APIError
					public class func initWithInvalidRoute(err: String) -> APIError {
						// native call variable prep
						
						let errPrimitiveWrapper = Str(value: err).dangle()
				

						// native method call
						let nativeCallResult = APIError_invalid_route(errPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						errPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelUnavailable-variant APIError
					public class func initWithChannelUnavailable(err: String) -> APIError {
						// native call variable prep
						
						let errPrimitiveWrapper = Str(value: err).dangle()
				

						// native method call
						let nativeCallResult = APIError_channel_unavailable(errPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						errPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new MonitorUpdateInProgress-variant APIError
					public class func initWithMonitorUpdateInProgress() -> APIError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_monitor_update_in_progress()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new IncompatibleShutdownScript-variant APIError
					public class func initWithIncompatibleShutdownScript(script: Bindings.ShutdownScript) -> APIError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = APIError_incompatible_shutdown_script(script.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = APIError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two APIErrors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: APIError, b: APIError) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKAPIError>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKAPIError>) in
				APIError_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the APIError object into a byte array which can be read by APIError_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAPIError>) in
				APIError_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a APIError from a byte array, created by APIError_write
					public class func read(ser: [UInt8]) -> Result_COption_APIErrorZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = APIError_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_APIErrorZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					public func getValueAsApiMisuseError() -> APIMisuseError? {
						if self.cType?.tag != LDKAPIError_APIMisuseError {
							return nil
						}

						return APIError_LDKAPIMisuseError_Body(cType: self.cType!.api_misuse_error, anchor: self)
					}
			
					public func getValueAsFeeRateTooHigh() -> FeeRateTooHigh? {
						if self.cType?.tag != LDKAPIError_FeeRateTooHigh {
							return nil
						}

						return APIError_LDKFeeRateTooHigh_Body(cType: self.cType!.fee_rate_too_high, anchor: self)
					}
			
					public func getValueAsInvalidRoute() -> InvalidRoute? {
						if self.cType?.tag != LDKAPIError_InvalidRoute {
							return nil
						}

						return APIError_LDKInvalidRoute_Body(cType: self.cType!.invalid_route, anchor: self)
					}
			
					public func getValueAsChannelUnavailable() -> ChannelUnavailable? {
						if self.cType?.tag != LDKAPIError_ChannelUnavailable {
							return nil
						}

						return APIError_LDKChannelUnavailable_Body(cType: self.cType!.channel_unavailable, anchor: self)
					}
			
					public func getValueAsIncompatibleShutdownScript() -> IncompatibleShutdownScript? {
						if self.cType?.tag != LDKAPIError_IncompatibleShutdownScript {
							return nil
						}

						return APIError_LDKIncompatibleShutdownScript_Body(cType: self.cType!.incompatible_shutdown_script, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> APIError {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> APIError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing APIError \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing APIError \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias APIError_LDKAPIMisuseError_Body = APIMisuseError
			

					/// 
					public class APIMisuseError: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKAPIMisuseError_Body?

						internal init(cType: LDKAPIError_LDKAPIMisuseError_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKAPIError_LDKAPIMisuseError_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(cType: self.cType!.err, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> APIMisuseError {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias APIError_LDKFeeRateTooHigh_Body = FeeRateTooHigh
			

					/// 
					public class FeeRateTooHigh: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKFeeRateTooHigh_Body?

						internal init(cType: LDKAPIError_LDKFeeRateTooHigh_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKAPIError_LDKFeeRateTooHigh_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(cType: self.cType!.err, anchor: self).getValue()

							return returnValue;
						}
		
						/// The feerate which was too high.
						public func getFeerate() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.feerate

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> FeeRateTooHigh {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias APIError_LDKInvalidRoute_Body = InvalidRoute
			

					/// 
					public class InvalidRoute: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKInvalidRoute_Body?

						internal init(cType: LDKAPIError_LDKInvalidRoute_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKAPIError_LDKInvalidRoute_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(cType: self.cType!.err, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> InvalidRoute {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias APIError_LDKChannelUnavailable_Body = ChannelUnavailable
			

					/// 
					public class ChannelUnavailable: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKChannelUnavailable_Body?

						internal init(cType: LDKAPIError_LDKChannelUnavailable_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKAPIError_LDKChannelUnavailable_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A human-readable error message
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(cType: self.cType!.err, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ChannelUnavailable {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias APIError_LDKIncompatibleShutdownScript_Body = IncompatibleShutdownScript
			

					/// 
					public class IncompatibleShutdownScript: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKAPIError_LDKIncompatibleShutdownScript_Body?

						internal init(cType: LDKAPIError_LDKIncompatibleShutdownScript_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKAPIError_LDKIncompatibleShutdownScript_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The incompatible shutdown script.
						public func getScript() -> Bindings.ShutdownScript {
							// return value (do some wrapping)
							let returnValue = Bindings.ShutdownScript(cType: self.cType!.script, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> IncompatibleShutdownScript {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		