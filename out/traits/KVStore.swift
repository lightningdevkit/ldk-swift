// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Provides an interface that allows storage and retrieval of persisted values that are associated
/// with given keys.
///
/// In order to avoid collisions the key space is segmented based on the given `primary_namespace`s
/// and `sub_namespace`s. Implementations of this trait are free to handle them in different ways,
/// as long as per-namespace key uniqueness is asserted.
///
/// Keys and namespaces are required to be valid ASCII strings in the range of
/// [`KVSTORE_NAMESPACE_KEY_ALPHABET`] and no longer than [`KVSTORE_NAMESPACE_KEY_MAX_LEN`]. Empty
/// primary namespaces and sub-namespaces (`\"\"`) are assumed to be a valid, however, if
/// `primary_namespace` is empty, `sub_namespace` is required to be empty, too. This means that
/// concerns should always be separated by primary namespace first, before sub-namespaces are used.
/// While the number of primary namespaces will be relatively small and is determined at compile
/// time, there may be many sub-namespaces per primary namespace. Note that per-namespace
/// uniqueness needs to also hold for keys *and* namespaces in any given namespace, i.e., conflicts
/// between keys and equally named primary-namespaces/sub-namespaces must be avoided.
///
/// **Note:** Users migrating custom persistence backends from the pre-v0.0.117 `KVStorePersister`
/// interface can use a concatenation of `[{primary_namespace}/[{sub_namespace}/]]{key}` to recover
/// a `key` compatible with the data model previously assumed by `KVStorePersister::persist`.
public typealias KVStore = Bindings.KVStore

extension Bindings {

	/// Provides an interface that allows storage and retrieval of persisted values that are associated
	/// with given keys.
	///
	/// In order to avoid collisions the key space is segmented based on the given `primary_namespace`s
	/// and `sub_namespace`s. Implementations of this trait are free to handle them in different ways,
	/// as long as per-namespace key uniqueness is asserted.
	///
	/// Keys and namespaces are required to be valid ASCII strings in the range of
	/// [`KVSTORE_NAMESPACE_KEY_ALPHABET`] and no longer than [`KVSTORE_NAMESPACE_KEY_MAX_LEN`]. Empty
	/// primary namespaces and sub-namespaces (`\"\"`) are assumed to be a valid, however, if
	/// `primary_namespace` is empty, `sub_namespace` is required to be empty, too. This means that
	/// concerns should always be separated by primary namespace first, before sub-namespaces are used.
	/// While the number of primary namespaces will be relatively small and is determined at compile
	/// time, there may be many sub-namespaces per primary namespace. Note that per-namespace
	/// uniqueness needs to also hold for keys *and* namespaces in any given namespace, i.e., conflicts
	/// between keys and equally named primary-namespaces/sub-namespaces must be avoided.
	///
	/// **Note:** Users migrating custom persistence backends from the pre-v0.0.117 `KVStorePersister`
	/// interface can use a concatenation of `[{primary_namespace}/[{sub_namespace}/]]{key}` to recover
	/// a `key` compatible with the data model previously assumed by `KVStorePersister::persist`.
	open class KVStore: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKKVStore?

		internal init(cType: LDKKVStore, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKKVStore, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKKVStore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false)
		{
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
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "KVStore.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func readLambda(this_arg: UnsafeRawPointer?, primary_namespace: LDKStr, sub_namespace: LDKStr, key: LDKStr)
				-> LDKCResult_CVec_u8ZIOErrorZ
			{
				let instance: KVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "KVStore::readLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.read(
					primaryNamespace: Str(
						cType: primary_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					subNamespace: Str(
						cType: sub_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					key: Str(cType: key, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)")
						.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func writeLambda(
				this_arg: UnsafeRawPointer?, primary_namespace: LDKStr, sub_namespace: LDKStr, key: LDKStr,
				buf: LDKu8slice
			) -> LDKCResult_NoneIOErrorZ {
				let instance: KVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "KVStore::writeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.write(
					primaryNamespace: Str(
						cType: primary_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					subNamespace: Str(
						cType: sub_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					key: Str(cType: key, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)")
						.getValue(),
					buf: u8slice(cType: buf, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)")
						.dangle().getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func removeLambda(
				this_arg: UnsafeRawPointer?, primary_namespace: LDKStr, sub_namespace: LDKStr, key: LDKStr, lazy: Bool
			) -> LDKCResult_NoneIOErrorZ {
				let instance: KVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "KVStore::removeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.remove(
					primaryNamespace: Str(
						cType: primary_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					subNamespace: Str(
						cType: sub_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					key: Str(cType: key, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)")
						.getValue(), lazy: lazy)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func listLambda(this_arg: UnsafeRawPointer?, primary_namespace: LDKStr, sub_namespace: LDKStr)
				-> LDKCResult_CVec_StrZIOErrorZ
			{
				let instance: KVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "KVStore::listLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.list(
					primaryNamespace: Str(
						cType: primary_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					subNamespace: Str(
						cType: sub_namespace, instantiationContext: "KVStore.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: KVStore = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "KVStore::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKKVStore(
				this_arg: thisArg,
				read: readLambda,
				write: writeLambda,
				remove: removeLambda,
				list: listLambda,
				free: freeLambda
			)
		}


		/// Returns the data stored for the given `primary_namespace`, `sub_namespace`, and `key`.
		///
		/// Returns an [`ErrorKind::NotFound`] if the given `key` could not be found in the given
		/// `primary_namespace` and `sub_namespace`.
		///
		/// [`ErrorKind::NotFound`]: io::ErrorKind::NotFound
		open func read(primaryNamespace: String, subNamespace: String, key: String) -> Result_CVec_u8ZIOErrorZ {

			Bindings.print(
				"Error: KVStore::read MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Persists the given data under the given `key`.
		///
		/// Will create the given `primary_namespace` and `sub_namespace` if not already present in the
		/// store.
		open func write(primaryNamespace: String, subNamespace: String, key: String, buf: [UInt8])
			-> Result_NoneIOErrorZ
		{

			Bindings.print(
				"Error: KVStore::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Removes any data that had previously been persisted under the given `key`.
		///
		/// If the `lazy` flag is set to `true`, the backend implementation might choose to lazily
		/// remove the given `key` at some point in time after the method returns, e.g., as part of an
		/// eventual batch deletion of multiple keys. As a consequence, subsequent calls to
		/// [`KVStore::list`] might include the removed key until the changes are actually persisted.
		///
		/// Note that while setting the `lazy` flag reduces the I/O burden of multiple subsequent
		/// `remove` calls, it also influences the atomicity guarantees as lazy `remove`s could
		/// potentially get lost on crash after the method returns. Therefore, this flag should only be
		/// set for `remove` operations that can be safely replayed at a later time.
		///
		/// Returns successfully if no data will be stored for the given `primary_namespace`,
		/// `sub_namespace`, and `key`, independently of whether it was present before its invokation
		/// or not.
		open func remove(primaryNamespace: String, subNamespace: String, key: String, lazy: Bool) -> Result_NoneIOErrorZ
		{

			Bindings.print(
				"Error: KVStore::remove MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Returns a list of keys that are stored under the given `sub_namespace` in
		/// `primary_namespace`.
		///
		/// Returns the keys in arbitrary order, so users requiring a particular order need to sort the
		/// returned keys. Returns an empty list if `primary_namespace` or `sub_namespace` is unknown.
		open func list(primaryNamespace: String, subNamespace: String) -> Result_CVec_StrZIOErrorZ {

			Bindings.print(
				"Error: KVStore::list MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: KVStore::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing KVStore \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing KVStore \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}
	}

	internal class NativelyImplementedKVStore: KVStore {

		/// Returns the data stored for the given `primary_namespace`, `sub_namespace`, and `key`.
		///
		/// Returns an [`ErrorKind::NotFound`] if the given `key` could not be found in the given
		/// `primary_namespace` and `sub_namespace`.
		///
		/// [`ErrorKind::NotFound`]: io::ErrorKind::NotFound
		public override func read(primaryNamespace: String, subNamespace: String, key: String)
			-> Result_CVec_u8ZIOErrorZ
		{
			// native call variable prep

			let primaryNamespacePrimitiveWrapper = Str(
				value: primaryNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let subNamespacePrimitiveWrapper = Str(
				value: subNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let keyPrimitiveWrapper = Str(value: key, instantiationContext: "KVStore.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.read(
					self.cType!.this_arg, primaryNamespacePrimitiveWrapper.cType!, subNamespacePrimitiveWrapper.cType!,
					keyPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			primaryNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			subNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			keyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_CVec_u8ZIOErrorZ(
				cType: nativeCallResult, instantiationContext: "KVStore.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Persists the given data under the given `key`.
		///
		/// Will create the given `primary_namespace` and `sub_namespace` if not already present in the
		/// store.
		public override func write(primaryNamespace: String, subNamespace: String, key: String, buf: [UInt8])
			-> Result_NoneIOErrorZ
		{
			// native call variable prep

			let primaryNamespacePrimitiveWrapper = Str(
				value: primaryNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let subNamespacePrimitiveWrapper = Str(
				value: subNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let keyPrimitiveWrapper = Str(value: key, instantiationContext: "KVStore.swift::\(#function):\(#line)")
				.dangle()

			let bufPrimitiveWrapper = u8slice(value: buf, instantiationContext: "KVStore.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = self.cType!
				.write(
					self.cType!.this_arg, primaryNamespacePrimitiveWrapper.cType!, subNamespacePrimitiveWrapper.cType!,
					keyPrimitiveWrapper.cType!, bufPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			primaryNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			subNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			keyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			bufPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneIOErrorZ(
				cType: nativeCallResult, instantiationContext: "KVStore.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Removes any data that had previously been persisted under the given `key`.
		///
		/// If the `lazy` flag is set to `true`, the backend implementation might choose to lazily
		/// remove the given `key` at some point in time after the method returns, e.g., as part of an
		/// eventual batch deletion of multiple keys. As a consequence, subsequent calls to
		/// [`KVStore::list`] might include the removed key until the changes are actually persisted.
		///
		/// Note that while setting the `lazy` flag reduces the I/O burden of multiple subsequent
		/// `remove` calls, it also influences the atomicity guarantees as lazy `remove`s could
		/// potentially get lost on crash after the method returns. Therefore, this flag should only be
		/// set for `remove` operations that can be safely replayed at a later time.
		///
		/// Returns successfully if no data will be stored for the given `primary_namespace`,
		/// `sub_namespace`, and `key`, independently of whether it was present before its invokation
		/// or not.
		public override func remove(primaryNamespace: String, subNamespace: String, key: String, lazy: Bool)
			-> Result_NoneIOErrorZ
		{
			// native call variable prep

			let primaryNamespacePrimitiveWrapper = Str(
				value: primaryNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let subNamespacePrimitiveWrapper = Str(
				value: subNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let keyPrimitiveWrapper = Str(value: key, instantiationContext: "KVStore.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.remove(
					self.cType!.this_arg, primaryNamespacePrimitiveWrapper.cType!, subNamespacePrimitiveWrapper.cType!,
					keyPrimitiveWrapper.cType!, lazy)

			// cleanup

			// for elided types, we need this
			primaryNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			subNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			keyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneIOErrorZ(
				cType: nativeCallResult, instantiationContext: "KVStore.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Returns a list of keys that are stored under the given `sub_namespace` in
		/// `primary_namespace`.
		///
		/// Returns the keys in arbitrary order, so users requiring a particular order need to sort the
		/// returned keys. Returns an empty list if `primary_namespace` or `sub_namespace` is unknown.
		public override func list(primaryNamespace: String, subNamespace: String) -> Result_CVec_StrZIOErrorZ {
			// native call variable prep

			let primaryNamespacePrimitiveWrapper = Str(
				value: primaryNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()

			let subNamespacePrimitiveWrapper = Str(
				value: subNamespace, instantiationContext: "KVStore.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.list(
					self.cType!.this_arg, primaryNamespacePrimitiveWrapper.cType!, subNamespacePrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			primaryNamespacePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			subNamespacePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_CVec_StrZIOErrorZ(
				cType: nativeCallResult, instantiationContext: "KVStore.swift::\(#function):\(#line)")

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
