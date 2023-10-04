
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias GraphSyncError = Bindings.GraphSyncError

			extension Bindings {

				/// All-encompassing standard error type that processing can return
				public class GraphSyncError: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKGraphSyncError?

					internal init(cType: LDKGraphSyncError, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKGraphSyncError, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKGraphSyncError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum GraphSyncErrorType {
						
						/// Error trying to read the update data, typically due to an erroneous data length indication
						/// that is greater than the actual amount of data provided
						case DecodeError
			
						/// Error applying the patch to the network graph, usually the result of updates that are too
						/// old or missing prerequisite data to the application of updates out of order
						case LightningError
			
					}

					public func getValueType() -> GraphSyncErrorType {
						switch self.cType!.tag {
							case LDKGraphSyncError_DecodeError:
								return .DecodeError
			
							case LDKGraphSyncError_LightningError:
								return .LightningError
			
							default:
								Bindings.print("Error: Invalid value type for GraphSyncError! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the GraphSyncError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GraphSyncError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the GraphSyncError
					internal func clone() -> GraphSyncError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKGraphSyncError>) in
				GraphSyncError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GraphSyncError(cType: nativeCallResult, instantiationContext: "GraphSyncError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new DecodeError-variant GraphSyncError
					public class func initWithDecodeError(a: DecodeError) -> GraphSyncError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GraphSyncError_decode_error(a.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GraphSyncError(cType: nativeCallResult, instantiationContext: "GraphSyncError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new LightningError-variant GraphSyncError
					public class func initWithLightningError(a: Bindings.LightningError) -> GraphSyncError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GraphSyncError_lightning_error(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GraphSyncError(cType: nativeCallResult, instantiationContext: "GraphSyncError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsDecodeError() -> DecodeError? {
						if self.cType?.tag != LDKGraphSyncError_DecodeError {
							return nil
						}

						return DecodeError(cType: self.cType!.decode_error, instantiationContext: "GraphSyncError.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsLightningError() -> Bindings.LightningError? {
						if self.cType?.tag != LDKGraphSyncError_LightningError {
							return nil
						}

						return LightningError(cType: self.cType!.lightning_error, instantiationContext: "GraphSyncError.swift::\(#function):\(#line)", anchor: self)
					}
			

					
					internal func danglingClone() -> GraphSyncError {
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
								Bindings.print("Freeing GraphSyncError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing GraphSyncError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		