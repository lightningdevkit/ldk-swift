
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_ThirtyTwoBytesChannelManagerZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ = Bindings.Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ

			extension Bindings {

				/// A CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_ThirtyTwoBytesChannelManagerZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ?

					internal init(cType: LDKCResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ in the success state.
					public class func initWithOk(o: ([UInt8], ChannelManager)) -> Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ {
						// native call variable prep
						
						let oTuple = Tuple_ThirtyTwoBytesChannelManagerZ(tuple: o, instantiationContext: "Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ_ok(oTuple.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> ([UInt8], ChannelManager)? {
						if self.cType?.result_ok == true {
							return Tuple_ThirtyTwoBytesChannelManagerZ(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_C2Tuple_ThirtyTwoBytesChannelManagerZDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		