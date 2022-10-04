#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias LockableScore = Bindings.LockableScore

extension Bindings {

	open class LockableScore: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKLockableScore?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func lockCallback(pointer: UnsafeRawPointer?) -> LDKScore {
				let instance: LockableScore = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "LockableScore.swift::lock")
				
				return instance.lock().cOpaqueStruct!
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: LockableScore = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "LockableScore.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKLockableScore(this_arg: Bindings.instanceToPointer(instance: self), 
			lock: lockCallback,
			free: freeCallback)

		}

		public init(pointer: LDKLockableScore){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKLockableScore, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> LockableScore {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing LockableScore \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing LockableScore \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func lock() -> Score {
			/* EDIT ME */
		Bindings.print("Error: LockableScore::lock MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating LockableScore \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedLockableScore: LockableScore {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func lock() -> Score {
		
				
				return 
				Score(pointer: self.cOpaqueStruct!.lock(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
