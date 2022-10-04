#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias BroadcasterInterface = Bindings.BroadcasterInterface

extension Bindings {

	open class BroadcasterInterface: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBroadcasterInterface?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func broadcast_transactionCallback(pointer: UnsafeRawPointer?, tx: LDKTransaction) -> Void {
				let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BroadcasterInterface.swift::broadcast_transaction")
				
				return instance.broadcast_transaction(tx: Bindings.LDKTransaction_to_array(nativeType: tx))
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BroadcasterInterface.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKBroadcasterInterface(this_arg: Bindings.instanceToPointer(instance: self), 
			broadcast_transaction: broadcast_transactionCallback,
			free: freeCallback)

		}

		public init(pointer: LDKBroadcasterInterface){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKBroadcasterInterface, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> BroadcasterInterface {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BroadcasterInterface \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing BroadcasterInterface \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func broadcast_transaction(tx: [UInt8]) -> Void {
			/* EDIT ME */
		Bindings.print("Error: BroadcasterInterface::broadcast_transaction MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating BroadcasterInterface \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedBroadcasterInterface: BroadcasterInterface {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func broadcast_transaction(tx: [UInt8]) -> Void {
		
				
						let txWrapper = Bindings.new_LDKTransactionWrapper(array: tx)
						defer {
							txWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.broadcast_transaction(self.cOpaqueStruct!.this_arg, txWrapper.dangle().cOpaqueStruct!)
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
