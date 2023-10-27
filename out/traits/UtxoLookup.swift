// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// The `UtxoLookup` trait defines behavior for accessing on-chain UTXOs.
public typealias UtxoLookup = Bindings.UtxoLookup

extension Bindings {

	/// The `UtxoLookup` trait defines behavior for accessing on-chain UTXOs.
	open class UtxoLookup: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKUtxoLookup?

		internal init(cType: LDKUtxoLookup, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKUtxoLookup, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKUtxoLookup, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "UtxoLookup.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func getUtxoLambda(
				this_arg: UnsafeRawPointer?, chain_hash: UnsafePointer<UInt8Tuple32>?, short_channel_id: UInt64
			) -> LDKUtxoResult {
				let instance: UtxoLookup = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "UtxoLookup::getUtxoLambda")

				// Swift callback variable prep

				var chain_hashPointee: [UInt8]? = nil
				if let chain_hashUnwrapped = chain_hash {
					chain_hashPointee = Bindings.UInt8Tuple32ToArray(tuple: chain_hashUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.getUtxo(
					chainHash: chain_hashPointee, shortChannelId: short_channel_id)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: UtxoLookup = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "UtxoLookup::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKUtxoLookup(
				this_arg: thisArg,
				get_utxo: getUtxoLambda,
				free: freeLambda
			)
		}


		/// Returns the transaction output of a funding transaction encoded by [`short_channel_id`].
		/// Returns an error if `chain_hash` is for a different chain or if such a transaction output is
		/// unknown.
		///
		/// [`short_channel_id`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#definition-of-short_channel_id
		open func getUtxo(chainHash: [UInt8]?, shortChannelId: UInt64) -> UtxoResult {

			Bindings.print(
				"Error: UtxoLookup::getUtxo MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: UtxoLookup::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing UtxoLookup \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing UtxoLookup \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedUtxoLookup: UtxoLookup {

		/// Returns the transaction output of a funding transaction encoded by [`short_channel_id`].
		/// Returns an error if `chain_hash` is for a different chain or if such a transaction output is
		/// unknown.
		///
		/// [`short_channel_id`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#definition-of-short_channel_id
		public override func getUtxo(chainHash: [UInt8]?, shortChannelId: UInt64) -> UtxoResult {
			// native call variable prep

			var tupledChainHashPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
			if let chainHash = chainHash {

				let tupledChainHash = Bindings.arrayToUInt8Tuple32(array: chainHash)

				tupledChainHashPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
				tupledChainHashPointer!.initialize(to: tupledChainHash)
			}


			// native method call
			let nativeCallResult = self.cType!.get_utxo(self.cType!.this_arg, tupledChainHashPointer, shortChannelId)

			// cleanup


			// return value (do some wrapping)
			let returnValue = UtxoResult(
				cType: nativeCallResult, instantiationContext: "UtxoLookup.swift::\(#function):\(#line)")

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
