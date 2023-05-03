
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An opaque identifier describing a specific [`Persist`] method call.
			public typealias MonitorUpdateId = Bindings.MonitorUpdateId

			extension Bindings {
		

				/// An opaque identifier describing a specific [`Persist`] method call.
				public class MonitorUpdateId: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMonitorUpdateId?

					internal init(cType: LDKMonitorUpdateId) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKMonitorUpdateId, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the MonitorUpdateId, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorUpdateId_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the MonitorUpdateId
					internal func clone() -> MonitorUpdateId {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMonitorUpdateId>) in
				MonitorUpdateId_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorUpdateId(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the MonitorUpdateId.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKMonitorUpdateId>) in
				MonitorUpdateId_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two MonitorUpdateIds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: MonitorUpdateId, b: MonitorUpdateId) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKMonitorUpdateId>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKMonitorUpdateId>) in
				MonitorUpdateId_eq(aPointer, bPointer)
						}
				
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> MonitorUpdateId {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> MonitorUpdateId {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> MonitorUpdateId {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> MonitorUpdateId {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> MonitorUpdateId {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing MonitorUpdateId \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing MonitorUpdateId \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		