// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// The `Listen` trait is used to notify when blocks have been connected or disconnected from the
/// chain.
///
/// Useful when needing to replay chain data upon startup or as new chain events occur. Clients
/// sourcing chain data using a block-oriented API should prefer this interface over [`Confirm`].
/// Such clients fetch the entire header chain whereas clients using [`Confirm`] only fetch headers
/// when needed.
///
/// By using [`Listen::filtered_block_connected`] this interface supports clients fetching the
/// entire header chain and only blocks with matching transaction data using BIP 157 filters or
/// other similar filtering.
public typealias Listen = Bindings.Listen

extension Bindings {

	/// The `Listen` trait is used to notify when blocks have been connected or disconnected from the
	/// chain.
	///
	/// Useful when needing to replay chain data upon startup or as new chain events occur. Clients
	/// sourcing chain data using a block-oriented API should prefer this interface over [`Confirm`].
	/// Such clients fetch the entire header chain whereas clients using [`Confirm`] only fetch headers
	/// when needed.
	///
	/// By using [`Listen::filtered_block_connected`] this interface supports clients fetching the
	/// entire header chain and only blocks with matching transaction data using BIP 157 filters or
	/// other similar filtering.
	open class Listen: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKListen?

		internal init(cType: LDKListen, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKListen, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKListen, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "Listen.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func filteredBlockConnectedLambda(
				this_arg: UnsafeRawPointer?, header: UnsafePointer<UInt8Tuple80>?,
				txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32
			) {
				let instance: Listen = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Listen::filteredBlockConnectedLambda")

				// Swift callback variable prep

				var headerPointee: [UInt8]? = nil
				if let headerUnwrapped = header {
					headerPointee = Bindings.UInt8Tuple80ToArray(tuple: headerUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.filteredBlockConnected(
					header: headerPointee,
					txdata: Vec_C2Tuple_usizeTransactionZZ(
						cType: txdata, instantiationContext: "Listen.swift::init()::\(#function):\(#line)"
					)
					.getValue(), height: height)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func blockConnectedLambda(this_arg: UnsafeRawPointer?, block: LDKu8slice, height: UInt32) {
				let instance: Listen = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Listen::blockConnectedLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.blockConnected(
					block: u8slice(cType: block, instantiationContext: "Listen.swift::init()::\(#function):\(#line)")
						.dangle().getValue(), height: height)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func blockDisconnectedLambda(
				this_arg: UnsafeRawPointer?, header: UnsafePointer<UInt8Tuple80>?, height: UInt32
			) {
				let instance: Listen = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Listen::blockDisconnectedLambda")

				// Swift callback variable prep

				var headerPointee: [UInt8]? = nil
				if let headerUnwrapped = header {
					headerPointee = Bindings.UInt8Tuple80ToArray(tuple: headerUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.blockDisconnected(header: headerPointee, height: height)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: Listen = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Listen::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKListen(
				this_arg: thisArg,
				filtered_block_connected: filteredBlockConnectedLambda,
				block_connected: blockConnectedLambda,
				block_disconnected: blockDisconnectedLambda,
				free: freeLambda
			)
		}


		/// Notifies the listener that a block was added at the given height, with the transaction data
		/// possibly filtered.
		open func filteredBlockConnected(header: [UInt8]?, txdata: [(UInt, [UInt8])], height: UInt32) {

			Bindings.print(
				"Error: Listen::filteredBlockConnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Notifies the listener that a block was added at the given height.
		open func blockConnected(block: [UInt8], height: UInt32) {

			Bindings.print(
				"Error: Listen::blockConnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Notifies the listener that a block was removed at the given height.
		open func blockDisconnected(header: [UInt8]?, height: UInt32) {

			Bindings.print(
				"Error: Listen::blockDisconnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: Listen::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Listen \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Listen \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}
	}

	internal class NativelyImplementedListen: Listen {

		/// Notifies the listener that a block was added at the given height, with the transaction data
		/// possibly filtered.
		public override func filteredBlockConnected(header: [UInt8]?, txdata: [(UInt, [UInt8])], height: UInt32) {
			// native call variable prep

			var tupledHeaderPointer: UnsafeMutablePointer<UInt8Tuple80>? = nil
			if let header = header {

				let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)

				tupledHeaderPointer = UnsafeMutablePointer<UInt8Tuple80>.allocate(capacity: 1)
				tupledHeaderPointer!.initialize(to: tupledHeader)
			}

			let txdataVector = Vec_C2Tuple_usizeTransactionZZ(
				array: txdata, instantiationContext: "Listen.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.filtered_block_connected(self.cType!.this_arg, tupledHeaderPointer, txdataVector.cType!, height)

			// cleanup

			// txdataVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

		/// Notifies the listener that a block was added at the given height.
		public override func blockConnected(block: [UInt8], height: UInt32) {
			// native call variable prep

			let blockPrimitiveWrapper = u8slice(
				value: block, instantiationContext: "Listen.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = self.cType!
				.block_connected(self.cType!.this_arg, blockPrimitiveWrapper.cType!, height)

			// cleanup

			// for elided types, we need this
			blockPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

		/// Notifies the listener that a block was removed at the given height.
		public override func blockDisconnected(header: [UInt8]?, height: UInt32) {
			// native call variable prep

			var tupledHeaderPointer: UnsafeMutablePointer<UInt8Tuple80>? = nil
			if let header = header {

				let tupledHeader = Bindings.arrayToUInt8Tuple80(array: header)

				tupledHeaderPointer = UnsafeMutablePointer<UInt8Tuple80>.allocate(capacity: 1)
				tupledHeaderPointer!.initialize(to: tupledHeader)
			}


			// native method call
			let nativeCallResult = self.cType!.block_disconnected(self.cType!.this_arg, tupledHeaderPointer, height)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

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
