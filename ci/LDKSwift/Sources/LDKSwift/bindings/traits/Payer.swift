#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

open class Payer: NativeTraitWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPayer?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func node_idCallback(pointer: UnsafeRawPointer?) -> LDKPublicKey {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::node_id")
			
			return Bindings.new_LDKPublicKey(array: instance.node_id())
		}

		func first_hopsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_ChannelDetailsZ {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::first_hops")
			
			
					let returnWrapper = Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: instance.first_hops())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func send_paymentCallback(pointer: UnsafeRawPointer?, routePointer: UnsafePointer<LDKRoute>, payment_hash: LDKThirtyTwoBytes, payment_secret: LDKThirtyTwoBytes) -> LDKCResult_PaymentIdPaymentSendFailureZ {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::send_payment")
			let route = Route(pointer: routePointer.pointee).dangle().clone();

			return instance.send_payment(route: route, payment_hash: Bindings.tuple32_to_array(nativeType: payment_hash.data), payment_secret: Bindings.tuple32_to_array(nativeType: payment_secret.data)).cOpaqueStruct!
		}

		func send_spontaneous_paymentCallback(pointer: UnsafeRawPointer?, routePointer: UnsafePointer<LDKRoute>, payment_preimage: LDKThirtyTwoBytes) -> LDKCResult_PaymentIdPaymentSendFailureZ {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::send_spontaneous_payment")
			let route = Route(pointer: routePointer.pointee).dangle().clone();

			return instance.send_spontaneous_payment(route: route, payment_preimage: Bindings.tuple32_to_array(nativeType: payment_preimage.data)).cOpaqueStruct!
		}

		func retry_paymentCallback(pointer: UnsafeRawPointer?, routePointer: UnsafePointer<LDKRoute>, payment_id: LDKThirtyTwoBytes) -> LDKCResult_NonePaymentSendFailureZ {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::retry_payment")
			let route = Route(pointer: routePointer.pointee).dangle().clone();

			return instance.retry_payment(route: route, payment_id: Bindings.tuple32_to_array(nativeType: payment_id.data)).cOpaqueStruct!
		}

		func abandon_paymentCallback(pointer: UnsafeRawPointer?, payment_id: LDKThirtyTwoBytes) -> Void {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::abandon_payment")
			
			return instance.abandon_payment(payment_id: Bindings.tuple32_to_array(nativeType: payment_id.data))
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Payer = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Payer.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKPayer(this_arg: Bindings.instanceToPointer(instance: self), 
			node_id: node_idCallback,
			first_hops: first_hopsCallback,
			send_payment: send_paymentCallback,
			send_spontaneous_payment: send_spontaneous_paymentCallback,
			retry_payment: retry_paymentCallback,
			abandon_payment: abandon_paymentCallback,
			free: freeCallback)

    }

    public init(pointer: LDKPayer){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPayer, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Payer {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Payer \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing Payer \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func node_id() -> [UInt8] {
    	/* EDIT ME */
		Bindings.print("Payer::node_id should be overridden!", severity: .WARNING)

return [UInt8]()
    }

    open func first_hops() -> [LDKChannelDetails] {
    	/* EDIT ME */
		Bindings.print("Payer::first_hops should be overridden!", severity: .WARNING)

return [LDKChannelDetails]()
    }

    open func send_payment(route: Route, payment_hash: [UInt8], payment_secret: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
    	/* EDIT ME */
		Bindings.print("Payer::send_payment should be overridden!", severity: .WARNING)

return Result_PaymentIdPaymentSendFailureZ()
    }

    open func send_spontaneous_payment(route: Route, payment_preimage: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
    	/* EDIT ME */
		Bindings.print("Payer::send_spontaneous_payment should be overridden!", severity: .WARNING)

return Result_PaymentIdPaymentSendFailureZ()
    }

    open func retry_payment(route: Route, payment_id: [UInt8]) -> Result_NonePaymentSendFailureZ {
    	/* EDIT ME */
		Bindings.print("Payer::retry_payment should be overridden!", severity: .WARNING)

return Result_NonePaymentSendFailureZ()
    }

    open func abandon_payment(payment_id: [UInt8]) -> Void {
    	/* EDIT ME */
		Bindings.print("Payer::abandon_payment should be overridden!", severity: .WARNING)


    }

    open func free() -> Void {
    	/* EDIT ME */
		
					Bindings.print("Deactivating Payer \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedPayer: Payer {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func node_id() -> [UInt8] {
		
				
				return 
				Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func first_hops() -> [LDKChannelDetails] {
		
				
				return 
				Bindings.LDKCVec_ChannelDetailsZ_to_array(nativeType: self.cOpaqueStruct!.first_hops(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func send_payment(route: Route, payment_hash: [UInt8], payment_secret: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
		
				
				return withUnsafePointer(to: route.cOpaqueStruct!) { (routePointer: UnsafePointer<LDKRoute>) in

				Result_PaymentIdPaymentSendFailureZ(pointer: self.cOpaqueStruct!.send_payment(self.cOpaqueStruct!.this_arg, routePointer, Bindings.new_LDKThirtyTwoBytes(array: payment_hash), Bindings.new_LDKThirtyTwoBytes(array: payment_secret)))
				
}
			
	}

	public override func send_spontaneous_payment(route: Route, payment_preimage: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
		
				
				return withUnsafePointer(to: route.cOpaqueStruct!) { (routePointer: UnsafePointer<LDKRoute>) in

				Result_PaymentIdPaymentSendFailureZ(pointer: self.cOpaqueStruct!.send_spontaneous_payment(self.cOpaqueStruct!.this_arg, routePointer, Bindings.new_LDKThirtyTwoBytes(array: payment_preimage)))
				
}
			
	}

	public override func retry_payment(route: Route, payment_id: [UInt8]) -> Result_NonePaymentSendFailureZ {
		
				
				return withUnsafePointer(to: route.cOpaqueStruct!) { (routePointer: UnsafePointer<LDKRoute>) in

				Result_NonePaymentSendFailureZ(pointer: self.cOpaqueStruct!.retry_payment(self.cOpaqueStruct!.this_arg, routePointer, Bindings.new_LDKThirtyTwoBytes(array: payment_id)))
				
}
			
	}

	public override func abandon_payment(payment_id: [UInt8]) -> Void {
		
				
				
				self.cOpaqueStruct!.abandon_payment(self.cOpaqueStruct!.this_arg, Bindings.new_LDKThirtyTwoBytes(array: payment_id))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
