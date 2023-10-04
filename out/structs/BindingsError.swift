
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Sub-errors which don't have specific information in them use this type.
			public typealias BindingsError = Bindings.BindingsError

			extension Bindings {
		

				/// Sub-errors which don't have specific information in them use this type.
				public class BindingsError: NativeTypeWrapper {

					

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKError?

					internal init(cType: LDKError, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKError, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					

					
					/// Zero-Sized_types aren't consistent across Rust/C/C++, so we add some size here
					public func getDummy() -> UInt8 {
						// return value (do some wrapping)
						let returnValue = self.cType!._dummy

						return returnValue;
					}
		

										

				}

				
			}
		
		