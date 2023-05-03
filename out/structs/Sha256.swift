
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// SHA-256 hash
			public typealias Sha256 = Bindings.Sha256

			extension Bindings {
		

				/// SHA-256 hash
				public class Sha256: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSha256?

					internal init(cType: LDKSha256) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKSha256, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Sha256, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Sha256_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Sha256
					internal func clone() -> Sha256 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSha256>) in
				Sha256_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Sha256(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the Sha256.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSha256>) in
				Sha256_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Sha256s contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: Sha256, b: Sha256) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSha256>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSha256>) in
				Sha256_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new [`Sha256`] from the given bytes, which are assumed to be the output of a
					/// single sha256 hash.
					public class func initWithBytes(bytes: [UInt8]) -> Sha256 {
						// native call variable prep
						
						let tupledBytes = Bindings.arrayToUInt8Tuple32(array: bytes)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledBytes) { (tupledBytesPointer: UnsafePointer<UInt8Tuple32>) in
				Sha256_from_bytes(tupledBytesPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Sha256(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> Sha256 {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Sha256 {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Sha256 {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Sha256 {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Sha256 {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Sha256 \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Sha256 \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		