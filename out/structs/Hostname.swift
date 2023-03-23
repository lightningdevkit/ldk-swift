
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Represents a hostname for serialization purposes.
			/// Only the character set and length will be validated.
			/// The character set consists of ASCII alphanumeric characters, hyphens, and periods.
			/// Its length is guaranteed to be representable by a single byte.
			/// This serialization is used by [`BOLT 7`] hostnames.
			/// 
			/// [`BOLT 7`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md
			public typealias Hostname = Bindings.Hostname

			extension Bindings {
		

				/// Represents a hostname for serialization purposes.
				/// Only the character set and length will be validated.
				/// The character set consists of ASCII alphanumeric characters, hyphens, and periods.
				/// Its length is guaranteed to be representable by a single byte.
				/// This serialization is used by [`BOLT 7`] hostnames.
				/// 
				/// [`BOLT 7`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md
				public class Hostname: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHostname?

					internal init(cType: LDKHostname) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKHostname, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Hostname, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Hostname_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Hostname
					internal func clone() -> Hostname {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHostname>) in
				Hostname_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Hostname(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two Hostnames contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: Hostname, b: Hostname) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHostname>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHostname>) in
				Hostname_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns the length of the hostname.
					public func len() -> UInt8 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHostname>) in
				Hostname_len(thisArgPointer)
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> Hostname {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Hostname {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Hostname {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Hostname {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Hostname {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Hostname \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Hostname \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		