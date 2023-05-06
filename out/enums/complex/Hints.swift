
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Hints = Bindings.Hints

			extension Bindings {

				/// Routing hints for the tail of the route.
				public class Hints: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHints?

					internal init(cType: LDKHints, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKHints, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKHints, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum HintsType {
						
						/// The recipient provided blinded paths and payinfo to reach them. The blinded paths themselves
						/// will be included in the final [`Route`].
						case Blinded
			
						/// The recipient included these route hints in their BOLT11 invoice.
						case Clear
			
					}

					public func getValueType() -> HintsType {
						switch self.cType!.tag {
							case LDKHints_Blinded:
								return .Blinded
			
							case LDKHints_Clear:
								return .Clear
			
							default:
								Bindings.print("Error: Invalid value type for Hints! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the Hints
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Hints_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Hints
					internal func clone() -> Hints {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHints>) in
				Hints_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Hints(cType: nativeCallResult, instantiationContext: "Hints.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Blinded-variant Hints
					public class func initWithBlinded(a: [(BlindedPayInfo, BlindedPath)]) -> Hints {
						// native call variable prep
						
						let aVector = Vec_C2Tuple_BlindedPayInfoBlindedPathZZ(array: a, instantiationContext: "Hints.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = Hints_blinded(aVector.cType!)

						// cleanup
						
						// aVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Hints(cType: nativeCallResult, instantiationContext: "Hints.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Clear-variant Hints
					public class func initWithClear(a: [RouteHint]) -> Hints {
						// native call variable prep
						
						let aVector = Vec_RouteHintZ(array: a, instantiationContext: "Hints.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = Hints_clear(aVector.cType!)

						// cleanup
						
						// aVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Hints(cType: nativeCallResult, instantiationContext: "Hints.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the Hints.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKHints>) in
				Hints_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Hintss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: Hints, b: Hints) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHints>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHints>) in
				Hints_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsBlinded() -> [(BlindedPayInfo, BlindedPath)]? {
						if self.cType?.tag != LDKHints_Blinded {
							return nil
						}

						return Vec_C2Tuple_BlindedPayInfoBlindedPathZZ(cType: self.cType!.blinded, instantiationContext: "Hints.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsClear() -> [RouteHint]? {
						if self.cType?.tag != LDKHints_Clear {
							return nil
						}

						return Vec_RouteHintZ(cType: self.cType!.clear, instantiationContext: "Hints.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> Hints {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Hints {
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
								Bindings.print("Freeing Hints \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Hints \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		