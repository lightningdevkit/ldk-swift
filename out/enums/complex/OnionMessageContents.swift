
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

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKOnionMessageContents?

					internal init(cType: LDKOnionMessageContents) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKOnionMessageContents, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum OnionMessageContentsType {
						
						/// A custom onion message specified by the user.
						case Custom
			
					}

					public func getValueType() -> OnionMessageContentsType {
						switch self.cType!.tag {
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
						let returnValue = OnionMessageContents(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Custom-variant OnionMessageContents
					public class func initWithCustom(a: Bindings.CustomOnionMessageContents) -> OnionMessageContents {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OnionMessageContents_custom(a.activate().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OnionMessageContents(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					public func getValueAsCustom() -> Bindings.CustomOnionMessageContents? {
						if self.cType?.tag != LDKOnionMessageContents_Custom {
							return nil
						}

						return NativelyImplementedCustomOnionMessageContents(cType: self.cType!.custom, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> OnionMessageContents {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> OnionMessageContents {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing OnionMessageContents \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing OnionMessageContents \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		