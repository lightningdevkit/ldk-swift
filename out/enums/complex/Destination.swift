
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Destination = Bindings.Destination

			extension Bindings {

				/// The destination of an onion message.
				public class Destination: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDestination?

					internal init(cType: LDKDestination, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKDestination, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum DestinationType {
						
						/// We're sending this onion message to a node.
						case Node
			
						/// We're sending this onion message to a blinded path.
						case BlindedPath
			
					}

					public func getValueType() -> DestinationType {
						switch self.cType!.tag {
							case LDKDestination_Node:
								return .Node
			
							case LDKDestination_BlindedPath:
								return .BlindedPath
			
							default:
								Bindings.print("Error: Invalid value type for Destination! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the Destination
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Destination_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Destination
					internal func clone() -> Destination {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDestination>) in
				Destination_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Destination(cType: nativeCallResult, instantiationContext: "Destination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Node-variant Destination
					public class func initWithNode(a: [UInt8]) -> Destination {
						// native call variable prep
						
						let aPrimitiveWrapper = PublicKey(value: a, instantiationContext: "Destination.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = Destination_node(aPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Destination(cType: nativeCallResult, instantiationContext: "Destination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new BlindedPath-variant Destination
					public class func initWithBlindedPath(a: Bindings.BlindedPath) -> Destination {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Destination_blinded_path(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Destination(cType: nativeCallResult, instantiationContext: "Destination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsNode() -> [UInt8]? {
						if self.cType?.tag != LDKDestination_Node {
							return nil
						}

						return PublicKey(cType: self.cType!.node, instantiationContext: "Destination.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsBlindedPath() -> Bindings.BlindedPath? {
						if self.cType?.tag != LDKDestination_BlindedPath {
							return nil
						}

						return BlindedPath(cType: self.cType!.blinded_path, instantiationContext: "Destination.swift::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> Destination {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Destination {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Destination \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Destination \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		