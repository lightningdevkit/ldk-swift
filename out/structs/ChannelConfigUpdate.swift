#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A parallel struct to [`ChannelConfig`] to define partial updates.
public typealias ChannelConfigUpdate = Bindings.ChannelConfigUpdate

extension Bindings {


	/// A parallel struct to [`ChannelConfig`] to define partial updates.
	public class ChannelConfigUpdate: NativeTypeWrapper {

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

		internal var cType: LDKChannelConfigUpdate?

		internal init(cType: LDKChannelConfigUpdate, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelConfigUpdate, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelConfigUpdate, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ChannelConfigUpdate, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelConfigUpdate_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getForwardingFeeProportionalMillionths() -> UInt32? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_get_forwarding_fee_proportional_millionths(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u32Z(
				cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func setForwardingFeeProportionalMillionths(val: UInt32?) {
			// native call variable prep

			let valOption = Option_u32Z(
				some: val, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_set_forwarding_fee_proportional_millionths(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getForwardingFeeBaseMsat() -> UInt32? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_get_forwarding_fee_base_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u32Z(
				cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func setForwardingFeeBaseMsat(val: UInt32?) {
			// native call variable prep

			let valOption = Option_u32Z(
				some: val, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_set_forwarding_fee_base_msat(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getCltvExpiryDelta() -> UInt16? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_get_cltv_expiry_delta(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u16Z(
				cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func setCltvExpiryDelta(val: UInt16?) {
			// native call variable prep

			let valOption = Option_u16Z(
				some: val, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_set_cltv_expiry_delta(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns a copy of the field.
		public func getMaxDustHtlcExposureMsat() -> MaxDustHTLCExposure? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_get_max_dust_htlc_exposure_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_MaxDustHTLCExposureZ(
				cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func setMaxDustHtlcExposureMsat(val: MaxDustHTLCExposure?) {
			// native call variable prep

			let valOption = Option_MaxDustHTLCExposureZ(
				some: val, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_set_max_dust_htlc_exposure_msat(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getForceCloseAvoidanceMaxFeeSatoshis() -> UInt64? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_get_force_close_avoidance_max_fee_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u64Z(
				cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		///
		public func setForceCloseAvoidanceMaxFeeSatoshis(val: UInt64?) {
			// native call variable prep

			let valOption = Option_u64Z(
				some: val, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKChannelConfigUpdate>) in
					ChannelConfigUpdate_set_force_close_avoidance_max_fee_satoshis(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ChannelConfigUpdate given each field
		public init(
			forwardingFeeProportionalMillionthsArg: UInt32?, forwardingFeeBaseMsatArg: UInt32?,
			cltvExpiryDeltaArg: UInt16?, maxDustHtlcExposureMsatArg: MaxDustHTLCExposure?,
			forceCloseAvoidanceMaxFeeSatoshisArg: UInt64?
		) {
			// native call variable prep

			let forwardingFeeProportionalMillionthsArgOption = Option_u32Z(
				some: forwardingFeeProportionalMillionthsArg,
				instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let forwardingFeeBaseMsatArgOption = Option_u32Z(
				some: forwardingFeeBaseMsatArg, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let cltvExpiryDeltaArgOption = Option_u16Z(
				some: cltvExpiryDeltaArg, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let maxDustHtlcExposureMsatArgOption = Option_MaxDustHTLCExposureZ(
				some: maxDustHtlcExposureMsatArg,
				instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let forceCloseAvoidanceMaxFeeSatoshisArgOption = Option_u64Z(
				some: forceCloseAvoidanceMaxFeeSatoshisArg,
				instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = ChannelConfigUpdate_new(
				forwardingFeeProportionalMillionthsArgOption.cType!, forwardingFeeBaseMsatArgOption.cType!,
				cltvExpiryDeltaArgOption.cType!, maxDustHtlcExposureMsatArgOption.cType!,
				forceCloseAvoidanceMaxFeeSatoshisArgOption.cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ChannelConfigUpdate(cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)")


		}

		/// Creates a "default" ChannelConfigUpdate. See struct and individual field documentaiton for details on which values are used.
		public class func initWithDefault() -> ChannelConfigUpdate {
			// native call variable prep


			// native method call
			let nativeCallResult = ChannelConfigUpdate_default()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelConfigUpdate(
				cType: nativeCallResult, instantiationContext: "ChannelConfigUpdate.swift::\(#function):\(#line)")


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


		internal func setCFreeability(freeable: Bool) -> ChannelConfigUpdate {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ChannelConfigUpdate {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing ChannelConfigUpdate \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelConfigUpdate \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

