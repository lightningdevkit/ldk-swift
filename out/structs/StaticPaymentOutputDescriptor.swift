
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Information about a spendable output to our \"payment key\".
			/// 
			/// See [`SpendableOutputDescriptor::StaticPaymentOutput`] for more details on how to spend this.
			public typealias StaticPaymentOutputDescriptor = Bindings.StaticPaymentOutputDescriptor

			extension Bindings {
		

				/// Information about a spendable output to our \"payment key\".
				/// 
				/// See [`SpendableOutputDescriptor::StaticPaymentOutput`] for more details on how to spend this.
				public class StaticPaymentOutputDescriptor: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKStaticPaymentOutputDescriptor?

					internal init(cType: LDKStaticPaymentOutputDescriptor) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKStaticPaymentOutputDescriptor, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the StaticPaymentOutputDescriptor, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = StaticPaymentOutputDescriptor_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The outpoint which is spendable.
					public func getOutpoint() -> OutPoint {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_get_outpoint(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OutPoint(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The outpoint which is spendable.
					public func setOutpoint(val: OutPoint) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_set_outpoint(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The output which is referenced by the given outpoint.
					/// 
					/// Returns a copy of the field.
					public func getOutput() -> TxOut {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_get_output(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = TxOut(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// The output which is referenced by the given outpoint.
					public func setOutput(val: TxOut) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_set_output(thisPtrPointer, val.danglingClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Arbitrary identification information returned by a call to [`ChannelSigner::channel_keys_id`].
					/// This may be useful in re-deriving keys used in the channel to spend the output.
					public func getChannelKeysId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_get_channel_keys_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// Arbitrary identification information returned by a call to [`ChannelSigner::channel_keys_id`].
					/// This may be useful in re-deriving keys used in the channel to spend the output.
					public func setChannelKeysId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_set_channel_keys_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value of the channel which this transactions spends.
					public func getChannelValueSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_get_channel_value_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value of the channel which this transactions spends.
					public func setChannelValueSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_set_channel_value_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new StaticPaymentOutputDescriptor given each field
					public init(outpointArg: OutPoint, outputArg: TxOut, channelKeysIdArg: [UInt8], channelValueSatoshisArg: UInt64) {
						// native call variable prep
						
						let channelKeysIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelKeysIdArg)
				

						// native method call
						let nativeCallResult = StaticPaymentOutputDescriptor_new(outpointArg.dynamicallyDangledClone().cType!, outputArg.danglingClone().cType!, channelKeysIdArgPrimitiveWrapper.cType!, channelValueSatoshisArg)

						// cleanup
						
						// for elided types, we need this
						channelKeysIdArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = StaticPaymentOutputDescriptor(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Creates a copy of the StaticPaymentOutputDescriptor
					internal func clone() -> StaticPaymentOutputDescriptor {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = StaticPaymentOutputDescriptor(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two StaticPaymentOutputDescriptors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: StaticPaymentOutputDescriptor, b: StaticPaymentOutputDescriptor) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the StaticPaymentOutputDescriptor object into a byte array which can be read by StaticPaymentOutputDescriptor_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
				StaticPaymentOutputDescriptor_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a StaticPaymentOutputDescriptor from a byte array, created by StaticPaymentOutputDescriptor_write
					public class func read(ser: [UInt8]) -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = StaticPaymentOutputDescriptor_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_StaticPaymentOutputDescriptorDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> StaticPaymentOutputDescriptor {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> StaticPaymentOutputDescriptor {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> StaticPaymentOutputDescriptor {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> StaticPaymentOutputDescriptor {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> StaticPaymentOutputDescriptor {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing StaticPaymentOutputDescriptor \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing StaticPaymentOutputDescriptor \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		