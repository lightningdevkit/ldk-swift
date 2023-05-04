
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias PathFailure = Bindings.PathFailure

			extension Bindings {

				/// When the payment path failure took place and extra details about it. [`PathFailure::OnPath`] may
				/// contain a [`NetworkUpdate`] that needs to be applied to the [`NetworkGraph`].
				/// 
				/// [`NetworkUpdate`]: crate::routing::gossip::NetworkUpdate
				/// [`NetworkGraph`]: crate::routing::gossip::NetworkGraph
				public class PathFailure: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPathFailure?

					internal init(cType: LDKPathFailure, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPathFailure, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum PathFailureType {
						
						/// We failed to initially send the payment and no HTLC was committed to. Contains the relevant
						/// error.
						case InitialSend
			
						/// A hop on the path failed to forward our payment.
						case OnPath
			
					}

					public func getValueType() -> PathFailureType {
						switch self.cType!.tag {
							case LDKPathFailure_InitialSend:
								return .InitialSend
			
							case LDKPathFailure_OnPath:
								return .OnPath
			
							default:
								Bindings.print("Error: Invalid value type for PathFailure! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the PathFailure
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PathFailure_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the PathFailure
					internal func clone() -> PathFailure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPathFailure>) in
				PathFailure_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PathFailure(cType: nativeCallResult, instantiationContext: "PathFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new InitialSend-variant PathFailure
					public class func initWithInitialSend(err: APIError) -> PathFailure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PathFailure_initial_send(err.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PathFailure(cType: nativeCallResult, instantiationContext: "PathFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new OnPath-variant PathFailure
					public class func initWithOnPath(networkUpdate: NetworkUpdate?) -> PathFailure {
						// native call variable prep
						
						let networkUpdateOption = Option_NetworkUpdateZ(some: networkUpdate, instantiationContext: "PathFailure.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = PathFailure_on_path(networkUpdateOption.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PathFailure(cType: nativeCallResult, instantiationContext: "PathFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two PathFailures contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: PathFailure, b: PathFailure) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPathFailure>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPathFailure>) in
				PathFailure_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the PathFailure object into a byte array which can be read by PathFailure_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPathFailure>) in
				PathFailure_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "PathFailure.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a PathFailure from a byte array, created by PathFailure_write
					public class func read(ser: [UInt8]) -> Result_COption_PathFailureZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "PathFailure.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = PathFailure_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_PathFailureZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "PathFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsInitialSend() -> InitialSend? {
						if self.cType?.tag != LDKPathFailure_InitialSend {
							return nil
						}

						return PathFailure_LDKInitialSend_Body(cType: self.cType!.initial_send, instantiationContext: "PathFailure.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsOnPath() -> OnPath? {
						if self.cType?.tag != LDKPathFailure_OnPath {
							return nil
						}

						return PathFailure_LDKOnPath_Body(cType: self.cType!.on_path, instantiationContext: "PathFailure.swift::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> PathFailure {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PathFailure {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing PathFailure \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing PathFailure \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					
					
					/// 
					internal typealias PathFailure_LDKInitialSend_Body = InitialSend
			

					/// 
					public class InitialSend: NativeTypeWrapper {

						

						
						public static var enableDeinitLogging = true
						public static var suspendFreedom = false
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKPathFailure_LDKInitialSend_Body?

						internal init(cType: LDKPathFailure_LDKInitialSend_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKPathFailure_LDKInitialSend_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The error surfaced from initial send.
						public func getErr() -> APIError {
							// return value (do some wrapping)
							let returnValue = APIError(cType: self.cType!.err, instantiationContext: "PathFailure.swift::\(#function):\(#line)", anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> InitialSend {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias PathFailure_LDKOnPath_Body = OnPath
			

					/// 
					public class OnPath: NativeTypeWrapper {

						

						
						public static var enableDeinitLogging = true
						public static var suspendFreedom = false
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKPathFailure_LDKOnPath_Body?

						internal init(cType: LDKPathFailure_LDKOnPath_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKPathFailure_LDKOnPath_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// If present, this [`NetworkUpdate`] should be applied to the [`NetworkGraph`] so that routing
						/// decisions can take into account the update.
						/// 
						/// [`NetworkUpdate`]: crate::routing::gossip::NetworkUpdate
						/// [`NetworkGraph`]: crate::routing::gossip::NetworkGraph
						public func getNetworkUpdate() -> NetworkUpdate? {
							// return value (do some wrapping)
							let returnValue = Option_NetworkUpdateZ(cType: self.cType!.network_update, instantiationContext: "PathFailure.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> OnPath {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		