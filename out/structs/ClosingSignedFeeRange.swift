
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The minimum and maximum fees which the sender is willing to place on the closing transaction.
			/// 
			/// This is provided in [`ClosingSigned`] by both sides to indicate the fee range they are willing
			/// to use.
			public typealias ClosingSignedFeeRange = Bindings.ClosingSignedFeeRange

			extension Bindings {
		

				/// The minimum and maximum fees which the sender is willing to place on the closing transaction.
				/// 
				/// This is provided in [`ClosingSigned`] by both sides to indicate the fee range they are willing
				/// to use.
				public class ClosingSignedFeeRange: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKClosingSignedFeeRange?

					internal init(cType: LDKClosingSignedFeeRange) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKClosingSignedFeeRange, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ClosingSignedFeeRange, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosingSignedFeeRange_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum absolute fee, in satoshis, which the sender is willing to place on the closing
					/// transaction.
					public func getMinFeeSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_get_min_fee_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum absolute fee, in satoshis, which the sender is willing to place on the closing
					/// transaction.
					public func setMinFeeSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_set_min_fee_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum absolute fee, in satoshis, which the sender is willing to place on the closing
					/// transaction.
					public func getMaxFeeSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_get_max_fee_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum absolute fee, in satoshis, which the sender is willing to place on the closing
					/// transaction.
					public func setMaxFeeSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_set_max_fee_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ClosingSignedFeeRange given each field
					public init(minFeeSatoshisArg: UInt64, maxFeeSatoshisArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosingSignedFeeRange_new(minFeeSatoshisArg, maxFeeSatoshisArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ClosingSignedFeeRange(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Creates a copy of the ClosingSignedFeeRange
					internal func clone() -> ClosingSignedFeeRange {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosingSignedFeeRange(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two ClosingSignedFeeRanges contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ClosingSignedFeeRange, b: ClosingSignedFeeRange) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ClosingSignedFeeRange object into a byte array which can be read by ClosingSignedFeeRange_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
				ClosingSignedFeeRange_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ClosingSignedFeeRange from a byte array, created by ClosingSignedFeeRange_write
					public class func read(ser: [UInt8]) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ClosingSignedFeeRange_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ClosingSignedFeeRangeDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ClosingSignedFeeRange {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ClosingSignedFeeRange {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ClosingSignedFeeRange {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ClosingSignedFeeRange {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ClosingSignedFeeRange {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ClosingSignedFeeRange \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ClosingSignedFeeRange \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		