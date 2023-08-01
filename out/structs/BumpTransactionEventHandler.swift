#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A handler for [`Event::BumpTransaction`] events that sources confirmed UTXOs from a
/// [`CoinSelectionSource`] to fee bump transactions via Child-Pays-For-Parent (CPFP) or
/// Replace-By-Fee (RBF).
///
/// [`Event::BumpTransaction`]: crate::events::Event::BumpTransaction
public typealias BumpTransactionEventHandler = Bindings.BumpTransactionEventHandler

extension Bindings {


	/// A handler for [`Event::BumpTransaction`] events that sources confirmed UTXOs from a
	/// [`CoinSelectionSource`] to fee bump transactions via Child-Pays-For-Parent (CPFP) or
	/// Replace-By-Fee (RBF).
	///
	/// [`Event::BumpTransaction`]: crate::events::Event::BumpTransaction
	public class BumpTransactionEventHandler: NativeTypeWrapper {

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

		internal var cType: LDKBumpTransactionEventHandler?

		internal init(cType: LDKBumpTransactionEventHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBumpTransactionEventHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBumpTransactionEventHandler, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BumpTransactionEventHandler, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BumpTransactionEventHandler_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns a new instance capable of handling [`Event::BumpTransaction`] events.
		///
		/// [`Event::BumpTransaction`]: crate::events::Event::BumpTransaction
		public init(
			broadcaster: BroadcasterInterface, utxoSource: CoinSelectionSource, signerProvider: SignerProvider,
			logger: Logger
		) {
			// native call variable prep


			// native method call
			let nativeCallResult = BumpTransactionEventHandler_new(
				broadcaster.activate().cType!, utxoSource.activate().cType!, signerProvider.activate().cType!,
				logger.activate().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = BumpTransactionEventHandler(cType: nativeCallResult, instantiationContext: "BumpTransactionEventHandler.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "BumpTransactionEventHandler.swift::\(#function):\(#line)")


		}

		/// Handles all variants of [`BumpTransactionEvent`].
		public func handleEvent(event: BumpTransactionEvent) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBumpTransactionEventHandler>) in

					withUnsafePointer(to: event.cType!) { (eventPointer: UnsafePointer<LDKBumpTransactionEvent>) in
						BumpTransactionEventHandler_handle_event(thisArgPointer, eventPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func setCFreeability(freeable: Bool) -> BumpTransactionEventHandler {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BumpTransactionEventHandler {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing BumpTransactionEventHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BumpTransactionEventHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

