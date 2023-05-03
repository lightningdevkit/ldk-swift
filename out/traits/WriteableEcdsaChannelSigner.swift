
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A writeable signer.
			/// 
			/// There will always be two instances of a signer per channel, one occupied by the
			/// [`ChannelManager`] and another by the channel's [`ChannelMonitor`].
			/// 
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
			public typealias WriteableEcdsaChannelSigner = Bindings.WriteableEcdsaChannelSigner

			extension Bindings {

				/// A writeable signer.
				/// 
				/// There will always be two instances of a signer per channel, one occupied by the
				/// [`ChannelManager`] and another by the channel's [`ChannelMonitor`].
				/// 
				/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
				/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
				open class WriteableEcdsaChannelSigner: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKWriteableEcdsaChannelSigner?

					internal init(cType: LDKWriteableEcdsaChannelSigner, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKWriteableEcdsaChannelSigner, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(ecdsaChannelSigner: EcdsaChannelSigner) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "WriteableEcdsaChannelSigner.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: WriteableEcdsaChannelSigner = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "WriteableEcdsaChannelSigner::writeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.write()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_u8Z(array: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: WriteableEcdsaChannelSigner = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "WriteableEcdsaChannelSigner::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKWriteableEcdsaChannelSigner(							
							this_arg: thisArg,
							EcdsaChannelSigner: ecdsaChannelSigner.activate().cType!,
							write: writeLambda,
							cloned: nil,
							free: freeLambda
						)
					}

					
					/// Serialize the object into a byte array
					open func write() -> [UInt8] {
						
						Bindings.print("Error: WriteableEcdsaChannelSigner::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: WriteableEcdsaChannelSigner::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Creates a copy of a WriteableEcdsaChannelSigner
					internal func clone() -> WriteableEcdsaChannelSigner {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKWriteableEcdsaChannelSigner>) in
				WriteableEcdsaChannelSigner_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedWriteableEcdsaChannelSigner(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					/// Implementation of EcdsaChannelSigner for this object.
					public func getEcdsaChannelSigner() -> EcdsaChannelSigner {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedEcdsaChannelSigner(cType: self.cType!.EcdsaChannelSigner, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> WriteableEcdsaChannelSigner {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing WriteableEcdsaChannelSigner \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing WriteableEcdsaChannelSigner \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedWriteableEcdsaChannelSigner: WriteableEcdsaChannelSigner {
					
					/// Serialize the object into a byte array
					public override func write() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.write(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)").getValue()

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		