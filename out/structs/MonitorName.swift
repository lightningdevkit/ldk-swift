#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A struct representing a name for a channel monitor.
///
/// `MonitorName` is primarily used within the [`MonitorUpdatingPersister`]
/// in functions that store or retrieve channel monitor snapshots.
/// It provides a consistent way to generate a unique key for channel
/// monitors based on their funding outpoints.
///
/// While users of the Lightning Dev Kit library generally won't need
/// to interact with [`MonitorName`] directly, it can be useful for:
/// - Custom persistence implementations
/// - Debugging or logging channel monitor operations
/// - Extending the functionality of the `MonitorUpdatingPersister`
/// # Examples
///
/// ```
/// use std::str::FromStr;
///
/// use bitcoin::Txid;
///
/// use lightning::util::persist::MonitorName;
/// use lightning::chain::transaction::OutPoint;
///
/// let outpoint = OutPoint {
/// \t txid: Txid::from_str(\"deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef\").unwrap(),
/// \t index: 1,
/// };
/// let monitor_name = MonitorName::from(outpoint);
/// assert_eq!(monitor_name.as_str(), \"deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1\");
///
/// // Using MonitorName to generate a storage key
/// let storage_key = format!(\"channel_monitors/{}\", monitor_name.as_str());
/// ```
public typealias MonitorName = Bindings.MonitorName

extension Bindings {


	/// A struct representing a name for a channel monitor.
	///
	/// `MonitorName` is primarily used within the [`MonitorUpdatingPersister`]
	/// in functions that store or retrieve channel monitor snapshots.
	/// It provides a consistent way to generate a unique key for channel
	/// monitors based on their funding outpoints.
	///
	/// While users of the Lightning Dev Kit library generally won't need
	/// to interact with [`MonitorName`] directly, it can be useful for:
	/// - Custom persistence implementations
	/// - Debugging or logging channel monitor operations
	/// - Extending the functionality of the `MonitorUpdatingPersister`
	/// # Examples
	///
	/// ```
	/// use std::str::FromStr;
	///
	/// use bitcoin::Txid;
	///
	/// use lightning::util::persist::MonitorName;
	/// use lightning::chain::transaction::OutPoint;
	///
	/// let outpoint = OutPoint {
	/// \t txid: Txid::from_str(\"deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef\").unwrap(),
	/// \t index: 1,
	/// };
	/// let monitor_name = MonitorName::from(outpoint);
	/// assert_eq!(monitor_name.as_str(), \"deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1\");
	///
	/// // Using MonitorName to generate a storage key
	/// let storage_key = format!(\"channel_monitors/{}\", monitor_name.as_str());
	/// ```
	public class MonitorName: NativeTypeWrapper {

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

		internal var cType: LDKMonitorName?

		internal init(cType: LDKMonitorName, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMonitorName, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMonitorName, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the MonitorName, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = MonitorName_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a [`MonitorName`], after verifying that an [`OutPoint`] can
		/// be formed from the given `name`.
		/// This method is useful if you have a String and you want to verify that
		/// it's a valid storage key for a channel monitor.
		public class func new(name: String) -> Result_MonitorNameIOErrorZ {
			// native call variable prep

			let namePrimitiveWrapper = Str(
				value: name, instantiationContext: "MonitorName.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = MonitorName_new(namePrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			namePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_MonitorNameIOErrorZ(
				cType: nativeCallResult, instantiationContext: "MonitorName.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Convert this monitor name to a str.
		/// This method is particularly useful when you need to use the monitor name
		/// as a key in a key-value store or when logging.
		public func asStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMonitorName>) in
					MonitorName_as_str(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "MonitorName.swift::\(#function):\(#line)", anchor: self
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


		internal func setCFreeability(freeable: Bool) -> MonitorName {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> MonitorName {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing MonitorName \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MonitorName \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

