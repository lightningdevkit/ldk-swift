
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Features used within an `invoice`.
			public typealias Bolt12InvoiceFeatures = Bindings.Bolt12InvoiceFeatures

			extension Bindings {
		

				/// Features used within an `invoice`.
				public class Bolt12InvoiceFeatures: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBolt12InvoiceFeatures?

					internal init(cType: LDKBolt12InvoiceFeatures, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBolt12InvoiceFeatures, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Checks if two Bolt12InvoiceFeaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: Bolt12InvoiceFeatures, b: Bolt12InvoiceFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBolt12InvoiceFeatures>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Bolt12InvoiceFeatures
					internal func clone() -> Bolt12InvoiceFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Bolt12InvoiceFeatures(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the Bolt12InvoiceFeatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Bolt12InvoiceFeatures_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a blank Features with no features set
					public class func initWithEmpty() -> Bolt12InvoiceFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Bolt12InvoiceFeatures_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Bolt12InvoiceFeatures(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains unknown feature flags which are set as
					/// \"required\".
					public func requiresUnknownBits() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_requires_unknown_bits(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setBasicMppOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_set_basic_mpp_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setBasicMppRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_set_basic_mpp_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsBasicMpp() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_supports_basic_mpp(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresBasicMpp() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBolt12InvoiceFeatures>) in
				Bolt12InvoiceFeatures_requires_basic_mpp(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Bolt12InvoiceFeatures {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Bolt12InvoiceFeatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Bolt12InvoiceFeatures {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Bolt12InvoiceFeatures {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Bolt12InvoiceFeatures {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Bolt12InvoiceFeatures \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Bolt12InvoiceFeatures \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		