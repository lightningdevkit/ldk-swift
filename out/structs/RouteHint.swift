#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A list of hops along a payment path terminating with a channel to the recipient.
public typealias RouteHint = Bindings.RouteHint

extension Bindings {


	/// A list of hops along a payment path terminating with a channel to the recipient.
	public class RouteHint: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKRouteHint?

		internal init(cType: LDKRouteHint, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRouteHint, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKRouteHint, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the RouteHint, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = RouteHint_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getA() -> [RouteHintHop] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHint>) in
					RouteHint_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_RouteHintHopZ(
				cType: nativeCallResult, instantiationContext: "RouteHint.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		///
		public func setA(val: [RouteHintHop]) {
			// native call variable prep

			let valVector = Vec_RouteHintHopZ(
				array: val, instantiationContext: "RouteHint.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHint>) in
					RouteHint_set_a(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new RouteHint given each field
		public init(aArg: [RouteHintHop]) {
			// native call variable prep

			let aArgVector = Vec_RouteHintHopZ(
				array: aArg, instantiationContext: "RouteHint.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = RouteHint_new(aArgVector.cType!)

			// cleanup

			// aArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = RouteHint(cType: nativeCallResult, instantiationContext: "RouteHint.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "RouteHint.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the RouteHint
		internal func clone() -> RouteHint {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRouteHint>) in
					RouteHint_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = RouteHint(
				cType: nativeCallResult, instantiationContext: "RouteHint.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the RouteHint.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRouteHint>) in
					RouteHint_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two RouteHints contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: RouteHint, b: RouteHint) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRouteHint>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRouteHint>) in
						RouteHint_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the RouteHint object into a byte array which can be read by RouteHint_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRouteHint>) in
					RouteHint_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "RouteHint.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a RouteHint from a byte array, created by RouteHint_write
		public class func read(ser: [UInt8]) -> Result_RouteHintDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "RouteHint.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = RouteHint_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RouteHintDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "RouteHint.swift::\(#function):\(#line)")


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> RouteHint {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> RouteHint {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> RouteHint {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> RouteHint {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> RouteHint {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing RouteHint \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing RouteHint \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

