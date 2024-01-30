#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A wrapper around [`ChannelInfo`] representing information about the channel as directed from a
/// source node to a target node.
public typealias DirectedChannelInfo = Bindings.DirectedChannelInfo

extension Bindings {


	/// A wrapper around [`ChannelInfo`] representing information about the channel as directed from a
	/// source node to a target node.
	public class DirectedChannelInfo: NativeTypeWrapper {

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

		internal var cType: LDKDirectedChannelInfo?

		internal init(cType: LDKDirectedChannelInfo, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDirectedChannelInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDirectedChannelInfo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the DirectedChannelInfo, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DirectedChannelInfo_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the DirectedChannelInfo
		internal func clone() -> DirectedChannelInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDirectedChannelInfo>) in
					DirectedChannelInfo_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = DirectedChannelInfo(
				cType: nativeCallResult, instantiationContext: "DirectedChannelInfo.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns information for the channel.
		public func channel() -> ChannelInfo {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelInfo>) in
					DirectedChannelInfo_channel(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelInfo(
				cType: nativeCallResult, instantiationContext: "DirectedChannelInfo.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns the [`EffectiveCapacity`] of the channel in the direction.
		///
		/// This is either the total capacity from the funding transaction, if known, or the
		/// `htlc_maximum_msat` for the direction as advertised by the gossip network, if known,
		/// otherwise.
		public func effectiveCapacity() -> EffectiveCapacity {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelInfo>) in
					DirectedChannelInfo_effective_capacity(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = EffectiveCapacity(
				cType: nativeCallResult, instantiationContext: "DirectedChannelInfo.swift::\(#function):\(#line)",
				anchor: self)


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


		internal func danglingClone() -> DirectedChannelInfo {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> DirectedChannelInfo {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> DirectedChannelInfo {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> DirectedChannelInfo {
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
						"Freeing DirectedChannelInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DirectedChannelInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

