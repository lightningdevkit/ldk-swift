#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A wrapper over [`WalletSource`] that implements [`CoinSelection`] by preferring UTXOs that would
/// avoid conflicting double spends. If not enough UTXOs are available to do so, conflicting double
/// spends may happen.
public typealias Wallet = Bindings.Wallet

extension Bindings {


	/// A wrapper over [`WalletSource`] that implements [`CoinSelection`] by preferring UTXOs that would
	/// avoid conflicting double spends. If not enough UTXOs are available to do so, conflicting double
	/// spends may happen.
	public class Wallet: NativeTypeWrapper {

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

		internal var cType: LDKWallet?

		internal init(cType: LDKWallet, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKWallet, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKWallet, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the Wallet, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Wallet_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns a new instance backed by the given [`WalletSource`] that serves as an implementation
		/// of [`CoinSelectionSource`].
		public init(source: WalletSource, logger: Logger) {
			// native call variable prep


			// native method call
			let nativeCallResult = Wallet_new(source.activate().cType!, logger.activate().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = Wallet(cType: nativeCallResult, instantiationContext: "Wallet.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "Wallet.swift::\(#function):\(#line)")


		}

		/// Constructs a new CoinSelectionSource which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned CoinSelectionSource must be freed before this_arg is
		public func asCoinSelectionSource() -> CoinSelectionSource {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKWallet>) in
					Wallet_as_CoinSelectionSource(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedCoinSelectionSource(
				cType: nativeCallResult, instantiationContext: "Wallet.swift::\(#function):\(#line)", anchor: self)


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


		internal func setCFreeability(freeable: Bool) -> Wallet {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Wallet {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Wallet \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Wallet \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}


}

