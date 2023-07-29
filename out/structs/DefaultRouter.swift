#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A [`Router`] implemented using [`find_route`].
public typealias DefaultRouter = Bindings.DefaultRouter

extension Bindings {


	/// A [`Router`] implemented using [`find_route`].
	public class DefaultRouter: NativeTypeWrapper {

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

		internal var cType: LDKDefaultRouter?

		internal init(cType: LDKDefaultRouter, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKDefaultRouter, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKDefaultRouter, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the DefaultRouter, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = DefaultRouter_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new router.
		public init(networkGraph: NetworkGraph, logger: Logger, randomSeedBytes: [UInt8], scorer: LockableScore) {
			// native call variable prep

			let randomSeedBytesPrimitiveWrapper = ThirtyTwoBytes(
				value: randomSeedBytes, instantiationContext: "DefaultRouter.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
					DefaultRouter_new(
						networkGraphPointer, logger.activate().cType!, randomSeedBytesPrimitiveWrapper.cType!,
						scorer.activate().cType!)
				}


			// cleanup

			// for elided types, we need this
			randomSeedBytesPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = DefaultRouter(cType: nativeCallResult, instantiationContext: "DefaultRouter.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "DefaultRouter.swift::\(#function):\(#line)")
			try! self.addAnchor(anchor: networkGraph)


		}

		/// Constructs a new Router which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned Router must be freed before this_arg is
		public func asRouter() -> Router {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDefaultRouter>) in
					DefaultRouter_as_Router(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedRouter(
				cType: nativeCallResult, instantiationContext: "DefaultRouter.swift::\(#function):\(#line)",
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


		internal func dangle(_ shouldDangle: Bool = true) -> DefaultRouter {
			self.dangling = shouldDangle
			return self
		}


		internal func setCFreeability(freeable: Bool) -> DefaultRouter {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> DefaultRouter {
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
						"Freeing DefaultRouter \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing DefaultRouter \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

