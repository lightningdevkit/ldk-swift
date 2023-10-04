
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias OnionMessageContents = Bindings.OnionMessageContents

			extension Bindings {

				/// The contents of an onion message. In the context of offers, this would be the invoice, invoice
				/// request, or invoice error.
				public class OnionMessageContents: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKOnionMessageContents?

					internal init(cType: LDKOnionMessageContents, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKOnionMessageContents, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKOnionMessageContents, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum OnionMessageContentsType {
						
						/// A message related to BOLT 12 Offers.
						case Offers
			
						/// A custom onion message specified by the user.
						case Custom
			
					}

					public func getValueType() -> OnionMessageContentsType {
						switch self.cType!.tag {
							case LDKOnionMessageContents_Offers:
								return .Offers
			
							case LDKOnionMessageContents_Custom:
								return .Custom
			
							default:
								Bindings.print("Error: Invalid value type for OnionMessageContents! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the OnionMessageContents
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OnionMessageContents_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the OnionMessageContents
					internal func clone() -> OnionMessageContents {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOnionMessageContents>) in
				OnionMessageContents_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OnionMessageContents(cType: nativeCallResult, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Offers-variant OnionMessageContents
					public class func initWithOffers(a: OffersMessage) -> OnionMessageContents {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OnionMessageContents_offers(a.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OnionMessageContents(cType: nativeCallResult, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Custom-variant OnionMessageContents
					public class func initWithCustom(a: Bindings.CustomOnionMessageContents) -> OnionMessageContents {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OnionMessageContents_custom(a.activate().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OnionMessageContents(cType: nativeCallResult, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsOffers() -> OffersMessage? {
						if self.cType?.tag != LDKOnionMessageContents_Offers {
							return nil
						}

						return OffersMessage(cType: self.cType!.offers, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsCustom() -> Bindings.CustomOnionMessageContents? {
						if self.cType?.tag != LDKOnionMessageContents_Custom {
							return nil
						}

						return NativelyImplementedCustomOnionMessageContents(cType: self.cType!.custom, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)", anchor: self)
					}
			

					
					internal func danglingClone() -> OnionMessageContents {
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
								Bindings.print("Freeing OnionMessageContents \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing OnionMessageContents \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		