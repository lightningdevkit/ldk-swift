// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait that describes a source of entropy.
public typealias EntropySource = Bindings.EntropySource

extension Bindings {

	/// A trait that describes a source of entropy.
	open class EntropySource: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKEntropySource?

		internal init(cType: LDKEntropySource, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKEntropySource, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKEntropySource, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
					conflictAvoidingVariableName: 0, instantiationContext: "EntropySource.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func getSecureRandomBytesLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
				let instance: EntropySource = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EntropySource::getSecureRandomBytesLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getSecureRandomBytes()

				// cleanup


				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					value: swiftCallbackResult,
					instantiationContext: "EntropySource.swift::init()::\(#function):\(#line)"
				)
				.dangle().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: EntropySource = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EntropySource::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKEntropySource(
				this_arg: thisArg,
				get_secure_random_bytes: getSecureRandomBytesLambda,
				free: freeLambda
			)
		}


		/// Gets a unique, cryptographically-secure, random 32-byte value. This method must return a
		/// different value each time it is called.
		open func getSecureRandomBytes() -> [UInt8] {

			Bindings.print(
				"Error: EntropySource::getSecureRandomBytes MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: EntropySource::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		internal func dangle(_ shouldDangle: Bool = true) -> EntropySource {
			self.dangling = shouldDangle
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing EntropySource \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing EntropySource \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedEntropySource: EntropySource {

		/// Gets a unique, cryptographically-secure, random 32-byte value. This method must return a
		/// different value each time it is called.
		public override func getSecureRandomBytes() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.get_secure_random_bytes(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "EntropySource.swift::\(#function):\(#line)"
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
