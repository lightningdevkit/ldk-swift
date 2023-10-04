
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A set of keys that were HKDF-expanded from an initial call to
			/// [`NodeSigner::get_inbound_payment_key_material`].
			/// 
			/// [`NodeSigner::get_inbound_payment_key_material`]: crate::sign::NodeSigner::get_inbound_payment_key_material
			public typealias ExpandedKey = Bindings.ExpandedKey

			extension Bindings {
		

				/// A set of keys that were HKDF-expanded from an initial call to
				/// [`NodeSigner::get_inbound_payment_key_material`].
				/// 
				/// [`NodeSigner::get_inbound_payment_key_material`]: crate::sign::NodeSigner::get_inbound_payment_key_material
				public class ExpandedKey: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKExpandedKey?

					internal init(cType: LDKExpandedKey, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKExpandedKey, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKExpandedKey, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ExpandedKey, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ExpandedKey_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a  new [`ExpandedKey`] for generating an inbound payment hash and secret.
					/// 
					/// It is recommended to cache this value and not regenerate it for each new inbound payment.
					public init(keyMaterial: [UInt8]) {
						// native call variable prep
						
						let tupledKeyMaterial = Bindings.arrayToUInt8Tuple32(array: keyMaterial)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledKeyMaterial) { (tupledKeyMaterialPointer: UnsafePointer<UInt8Tuple32>) in
				ExpandedKey_new(tupledKeyMaterialPointer)
						}
				

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ExpandedKey(cType: nativeCallResult, instantiationContext: "ExpandedKey.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ExpandedKey.swift::\(#function):\(#line)")
				
			
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					
					internal func setCFreeability(freeable: Bool) -> ExpandedKey {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ExpandedKey {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ExpandedKey \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ExpandedKey \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		