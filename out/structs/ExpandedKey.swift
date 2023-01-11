
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A set of keys that were HKDF-expanded from an initial call to
			/// [`KeysInterface::get_inbound_payment_key_material`].
			/// 
			/// [`KeysInterface::get_inbound_payment_key_material`]: crate::chain::keysinterface::KeysInterface::get_inbound_payment_key_material
			public typealias ExpandedKey = Bindings.ExpandedKey

			extension Bindings {
		

				/// A set of keys that were HKDF-expanded from an initial call to
				/// [`KeysInterface::get_inbound_payment_key_material`].
				/// 
				/// [`KeysInterface::get_inbound_payment_key_material`]: crate::chain::keysinterface::KeysInterface::get_inbound_payment_key_material
				public class ExpandedKey: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKExpandedKey?

					internal init(cType: LDKExpandedKey) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKExpandedKey, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
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
						let returnValue = ExpandedKey(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> ExpandedKey {
						self.dangling = shouldDangle
						return self
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
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ExpandedKey \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ExpandedKey \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		