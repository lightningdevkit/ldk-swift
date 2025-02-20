#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A struct representing a name for a channel monitor update.
///
/// [`UpdateName`] is primarily used within the [`MonitorUpdatingPersister`] in
/// functions that store or retrieve partial updates to channel monitors. It
/// provides a consistent way to generate and parse unique identifiers for
/// monitor updates based on their sequence number.
///
/// The name is derived from the update's sequence ID, which is a monotonically
/// increasing u64 value. This format allows for easy ordering of updates and
/// efficient storage and retrieval in key-value stores.
///
/// # Usage
///
/// While users of the Lightning Dev Kit library generally won't need to
/// interact with `UpdateName` directly, it still can be useful for custom
/// persistence implementations. The u64 value is the update_id that can be
/// compared with [ChannelMonitor::get_latest_update_id] to check if this update
/// has been applied to the channel monitor or not, which is useful for pruning
/// stale channel monitor updates off persistence.
///
/// # Examples
///
/// ```
/// use lightning::util::persist::UpdateName;
///
/// let update_id: u64 = 42;
/// let update_name = UpdateName::from(update_id);
/// assert_eq!(update_name.as_str(), \"42\");
///
/// // Using UpdateName to generate a storage key
/// let monitor_name = \"some_monitor_name\";
/// let storage_key = format!(\"channel_monitor_updates/{}/{}\", monitor_name, update_name.as_str());
/// ```
public typealias UpdateName = Bindings.UpdateName

extension Bindings {


	/// A struct representing a name for a channel monitor update.
	///
	/// [`UpdateName`] is primarily used within the [`MonitorUpdatingPersister`] in
	/// functions that store or retrieve partial updates to channel monitors. It
	/// provides a consistent way to generate and parse unique identifiers for
	/// monitor updates based on their sequence number.
	///
	/// The name is derived from the update's sequence ID, which is a monotonically
	/// increasing u64 value. This format allows for easy ordering of updates and
	/// efficient storage and retrieval in key-value stores.
	///
	/// # Usage
	///
	/// While users of the Lightning Dev Kit library generally won't need to
	/// interact with `UpdateName` directly, it still can be useful for custom
	/// persistence implementations. The u64 value is the update_id that can be
	/// compared with [ChannelMonitor::get_latest_update_id] to check if this update
	/// has been applied to the channel monitor or not, which is useful for pruning
	/// stale channel monitor updates off persistence.
	///
	/// # Examples
	///
	/// ```
	/// use lightning::util::persist::UpdateName;
	///
	/// let update_id: u64 = 42;
	/// let update_name = UpdateName::from(update_id);
	/// assert_eq!(update_name.as_str(), \"42\");
	///
	/// // Using UpdateName to generate a storage key
	/// let monitor_name = \"some_monitor_name\";
	/// let storage_key = format!(\"channel_monitor_updates/{}/{}\", monitor_name, update_name.as_str());
	/// ```
	public class UpdateName: NativeTypeWrapper {

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

		internal var cType: LDKUpdateName?

		internal init(cType: LDKUpdateName, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKUpdateName, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKUpdateName, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the UpdateName, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = UpdateName_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func getA() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUpdateName>) in
					UpdateName_get_a(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		///
		public func setA(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUpdateName>) in
					UpdateName_set_a(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs an [`UpdateName`], after verifying that an update sequence ID
		/// can be derived from the given `name`.
		public class func new(name: String) -> Result_UpdateNameIOErrorZ {
			// native call variable prep

			let namePrimitiveWrapper = Str(value: name, instantiationContext: "UpdateName.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = UpdateName_new(namePrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			namePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_UpdateNameIOErrorZ(
				cType: nativeCallResult, instantiationContext: "UpdateName.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Convert this update name to a string slice.
		///
		/// This method is particularly useful when you need to use the update name
		/// as part of a key in a key-value store or when logging.
		///
		/// # Examples
		///
		/// ```
		/// use lightning::util::persist::UpdateName;
		///
		/// let update_name = UpdateName::from(42);
		/// assert_eq!(update_name.as_str(), \"42\");
		/// ```
		public func asStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUpdateName>) in
					UpdateName_as_str(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "UpdateName.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


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


		internal func setCFreeability(freeable: Bool) -> UpdateName {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> UpdateName {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing UpdateName \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing UpdateName \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

