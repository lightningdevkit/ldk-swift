#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A path for sending an [`OnionMessage`].
public typealias OnionMessagePath = Bindings.OnionMessagePath

extension Bindings {


	/// A path for sending an [`OnionMessage`].
	public class OnionMessagePath: NativeTypeWrapper {

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

		internal var cType: LDKOnionMessagePath?

		internal init(cType: LDKOnionMessagePath, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOnionMessagePath, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOnionMessagePath, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OnionMessagePath, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OnionMessagePath_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Nodes on the path between the sender and the destination.
		///
		/// Returns a copy of the field.
		public func getIntermediateNodes() -> [[UInt8]] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOnionMessagePath>) in
					OnionMessagePath_get_intermediate_nodes(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_PublicKeyZ(
				cType: nativeCallResult, instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Nodes on the path between the sender and the destination.
		public func setIntermediateNodes(val: [[UInt8]]) {
			// native call variable prep

			let valVector = Vec_PublicKeyZ(
				array: val, instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOnionMessagePath>) in
					OnionMessagePath_set_intermediate_nodes(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The recipient of the message.
		public func getDestination() -> Destination {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOnionMessagePath>) in
					OnionMessagePath_get_destination(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Destination(
				cType: nativeCallResult, instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// The recipient of the message.
		public func setDestination(val: Destination) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKOnionMessagePath>) in
					OnionMessagePath_set_destination(thisPtrPointer, val.danglingClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new OnionMessagePath given each field
		public init(intermediateNodesArg: [[UInt8]], destinationArg: Destination) {
			// native call variable prep

			let intermediateNodesArgVector = Vec_PublicKeyZ(
				array: intermediateNodesArg, instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = OnionMessagePath_new(
				intermediateNodesArgVector.cType!, destinationArg.danglingClone().cType!)

			// cleanup

			// intermediateNodesArgVector.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = OnionMessagePath(cType: nativeCallResult, instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the OnionMessagePath
		internal func clone() -> OnionMessagePath {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOnionMessagePath>) in
					OnionMessagePath_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OnionMessagePath(
				cType: nativeCallResult, instantiationContext: "OnionMessagePath.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OnionMessagePath {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OnionMessagePath {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OnionMessagePath {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OnionMessagePath {
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
						"Freeing OnionMessagePath \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OnionMessagePath \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

