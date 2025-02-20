#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A struct containing the two parts of a BIP 353 Human Readable Name - the user and domain parts.
///
/// The `user` and `domain` parts, together, cannot exceed 232 bytes in length, and both must be
/// non-empty.
///
/// To protect against [Homograph Attacks], both parts of a Human Readable Name must be plain
/// ASCII.
///
/// [Homograph Attacks]: https://en.wikipedia.org/wiki/IDN_homograph_attack
public typealias HumanReadableName = Bindings.HumanReadableName

extension Bindings {


	/// A struct containing the two parts of a BIP 353 Human Readable Name - the user and domain parts.
	///
	/// The `user` and `domain` parts, together, cannot exceed 232 bytes in length, and both must be
	/// non-empty.
	///
	/// To protect against [Homograph Attacks], both parts of a Human Readable Name must be plain
	/// ASCII.
	///
	/// [Homograph Attacks]: https://en.wikipedia.org/wiki/IDN_homograph_attack
	public class HumanReadableName: NativeTypeWrapper {

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

		internal var cType: LDKHumanReadableName?

		internal init(cType: LDKHumanReadableName, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKHumanReadableName, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKHumanReadableName, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the HumanReadableName, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = HumanReadableName_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the HumanReadableName
		internal func clone() -> HumanReadableName {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHumanReadableName>) in
					HumanReadableName_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HumanReadableName(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the HumanReadableName.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKHumanReadableName>) in
					HumanReadableName_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two HumanReadableNames contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: HumanReadableName, b: HumanReadableName) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHumanReadableName>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHumanReadableName>) in
						HumanReadableName_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new [`HumanReadableName`] from the `user` and `domain` parts. See the
		/// struct-level documentation for more on the requirements on each.
		public class func new(user: String, domain: String) -> Result_HumanReadableNameNoneZ {
			// native call variable prep

			let userPrimitiveWrapper = Str(
				value: user, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)"
			)
			.dangle()

			let domainPrimitiveWrapper = Str(
				value: domain, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = HumanReadableName_new(userPrimitiveWrapper.cType!, domainPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			userPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			domainPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HumanReadableNameNoneZ(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Constructs a new [`HumanReadableName`] from the standard encoding - `user`@`domain`.
		///
		/// If `user` includes the standard BIP 353 ₿ prefix it is automatically removed as required by
		/// BIP 353.
		public class func fromEncoded(encoded: String) -> Result_HumanReadableNameNoneZ {
			// native call variable prep

			let encodedPrimitiveWrapper = Str(
				value: encoded, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = HumanReadableName_from_encoded(encodedPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			encodedPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HumanReadableNameNoneZ(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Gets the `user` part of this Human Readable Name
		public func user() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHumanReadableName>) in
					HumanReadableName_user(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Gets the `domain` part of this Human Readable Name
		public func domain() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHumanReadableName>) in
					HumanReadableName_domain(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the HumanReadableName object into a byte array which can be read by HumanReadableName_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHumanReadableName>) in
					HumanReadableName_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a HumanReadableName from a byte array, created by HumanReadableName_write
		public class func read(ser: [UInt8]) -> Result_HumanReadableNameDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HumanReadableName_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HumanReadableNameDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "HumanReadableName.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> HumanReadableName {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> HumanReadableName {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> HumanReadableName {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> HumanReadableName {
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
						"Freeing HumanReadableName \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing HumanReadableName \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

