
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Lightning TLV uses a custom variable-length integer called `BigSize`. It is similar to Bitcoin's
			/// variable-length integers except that it is serialized in big-endian instead of little-endian.
			/// 
			/// Like Bitcoin's variable-length integer, it exhibits ambiguity in that certain values can be
			/// encoded in several different ways, which we must check for at deserialization-time. Thus, if
			/// you're looking for an example of a variable-length integer to use for your own project, move
			/// along, this is a rather poor design.
			public typealias BigSize = Bindings.BigSize

			extension Bindings {
		

				/// Lightning TLV uses a custom variable-length integer called `BigSize`. It is similar to Bitcoin's
				/// variable-length integers except that it is serialized in big-endian instead of little-endian.
				/// 
				/// Like Bitcoin's variable-length integer, it exhibits ambiguity in that certain values can be
				/// encoded in several different ways, which we must check for at deserialization-time. Thus, if
				/// you're looking for an example of a variable-length integer to use for your own project, move
				/// along, this is a rather poor design.
				public class BigSize: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBigSize?

					internal init(cType: LDKBigSize, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBigSize, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BigSize, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BigSize_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// 
					public func getA() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBigSize>) in
				BigSize_get_a(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// 
					public func setA(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBigSize>) in
				BigSize_set_a(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new BigSize given each field
					public init(aArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BigSize_new(aArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = BigSize(cType: nativeCallResult, instantiationContext: "BigSize.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "BigSize.swift::\(#function):\(#line)")
				
			
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> BigSize {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> BigSize {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> BigSize {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing BigSize \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing BigSize \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		