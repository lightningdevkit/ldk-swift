
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A timestamp that refers to a date after 1 January 1970.
			/// 
			/// # Invariants
			/// 
			/// The Unix timestamp representing the stored time has to be positive and no greater than
			/// [`MAX_TIMESTAMP`].
			public typealias PositiveTimestamp = Bindings.PositiveTimestamp

			extension Bindings {
		

				/// A timestamp that refers to a date after 1 January 1970.
				/// 
				/// # Invariants
				/// 
				/// The Unix timestamp representing the stored time has to be positive and no greater than
				/// [`MAX_TIMESTAMP`].
				public class PositiveTimestamp: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPositiveTimestamp?

					internal init(cType: LDKPositiveTimestamp) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKPositiveTimestamp, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PositiveTimestamp, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PositiveTimestamp_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two PositiveTimestamps contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: PositiveTimestamp, b: PositiveTimestamp) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPositiveTimestamp>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPositiveTimestamp>) in
				PositiveTimestamp_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the PositiveTimestamp
					internal func clone() -> PositiveTimestamp {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPositiveTimestamp>) in
				PositiveTimestamp_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PositiveTimestamp(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two PositiveTimestamps contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKPositiveTimestamp>) in
				PositiveTimestamp_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a `PositiveTimestamp` from a Unix timestamp in the range `0..=MAX_TIMESTAMP`.
					/// 
					/// Otherwise, returns a [`CreationError::TimestampOutOfBounds`].
					public class func fromUnixTimestamp(unixSeconds: UInt64) -> Result_PositiveTimestampCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PositiveTimestamp_from_unix_timestamp(unixSeconds)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PositiveTimestampCreationErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a `PositiveTimestamp` from a [`SystemTime`] with a corresponding Unix timestamp in
					/// the range `0..=MAX_TIMESTAMP`.
					/// 
					/// Note that the subsecond part is dropped as it is not representable in BOLT 11 invoices.
					/// 
					/// Otherwise, returns a [`CreationError::TimestampOutOfBounds`].
					public class func fromSystemTime(time: UInt64) -> Result_PositiveTimestampCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PositiveTimestamp_from_system_time(time)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PositiveTimestampCreationErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a `PositiveTimestamp` from a [`Duration`] since the Unix epoch in the range
					/// `0..=MAX_TIMESTAMP`.
					/// 
					/// Note that the subsecond part is dropped as it is not representable in BOLT 11 invoices.
					/// 
					/// Otherwise, returns a [`CreationError::TimestampOutOfBounds`].
					public class func fromDurationSinceEpoch(duration: UInt64) -> Result_PositiveTimestampCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PositiveTimestamp_from_duration_since_epoch(duration)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PositiveTimestampCreationErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns the Unix timestamp representing the stored time
					public func asUnixTimestamp() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPositiveTimestamp>) in
				PositiveTimestamp_as_unix_timestamp(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns the duration of the stored time since the Unix epoch
					public func asDurationSinceEpoch() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPositiveTimestamp>) in
				PositiveTimestamp_as_duration_since_epoch(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns the [`SystemTime`] representing the stored time
					public func asTime() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPositiveTimestamp>) in
				PositiveTimestamp_as_time(thisArgPointer)
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> PositiveTimestamp {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PositiveTimestamp {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> PositiveTimestamp {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> PositiveTimestamp {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> PositiveTimestamp {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing PositiveTimestamp \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing PositiveTimestamp \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		