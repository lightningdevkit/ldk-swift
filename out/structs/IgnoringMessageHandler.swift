#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A dummy struct which implements `RoutingMessageHandler` without storing any routing information
/// or doing any processing. You can provide one of these as the route_handler in a MessageHandler.
public typealias IgnoringMessageHandler = Bindings.IgnoringMessageHandler

extension Bindings {


	/// A dummy struct which implements `RoutingMessageHandler` without storing any routing information
	/// or doing any processing. You can provide one of these as the route_handler in a MessageHandler.
	public class IgnoringMessageHandler: NativeTypeWrapper {

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

		internal var cType: LDKIgnoringMessageHandler?

		internal init(cType: LDKIgnoringMessageHandler, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKIgnoringMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKIgnoringMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the IgnoringMessageHandler, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = IgnoringMessageHandler_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new IgnoringMessageHandler given each field
		public init() {
			// native call variable prep


			// native method call
			let nativeCallResult = IgnoringMessageHandler_new()

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = IgnoringMessageHandler(cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)")


		}

		/// Constructs a new MessageSendEventsProvider which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned MessageSendEventsProvider must be freed before this_arg is
		public func asMessageSendEventsProvider() -> MessageSendEventsProvider {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_MessageSendEventsProvider(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedMessageSendEventsProvider(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new RoutingMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned RoutingMessageHandler must be freed before this_arg is
		public func asRoutingMessageHandler() -> RoutingMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_RoutingMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedRoutingMessageHandler(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new OnionMessageProvider which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageProvider must be freed before this_arg is
		public func asOnionMessageProvider() -> OnionMessageProvider {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_OnionMessageProvider(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageProvider(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new OnionMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageHandler must be freed before this_arg is
		public func asOnionMessageHandler() -> OnionMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_OnionMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageHandler(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new CustomOnionMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned CustomOnionMessageHandler must be freed before this_arg is
		public func asCustomOnionMessageHandler() -> CustomOnionMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_CustomOnionMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedCustomOnionMessageHandler(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new CustomMessageReader which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned CustomMessageReader must be freed before this_arg is
		public func asCustomMessageReader() -> CustomMessageReader {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_CustomMessageReader(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedCustomMessageReader(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new CustomMessageHandler which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned CustomMessageHandler must be freed before this_arg is
		public func asCustomMessageHandler() -> CustomMessageHandler {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
					IgnoringMessageHandler_as_CustomMessageHandler(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedCustomMessageHandler(
				cType: nativeCallResult, instantiationContext: "IgnoringMessageHandler.swift::\(#function):\(#line)",
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


		internal func dangle(_ shouldDangle: Bool = true) -> IgnoringMessageHandler {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> IgnoringMessageHandler {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func setCFreeability(freeable: Bool) -> IgnoringMessageHandler {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> IgnoringMessageHandler {
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
						"Freeing IgnoringMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing IgnoringMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

