#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias CustomOnionMessageContents = Bindings.CustomOnionMessageContents

extension Bindings {

	open class CustomOnionMessageContents: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCustomOnionMessageContents?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func tlv_typeCallback(pointer: UnsafeRawPointer?) -> UInt64 {
				let instance: CustomOnionMessageContents = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomOnionMessageContents.swift::tlv_type")
				
				return instance.tlv_type()
			}

			func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: CustomOnionMessageContents = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomOnionMessageContents.swift::write")
				
				
					let returnWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: instance.write())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: CustomOnionMessageContents = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "CustomOnionMessageContents.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKCustomOnionMessageContents(this_arg: Bindings.instanceToPointer(instance: self), 
			tlv_type: tlv_typeCallback,
			write: writeCallback,
			cloned: nil,
			free: freeCallback)

		}

		public init(pointer: LDKCustomOnionMessageContents){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCustomOnionMessageContents, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */


				public func clone() -> CustomOnionMessageContents {
					
					return withUnsafePointer(to: self.activateOnce().cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCustomOnionMessageContents>) in

					CustomOnionMessageContents(pointer: CustomOnionMessageContents_clone(origPointer))
					
}
				}
			

					internal func danglingClone() -> CustomOnionMessageContents {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				



					internal func dangle() -> CustomOnionMessageContents {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing CustomOnionMessageContents \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing CustomOnionMessageContents \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func tlv_type() -> UInt64 {
			/* EDIT ME */
		
					Bindings.print("Error: CustomOnionMessageContents::tlv_type MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func write() -> [UInt8] {
			/* EDIT ME */
		
					Bindings.print("Error: CustomOnionMessageContents::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating CustomOnionMessageContents \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedCustomOnionMessageContents: CustomOnionMessageContents {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func tlv_type() -> UInt64 {
		
				
				return 
				self.cOpaqueStruct!.tlv_type(self.cOpaqueStruct!.this_arg)
				
			
	}

	public override func write() -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.write(self.cOpaqueStruct!.this_arg), callerContext: "CustomOnionMessageContents::NativelyImplementedCustomOnionMessageContents::write")
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
