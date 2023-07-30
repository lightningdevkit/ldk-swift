#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Simple structure sent back by `chain::Watch` when an HTLC from a forward channel is detected on
/// chain. Used to update the corresponding HTLC in the backward channel. Failing to pass the
/// preimage claim backward will lead to loss of funds.
public typealias HTLCUpdate = Bindings.HTLCUpdate

extension Bindings {


	/// Simple structure sent back by `chain::Watch` when an HTLC from a forward channel is detected on
	/// chain. Used to update the corresponding HTLC in the backward channel. Failing to pass the
	/// preimage claim backward will lead to loss of funds.
	public class HTLCUpdate: NativeTypeWrapper {

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

		internal var cType: LDKHTLCUpdate?

		internal init(cType: LDKHTLCUpdate, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKHTLCUpdate, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKHTLCUpdate, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the HTLCUpdate, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = HTLCUpdate_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the HTLCUpdate
		internal func clone() -> HTLCUpdate {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHTLCUpdate>) in
					HTLCUpdate_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HTLCUpdate(
				cType: nativeCallResult, instantiationContext: "HTLCUpdate.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two HTLCUpdates contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: HTLCUpdate, b: HTLCUpdate) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHTLCUpdate>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHTLCUpdate>) in
						HTLCUpdate_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the HTLCUpdate object into a byte array which can be read by HTLCUpdate_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHTLCUpdate>) in
					HTLCUpdate_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HTLCUpdate.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a HTLCUpdate from a byte array, created by HTLCUpdate_write
		public class func read(ser: [UInt8]) -> Result_HTLCUpdateDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "HTLCUpdate.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HTLCUpdate_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HTLCUpdateDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "HTLCUpdate.swift::\(#function):\(#line)")


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


		internal func dangle(_ shouldDangle: Bool = true) -> HTLCUpdate {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> HTLCUpdate {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> HTLCUpdate {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> HTLCUpdate {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> HTLCUpdate {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> HTLCUpdate {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing HTLCUpdate \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing HTLCUpdate \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

