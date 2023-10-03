#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A route directs a payment from the sender (us) to the recipient. If the recipient supports MPP,
/// it can take multiple paths. Each path is composed of one or more hops through the network.
public typealias Route = Bindings.Route

extension Bindings {


	/// A route directs a payment from the sender (us) to the recipient. If the recipient supports MPP,
	/// it can take multiple paths. Each path is composed of one or more hops through the network.
	public class Route: NativeTypeWrapper {

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

		internal var cType: LDKRoute?

		internal init(cType: LDKRoute, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRoute, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKRoute, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Route, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Route_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The list of [`Path`]s taken for a single (potentially-)multi-part payment. If no
		/// [`BlindedTail`]s are present, then the pubkey of the last [`RouteHop`] in each path must be
		/// the same.
		public func getPaths() -> [Path] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRoute>) in
					Route_get_paths(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_PathZ(
				cType: nativeCallResult, instantiationContext: "Route.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The list of [`Path`]s taken for a single (potentially-)multi-part payment. If no
		/// [`BlindedTail`]s are present, then the pubkey of the last [`RouteHop`] in each path must be
		/// the same.
		public func setPaths(val: [Path]) {
			// native call variable prep

			let valVector = Vec_PathZ(array: val, instantiationContext: "Route.swift::\(#function):\(#line)").dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRoute>) in
					Route_set_paths(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The `route_params` parameter passed to [`find_route`].
		///
		/// This is used by `ChannelManager` to track information which may be required for retries.
		///
		/// Will be `None` for objects serialized with LDK versions prior to 0.0.117.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getRouteParams() -> RouteParameters? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRoute>) in
					Route_get_route_params(thisPtrPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKRouteParameters

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = RouteParameters(
				cType: nativeCallResult, instantiationContext: "Route.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The `route_params` parameter passed to [`find_route`].
		///
		/// This is used by `ChannelManager` to track information which may be required for retries.
		///
		/// Will be `None` for objects serialized with LDK versions prior to 0.0.117.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setRouteParams(val: RouteParameters) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRoute>) in
					Route_set_route_params(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new Route given each field
		///
		/// Note that route_params_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		public init(pathsArg: [Path], routeParamsArg: RouteParameters) {
			// native call variable prep

			let pathsArgVector = Vec_PathZ(array: pathsArg, instantiationContext: "Route.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = Route_new(pathsArgVector.cType!, routeParamsArg.dynamicallyDangledClone().cType!)

			// cleanup

			// pathsArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = Route(cType: nativeCallResult, instantiationContext: "Route.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "Route.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the Route
		internal func clone() -> Route {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRoute>) in
					Route_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Route(cType: nativeCallResult, instantiationContext: "Route.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the Route.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRoute>) in
					Route_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two Routes contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: Route, b: Route) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRoute>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRoute>) in
						Route_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the total amount of fees paid on this [`Route`].
		///
		/// For objects serialized with LDK 0.0.117 and after, this includes any extra payment made to
		/// the recipient, which can happen in excess of the amount passed to [`find_route`] via
		/// [`RouteParameters::final_value_msat`], if we had to reach the [`htlc_minimum_msat`] limits.
		///
		/// [`htlc_minimum_msat`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_update-message
		public func getTotalFees() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRoute>) in
					Route_get_total_fees(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the total amount paid on this [`Route`], excluding the fees.
		///
		/// Might be more than requested as part of the given [`RouteParameters::final_value_msat`] if
		/// we had to reach the [`htlc_minimum_msat`] limits.
		///
		/// [`htlc_minimum_msat`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_update-message
		public func getTotalAmount() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRoute>) in
					Route_get_total_amount(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the Route object into a byte array which can be read by Route_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRoute>) in
					Route_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Route.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a Route from a byte array, created by Route_write
		public class func read(ser: [UInt8]) -> Result_RouteDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "Route.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Route_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RouteDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "Route.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> Route {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> Route {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> Route {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Route {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Route \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Route \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

