#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// The `Responder` struct creates an appropriate [`ResponseInstruction`] for responding to a
/// message.
public typealias Responder = Bindings.Responder

extension Bindings {


	/// The `Responder` struct creates an appropriate [`ResponseInstruction`] for responding to a
	/// message.
	public class Responder: NativeTypeWrapper {

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

		internal var cType: LDKResponder?

		internal init(cType: LDKResponder, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKResponder, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKResponder, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Responder, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Responder_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Responder
		internal func clone() -> Responder {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKResponder>) in
					Responder_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Responder(
				cType: nativeCallResult, instantiationContext: "Responder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Responders contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: Responder, b: Responder) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKResponder>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKResponder>) in
						Responder_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the Responder object into a byte array which can be read by Responder_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKResponder>) in
					Responder_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Responder.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a Responder from a byte array, created by Responder_write
		public class func read(ser: [UInt8]) -> Result_ResponderDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "Responder.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Responder_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ResponderDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "Responder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a [`ResponseInstruction`] for responding without including a reply path.
		///
		/// Use when the recipient doesn't need to send back a reply to us.
		public func respond() -> ResponseInstruction {
			// native call variable prep


			// native method call
			let nativeCallResult = Responder_respond(self.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ResponseInstruction(
				cType: nativeCallResult, instantiationContext: "Responder.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a [`ResponseInstruction`] for responding including a reply path.
		///
		/// Use when the recipient needs to send back a reply to us.
		public func respondWithReplyPath(context: MessageContext) -> ResponseInstruction {
			// native call variable prep


			// native method call
			let nativeCallResult = Responder_respond_with_reply_path(
				self.dynamicallyDangledClone().cType!, context.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ResponseInstruction(
				cType: nativeCallResult, instantiationContext: "Responder.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> Responder {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> Responder {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> Responder {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Responder {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Responder \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Responder \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

