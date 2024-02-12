// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// An alternative to [`CoinSelectionSource`] that can be implemented and used along [`Wallet`] to
/// provide a default implementation to [`CoinSelectionSource`].
public typealias WalletSource = Bindings.WalletSource

extension Bindings {

	/// An alternative to [`CoinSelectionSource`] that can be implemented and used along [`Wallet`] to
	/// provide a default implementation to [`CoinSelectionSource`].
	open class WalletSource: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKWalletSource?

		internal init(cType: LDKWalletSource, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKWalletSource, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKWalletSource, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
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
					conflictAvoidingVariableName: 0, instantiationContext: "WalletSource.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func listConfirmedUtxosLambda(this_arg: UnsafeRawPointer?) -> LDKCResult_CVec_UtxoZNoneZ {
				let instance: WalletSource = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "WalletSource::listConfirmedUtxosLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.listConfirmedUtxos()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func getChangeScriptLambda(this_arg: UnsafeRawPointer?) -> LDKCResult_CVec_u8ZNoneZ {
				let instance: WalletSource = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "WalletSource::getChangeScriptLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getChangeScript()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func signPsbtLambda(this_arg: UnsafeRawPointer?, psbt: LDKCVec_u8Z) -> LDKCResult_TransactionNoneZ {
				let instance: WalletSource = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "WalletSource::signPsbtLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signPsbt(
					psbt: Vec_u8Z(
						cType: psbt, instantiationContext: "WalletSource.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: WalletSource = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "WalletSource::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKWalletSource(
				this_arg: thisArg,
				list_confirmed_utxos: listConfirmedUtxosLambda,
				get_change_script: getChangeScriptLambda,
				sign_psbt: signPsbtLambda,
				free: freeLambda
			)
		}


		/// Returns all UTXOs, with at least 1 confirmation each, that are available to spend.
		open func listConfirmedUtxos() -> Result_CVec_UtxoZNoneZ {

			Bindings.print(
				"Error: WalletSource::listConfirmedUtxos MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Returns a script to use for change above dust resulting from a successful coin selection
		/// attempt.
		open func getChangeScript() -> Result_CVec_u8ZNoneZ {

			Bindings.print(
				"Error: WalletSource::getChangeScript MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Signs and provides the full [`TxIn::script_sig`] and [`TxIn::witness`] for all inputs within
		/// the transaction known to the wallet (i.e., any provided via
		/// [`WalletSource::list_confirmed_utxos`]).
		///
		/// If your wallet does not support signing PSBTs you can call `psbt.extract_tx()` to get the
		/// unsigned transaction and then sign it with your wallet.
		open func signPsbt(psbt: [UInt8]) -> Result_TransactionNoneZ {

			Bindings.print(
				"Error: WalletSource::signPsbt MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: WalletSource::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
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
						"Freeing WalletSource \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing WalletSource \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedWalletSource: WalletSource {

		/// Returns all UTXOs, with at least 1 confirmation each, that are available to spend.
		public override func listConfirmedUtxos() -> Result_CVec_UtxoZNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.list_confirmed_utxos(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_CVec_UtxoZNoneZ(
				cType: nativeCallResult, instantiationContext: "WalletSource.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Returns a script to use for change above dust resulting from a successful coin selection
		/// attempt.
		public override func getChangeScript() -> Result_CVec_u8ZNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.get_change_script(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_CVec_u8ZNoneZ(
				cType: nativeCallResult, instantiationContext: "WalletSource.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Signs and provides the full [`TxIn::script_sig`] and [`TxIn::witness`] for all inputs within
		/// the transaction known to the wallet (i.e., any provided via
		/// [`WalletSource::list_confirmed_utxos`]).
		///
		/// If your wallet does not support signing PSBTs you can call `psbt.extract_tx()` to get the
		/// unsigned transaction and then sign it with your wallet.
		public override func signPsbt(psbt: [UInt8]) -> Result_TransactionNoneZ {
			// native call variable prep

			let psbtVector = Vec_u8Z(array: psbt, instantiationContext: "WalletSource.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = self.cType!.sign_psbt(self.cType!.this_arg, psbtVector.cType!)

			// cleanup

			// psbtVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_TransactionNoneZ(
				cType: nativeCallResult, instantiationContext: "WalletSource.swift::\(#function):\(#line)")

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
