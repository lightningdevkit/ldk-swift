#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias FutureCallback = Bindings.FutureCallback

extension Bindings {

	open class FutureCallback: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKFutureCallback?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func callCallback(pointer: UnsafeRawPointer?) -> Void {
				let instance: FutureCallback = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "FutureCallback.swift::call")
				
				return instance.call()
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: FutureCallback = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "FutureCallback.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKFutureCallback(this_arg: Bindings.instanceToPointer(instance: self), 
			call: callCallback,
			free: freeCallback)

		}

		public init(pointer: LDKFutureCallback){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKFutureCallback, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> FutureCallback {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing FutureCallback \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing FutureCallback \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func call() -> Void {
			/* EDIT ME */
		Bindings.print("FutureCallback::call MUST be overridden!", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating FutureCallback \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedFutureCallback: FutureCallback {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func call() -> Void {
		
				
				
				self.cOpaqueStruct!.call(self.cOpaqueStruct!.this_arg)
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
