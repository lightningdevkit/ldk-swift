#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias Router = Bindings.Router

extension Bindings {

	open class Router: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKRouter?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func find_routeCallback(pointer: UnsafeRawPointer?, payer: LDKPublicKey, route_paramsPointer: UnsafePointer<LDKRouteParameters>, payment_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, inflight_htlcs: LDKInFlightHtlcs) -> LDKCResult_RouteLightningErrorZ {
				let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::find_route")
				let route_params = RouteParameters(pointer: route_paramsPointer.pointee).dangle().clone();

								var payment_hash: [UInt8]? = nil
								if let payment_hashUnwrapped = payment_hashPointer {
									payment_hash = Bindings.tuple32_to_array(nativeType: payment_hashUnwrapped.pointee)
								}
							
					var first_hops: [LDKChannelDetails]? = nil
					if let first_hopsUnwrapped = first_hopsPointer {
						first_hops = Bindings.LDKCVec_ChannelDetailsZ_to_array(nativeType: first_hopsUnwrapped.pointee, callerContext: "Router::init::find_routeCallback")
					}
				
				return instance.find_route(payer: Bindings.tuple33_to_array(nativeType: payer.compressed_form), route_params: route_params, payment_hash: payment_hash, first_hops: first_hops, inflight_htlcs: InFlightHtlcs(pointer: inflight_htlcs)).cOpaqueStruct!
			}

			func notify_payment_path_failedCallback(pointer: UnsafeRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
				let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::notify_payment_path_failed")
				
				return instance.notify_payment_path_failed(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path, callerContext: "Router::init::notify_payment_path_failedCallback"), short_channel_id: short_channel_id)
			}

			func notify_payment_path_successfulCallback(pointer: UnsafeRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
				let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::notify_payment_path_successful")
				
				return instance.notify_payment_path_successful(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path, callerContext: "Router::init::notify_payment_path_successfulCallback"))
			}

			func notify_payment_probe_successfulCallback(pointer: UnsafeRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
				let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::notify_payment_probe_successful")
				
				return instance.notify_payment_probe_successful(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path, callerContext: "Router::init::notify_payment_probe_successfulCallback"))
			}

			func notify_payment_probe_failedCallback(pointer: UnsafeRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
				let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::notify_payment_probe_failed")
				
				return instance.notify_payment_probe_failed(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path, callerContext: "Router::init::notify_payment_probe_failedCallback"), short_channel_id: short_channel_id)
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKRouter(this_arg: Bindings.instanceToPointer(instance: self), 
			find_route: find_routeCallback,
			notify_payment_path_failed: notify_payment_path_failedCallback,
			notify_payment_path_successful: notify_payment_path_successfulCallback,
			notify_payment_probe_successful: notify_payment_probe_successfulCallback,
			notify_payment_probe_failed: notify_payment_probe_failedCallback,
			free: freeCallback)

		}

		public init(pointer: LDKRouter){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKRouter, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> Router {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Router \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing Router \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func find_route(payer: [UInt8], route_params: RouteParameters, payment_hash: [UInt8]?, first_hops: [LDKChannelDetails]?, inflight_htlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: Router::find_route MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func notify_payment_path_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: Router::notify_payment_path_failed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func notify_payment_path_successful(path: [LDKRouteHop]) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: Router::notify_payment_path_successful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func notify_payment_probe_successful(path: [LDKRouteHop]) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: Router::notify_payment_probe_successful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func notify_payment_probe_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
			/* EDIT ME */
		
					Bindings.print("Error: Router::notify_payment_probe_failed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating Router \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedRouter: Router {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public func find_route(payer: [UInt8], route_params: RouteParameters, payment_hash: [UInt8]?, first_hops: [ChannelDetails]?, inflight_htlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
		
					
						var first_hopsNative: [LDKChannelDetails]? = nil
						if let first_hopsUnwrapped = first_hops {
							
							first_hopsNative = first_hopsUnwrapped.map { (first_hopsCurrentValue) in
							first_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						}
					
					return self.find_route(payer: payer, route_params: route_params, payment_hash: payment_hash, first_hops: first_hopsNative, inflight_htlcs: inflight_htlcs)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func find_route(payer: [UInt8], route_params: RouteParameters, payment_hash: [UInt8]?, first_hops: [LDKChannelDetails]?, inflight_htlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
		
				
							var first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
							if let first_hopsUnwrapped = first_hops {
								
								first_hopsPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
								first_hopsPointer!.initialize(to: Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hopsUnwrapped).cOpaqueStruct!)
							}
						
				return withUnsafePointer(to: route_params.cOpaqueStruct!) { (route_paramsPointer: UnsafePointer<LDKRouteParameters>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: payment_hash!)) { (payment_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in

				Result_RouteLightningErrorZ(pointer: self.cOpaqueStruct!.find_route(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: payer), route_paramsPointer, payment_hashPointer, first_hopsPointer, inflight_htlcs.cOpaqueStruct!))
				
}
}
			
	}

	public func notify_payment_path_failed(path: [RouteHop], short_channel_id: UInt64) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.notify_payment_path_failed(path: pathUnwrapped, short_channel_id: short_channel_id)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func notify_payment_path_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.notify_payment_path_failed(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!, short_channel_id)
				
			
	}

	public func notify_payment_path_successful(path: [RouteHop]) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.notify_payment_path_successful(path: pathUnwrapped)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func notify_payment_path_successful(path: [LDKRouteHop]) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.notify_payment_path_successful(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!)
				
			
	}

	public func notify_payment_probe_successful(path: [RouteHop]) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.notify_payment_probe_successful(path: pathUnwrapped)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func notify_payment_probe_successful(path: [LDKRouteHop]) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.notify_payment_probe_successful(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!)
				
			
	}

	public func notify_payment_probe_failed(path: [RouteHop], short_channel_id: UInt64) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.notify_payment_probe_failed(path: pathUnwrapped, short_channel_id: short_channel_id)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func notify_payment_probe_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.notify_payment_probe_failed(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!, short_channel_id)
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
