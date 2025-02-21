// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Provides additional interface methods that are required for [`KVStore`]-to-[`KVStore`]
/// data migration.
public typealias MigratableKVStore = Bindings.MigratableKVStore

extension Bindings {

	/// Provides additional interface methods that are required for [`KVStore`]-to-[`KVStore`]
	/// data migration.
	open class MigratableKVStore: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKMigratableKVStore?

		internal init(cType: LDKMigratableKVStore, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMigratableKVStore, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMigratableKVStore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init(kVStore: KVStore) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "MigratableKVStore.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func listAllKeysLambda(this_arg: UnsafeRawPointer?) -> LDKCResult_CVec_C3Tuple_StrStrStrZZIOErrorZ {
				let instance: MigratableKVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "MigratableKVStore::listAllKeysLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.listAllKeys()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: MigratableKVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "MigratableKVStore::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKMigratableKVStore(
				this_arg: thisArg,
				list_all_keys: listAllKeysLambda,
				KVStore: kVStore.activate().cType!,
				free: freeLambda
			)
		}


		/// Returns *all* known keys as a list of `primary_namespace`, `secondary_namespace`, `key` tuples.
		///
		/// This is useful for migrating data from [`KVStore`] implementation to [`KVStore`]
		/// implementation.
		///
		/// Must exhaustively return all entries known to the store to ensure no data is missed, but
		/// may return the items in arbitrary order.
		open func listAllKeys() -> Result_CVec_C3Tuple_StrStrStrZZIOErrorZ {

			Bindings.print(
				"Error: MigratableKVStore::listAllKeys MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: MigratableKVStore::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Implementation of KVStore for this object.
		public func getKVStore() -> KVStore {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedKVStore(
				cType: self.cType!.KVStore, instantiationContext: "MigratableKVStore.swift::\(#function):\(#line)",
				anchor: self)

			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing MigratableKVStore \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MigratableKVStore \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedMigratableKVStore: MigratableKVStore {

		/// Returns *all* known keys as a list of `primary_namespace`, `secondary_namespace`, `key` tuples.
		///
		/// This is useful for migrating data from [`KVStore`] implementation to [`KVStore`]
		/// implementation.
		///
		/// Must exhaustively return all entries known to the store to ensure no data is missed, but
		/// may return the items in arbitrary order.
		public override func listAllKeys() -> Result_CVec_C3Tuple_StrStrStrZZIOErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.list_all_keys(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_CVec_C3Tuple_StrStrStrZZIOErrorZ(
				cType: nativeCallResult, instantiationContext: "MigratableKVStore.swift::\(#function):\(#line)")

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
