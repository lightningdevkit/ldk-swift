// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Defines a type identifier for sending messages over the wire.
///
/// Messages implementing this trait specify a type and must be [`Writeable`].
public typealias BindingsType = Bindings.BindingsType

extension Bindings {

	/// Defines a type identifier for sending messages over the wire.
	///
	/// Messages implementing this trait specify a type and must be [`Writeable`].
	open class BindingsType: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKType?

		internal init(cType: LDKType, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKType, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKType, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
					conflictAvoidingVariableName: 0, instantiationContext: "BindingsType.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func typeIdLambda(this_arg: UnsafeRawPointer?) -> UInt16 {
				let instance: BindingsType = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "BindingsType::typeIdLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.typeId()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func debugStrLambda(this_arg: UnsafeRawPointer?) -> LDKStr {
				let instance: BindingsType = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "BindingsType::debugStrLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.debugStr()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Str(
					value: swiftCallbackResult,
					instantiationContext: "BindingsType.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: BindingsType = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "BindingsType::writeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.write()

				// cleanup


				// return value (do some wrapping)
				let returnValue = Vec_u8Z(
					array: swiftCallbackResult,
					instantiationContext: "BindingsType.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: BindingsType = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "BindingsType::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKType(
				this_arg: thisArg,
				type_id: typeIdLambda,
				debug_str: debugStrLambda,
				write: writeLambda,
				cloned: nil,
				free: freeLambda
			)
		}


		/// Returns the type identifying the message payload.
		open func typeId() -> UInt16 {

			Bindings.print(
				"Error: BindingsType::typeId MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Return a human-readable "debug" string describing this object
		open func debugStr() -> String {

			Bindings.print(
				"Error: BindingsType::debugStr MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Serialize the object into a byte array
		open func write() -> [UInt8] {

			Bindings.print(
				"Error: BindingsType::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: BindingsType::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Creates a copy of a Type
		internal func clone() -> BindingsType {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKType>) in
					Type_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedBindingsType(
				cType: nativeCallResult, instantiationContext: "BindingsType.swift::\(#function):\(#line)")


			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing BindingsType \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BindingsType \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedBindingsType: BindingsType {

		/// Returns the type identifying the message payload.
		public override func typeId() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.type_id(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

		/// Return a human-readable "debug" string describing this object
		public override func debugStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.debug_str(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "BindingsType.swift::\(#function):\(#line)"
			)
			.getValue()

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
				cType: nativeCallResult, instantiationContext: "BindingsType.swift::\(#function):\(#line)"
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
