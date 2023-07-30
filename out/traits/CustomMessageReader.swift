// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Trait to be implemented by custom message (unrelated to the channel/gossip LN layers)
/// decoders.
public typealias CustomMessageReader = Bindings.CustomMessageReader

extension Bindings {

	/// Trait to be implemented by custom message (unrelated to the channel/gossip LN layers)
	/// decoders.
	open class CustomMessageReader: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCustomMessageReader?

		internal init(cType: LDKCustomMessageReader, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCustomMessageReader, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCustomMessageReader, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
					instantiationContext: "CustomMessageReader.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func readLambda(this_arg: UnsafeRawPointer?, message_type: UInt16, buffer: LDKu8slice)
				-> LDKCResult_COption_TypeZDecodeErrorZ
			{
				let instance: CustomMessageReader = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomMessageReader::readLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.read(
					messageType: message_type,
					buffer: u8slice(
						cType: buffer, instantiationContext: "CustomMessageReader.swift::init()::\(#function):\(#line)"
					)
					.dangle().getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: CustomMessageReader = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "CustomMessageReader::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKCustomMessageReader(
				this_arg: thisArg,
				read: readLambda,
				free: freeLambda
			)
		}


		/// Decodes a custom message to `CustomMessageType`. If the given message type is known to the
		/// implementation and the message could be decoded, must return `Ok(Some(message))`. If the
		/// message type is unknown to the implementation, must return `Ok(None)`. If a decoding error
		/// occur, must return `Err(DecodeError::X)` where `X` details the encountered error.
		open func read(messageType: UInt16, buffer: [UInt8]) -> Result_COption_TypeZDecodeErrorZ {

			Bindings.print(
				"Error: CustomMessageReader::read MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: CustomMessageReader::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		internal func dangle(_ shouldDangle: Bool = true) -> CustomMessageReader {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> CustomMessageReader {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing CustomMessageReader \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CustomMessageReader \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedCustomMessageReader: CustomMessageReader {

		/// Decodes a custom message to `CustomMessageType`. If the given message type is known to the
		/// implementation and the message could be decoded, must return `Ok(Some(message))`. If the
		/// message type is unknown to the implementation, must return `Ok(None)`. If a decoding error
		/// occur, must return `Err(DecodeError::X)` where `X` details the encountered error.
		public override func read(messageType: UInt16, buffer: [UInt8]) -> Result_COption_TypeZDecodeErrorZ {
			// native call variable prep

			let bufferPrimitiveWrapper = u8slice(
				value: buffer, instantiationContext: "CustomMessageReader.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = self.cType!.read(self.cType!.this_arg, messageType, bufferPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			bufferPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_COption_TypeZDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "CustomMessageReader.swift::\(#function):\(#line)")

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
