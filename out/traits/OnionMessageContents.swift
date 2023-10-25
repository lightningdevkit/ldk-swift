// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// The contents of an onion message.
public typealias OnionMessageContents = Bindings.OnionMessageContents

extension Bindings {

	/// The contents of an onion message.
	open class OnionMessageContents: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKOnionMessageContents?

		internal init(cType: LDKOnionMessageContents, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOnionMessageContents, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOnionMessageContents, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func tlvTypeLambda(this_arg: UnsafeRawPointer?) -> UInt64 {
				let instance: OnionMessageContents = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OnionMessageContents::tlvTypeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.tlvType()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: OnionMessageContents = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OnionMessageContents::writeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.write()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_u8Z(
					array: swiftCallbackResult,
					instantiationContext: "OnionMessageContents.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: OnionMessageContents = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "OnionMessageContents::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKOnionMessageContents(
				this_arg: thisArg,
				tlv_type: tlvTypeLambda,
				write: writeLambda,
				cloned: nil,
				free: freeLambda
			)
		}


		/// Returns the TLV type identifying the message contents. MUST be >= 64.
		open func tlvType() -> UInt64 {

			Bindings.print(
				"Error: OnionMessageContents::tlvType MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Serialize the object into a byte array
		open func write() -> [UInt8] {

			Bindings.print(
				"Error: OnionMessageContents::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: OnionMessageContents::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Creates a copy of a OnionMessageContents
		internal func clone() -> OnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOnionMessageContents>) in
					OnionMessageContents_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)")


			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing OnionMessageContents \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OnionMessageContents \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedOnionMessageContents: OnionMessageContents {

		/// Returns the TLV type identifying the message contents. MUST be >= 64.
		public override func tlvType() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.tlv_type(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

		/// Serialize the object into a byte array
		public override func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.write(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OnionMessageContents.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		public override func free() {
			// native call variable prep


			// natively wrapped traits may not necessarily be properly initialized
			// for now just don't free these things
			// self.cType?.free(self.cType?.this_arg)
			return


			// native method call
			let nativeCallResult = self.cType!.free(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

	}

}
