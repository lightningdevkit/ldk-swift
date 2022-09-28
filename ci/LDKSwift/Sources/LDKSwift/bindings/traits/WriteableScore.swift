#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias WriteableScore = Bindings.WriteableScore

extension Bindings {

	open class WriteableScore: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKWriteableScore?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: WriteableScore = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "WriteableScore.swift::write")
				
				
					let returnWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: instance.write())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: WriteableScore = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "WriteableScore.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKWriteableScore(this_arg: Bindings.instanceToPointer(instance: self), 
			LockableScore: LDKLockableScore(),
			write: writeCallback,
			free: freeCallback)

		}

		public init(pointer: LDKWriteableScore){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKWriteableScore, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> WriteableScore {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing WriteableScore \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing WriteableScore \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func write() -> [UInt8] {
			/* EDIT ME */
		Bindings.print("WriteableScore::write MUST be overridden!", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating WriteableScore \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedWriteableScore: WriteableScore {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func write() -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.write(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
