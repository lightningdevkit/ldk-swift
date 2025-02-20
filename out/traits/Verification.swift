// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait defining behavior for creating and verifing the HMAC for authenticating a given data.
public typealias Verification = Bindings.Verification

extension Bindings {

	/// A trait defining behavior for creating and verifing the HMAC for authenticating a given data.
	open class Verification: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKVerification?

		internal init(cType: LDKVerification, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKVerification, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKVerification, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
					conflictAvoidingVariableName: 0, instantiationContext: "Verification.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func hmacForOfferPaymentLambda(
				this_arg: UnsafeRawPointer?, nonce: LDKNonce, expanded_key: UnsafePointer<LDKExpandedKey>
			) -> LDKThirtyTwoBytes {
				let instance: Verification = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Verification::hmacForOfferPaymentLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.hmacForOfferPayment(
					nonce: Nonce(
						cType: nonce, instantiationContext: "Verification.swift::init()::\(#function):\(#line)"),
					expandedKey: ExpandedKey(
						cType: expanded_key.pointee,
						instantiationContext: "Verification.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					value: swiftCallbackResult,
					instantiationContext: "Verification.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func verifyForOfferPaymentLambda(
				this_arg: UnsafeRawPointer?, hmac: LDKThirtyTwoBytes, nonce: LDKNonce,
				expanded_key: UnsafePointer<LDKExpandedKey>
			) -> LDKCResult_NoneNoneZ {
				let instance: Verification = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Verification::verifyForOfferPaymentLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.verifyForOfferPayment(
					hmac: ThirtyTwoBytes(
						cType: hmac, instantiationContext: "Verification.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					nonce: Nonce(
						cType: nonce, instantiationContext: "Verification.swift::init()::\(#function):\(#line)"),
					expandedKey: ExpandedKey(
						cType: expanded_key.pointee,
						instantiationContext: "Verification.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: Verification = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Verification::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKVerification(
				this_arg: thisArg,
				hmac_for_offer_payment: hmacForOfferPaymentLambda,
				verify_for_offer_payment: verifyForOfferPaymentLambda,
				free: freeLambda
			)
		}


		/// Constructs an HMAC to include in [`OffersContext`] for the data along with the given
		/// [`Nonce`].
		open func hmacForOfferPayment(nonce: Nonce, expandedKey: ExpandedKey) -> [UInt8] {

			Bindings.print(
				"Error: Verification::hmacForOfferPayment MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Authenticates the data using an HMAC and a [`Nonce`] taken from an [`OffersContext`].
		open func verifyForOfferPayment(hmac: [UInt8], nonce: Nonce, expandedKey: ExpandedKey) -> Result_NoneNoneZ {

			Bindings.print(
				"Error: Verification::verifyForOfferPayment MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: Verification::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Verification \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Verification \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedVerification: Verification {

		/// Constructs an HMAC to include in [`OffersContext`] for the data along with the given
		/// [`Nonce`].
		public override func hmacForOfferPayment(nonce: Nonce, expandedKey: ExpandedKey) -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: expandedKey.cType!) { (expandedKeyPointer: UnsafePointer<LDKExpandedKey>) in
					self.cType!
						.hmac_for_offer_payment(
							self.cType!.this_arg, nonce.dynamicallyDangledClone().cType!, expandedKeyPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "Verification.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Authenticates the data using an HMAC and a [`Nonce`] taken from an [`OffersContext`].
		public override func verifyForOfferPayment(hmac: [UInt8], nonce: Nonce, expandedKey: ExpandedKey)
			-> Result_NoneNoneZ
		{
			// native call variable prep

			let hmacPrimitiveWrapper = ThirtyTwoBytes(
				value: hmac, instantiationContext: "Verification.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: expandedKey.cType!) { (expandedKeyPointer: UnsafePointer<LDKExpandedKey>) in
					self.cType!
						.verify_for_offer_payment(
							self.cType!.this_arg, hmacPrimitiveWrapper.cType!, nonce.dynamicallyDangledClone().cType!,
							expandedKeyPointer)
				}


			// cleanup

			// for elided types, we need this
			hmacPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "Verification.swift::\(#function):\(#line)")

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
