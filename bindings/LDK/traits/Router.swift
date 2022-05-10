import Foundation

open class Router: NativeTraitWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRouter?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func find_routeCallback(pointer: UnsafeRawPointer?, payer: LDKPublicKey, route_paramsPointer: UnsafePointer<LDKRouteParameters>, payment_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, scorerPointer: UnsafePointer<LDKScore>) -> LDKCResult_RouteLightningErrorZ {
			let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::find_route")
			let route_params = RouteParameters(pointer: route_paramsPointer.pointee).dangle().clone();

								var payment_hash: [UInt8]? = nil
								if let payment_hashUnwrapped = payment_hashPointer {
									payment_hash = Bindings.tuple32_to_array(nativeType: payment_hashUnwrapped.pointee)
								}
							
					var first_hops: [LDKChannelDetails]? = nil
					if let first_hopsUnwrapped = first_hopsPointer {
						first_hops = Bindings.LDKCVec_ChannelDetailsZ_to_array(nativeType: first_hopsUnwrapped.pointee)
					}
				let scorer = Score(pointer: scorerPointer.pointee).dangle();

			return instance.find_route(payer: Bindings.tuple33_to_array(nativeType: payer.compressed_form), route_params: route_params, payment_hash: payment_hash, first_hops: first_hops, scorer: scorer).cOpaqueStruct!
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Router = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Router.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKRouter(this_arg: Bindings.instanceToPointer(instance: self), 
			find_route: find_routeCallback,
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
				

    open func find_route(payer: [UInt8], route_params: RouteParameters, payment_hash: [UInt8]?, first_hops: [LDKChannelDetails]?, scorer: Score) -> Result_RouteLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("Router::find_route should be overridden!", severity: .WARNING)

return Result_RouteLightningErrorZ()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
					Bindings.print("Deactivating Router \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedRouter: Router {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public func find_route(payer: [UInt8], route_params: RouteParameters, payment_hash: [UInt8]?, first_hops: [ChannelDetails]?, scorer: Score) -> Result_RouteLightningErrorZ {
		
					
						var first_hopsNative: [LDKChannelDetails]? = nil
						if let first_hopsUnwrapped = first_hops {
							
							first_hopsNative = first_hopsUnwrapped.map { (first_hopsCurrentValue) in
							first_hopsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						}
					
					return self.find_route(payer: payer, route_params: route_params, payment_hash: payment_hash, first_hops: first_hopsNative, scorer: scorer)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func find_route(payer: [UInt8], route_params: RouteParameters, payment_hash: [UInt8]?, first_hops: [LDKChannelDetails]?, scorer: Score) -> Result_RouteLightningErrorZ {
		
				
							var first_hopsPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
							if let first_hopsUnwrapped = first_hops {
								
								first_hopsPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
								first_hopsPointer!.initialize(to: Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hopsUnwrapped).cOpaqueStruct!)
							}
						
				return withUnsafePointer(to: route_params.cOpaqueStruct!) { (route_paramsPointer: UnsafePointer<LDKRouteParameters>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: payment_hash!)) { (payment_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: scorer.cOpaqueStruct!) { (scorerPointer: UnsafePointer<LDKScore>) in

				Result_RouteLightningErrorZ(pointer: self.cOpaqueStruct!.find_route(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: payer), route_paramsPointer, payment_hashPointer, first_hopsPointer, scorerPointer))
				
}
}
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
