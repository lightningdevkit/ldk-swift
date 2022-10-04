#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias Score = Bindings.Score

extension Bindings {

	open class Score: NativeTraitWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKScore?

		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			/* NATIVE_CALLBACKS_START */

			func channel_penalty_msatCallback(pointer: UnsafeRawPointer?, short_channel_id: UInt64, sourcePointer: UnsafePointer<LDKNodeId>, targetPointer: UnsafePointer<LDKNodeId>, usage: LDKChannelUsage) -> UInt64 {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::channel_penalty_msat")
				let source = NodeId(pointer: sourcePointer.pointee).dangle().clone();
let target = NodeId(pointer: targetPointer.pointee).dangle().clone();

				return instance.channel_penalty_msat(short_channel_id: short_channel_id, source: source, target: target, usage: ChannelUsage(pointer: usage))
			}

			func payment_path_failedCallback(pointer: UnsafeMutableRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::payment_path_failed")
				
				return instance.payment_path_failed(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path), short_channel_id: short_channel_id)
			}

			func payment_path_successfulCallback(pointer: UnsafeMutableRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::payment_path_successful")
				
				return instance.payment_path_successful(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path))
			}

			func probe_failedCallback(pointer: UnsafeMutableRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::probe_failed")
				
				return instance.probe_failed(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path), short_channel_id: short_channel_id)
			}

			func probe_successfulCallback(pointer: UnsafeMutableRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::probe_successful")
				
				return instance.probe_successful(path: Bindings.LDKCVec_RouteHopZ_to_array(nativeType: path))
			}

			func writeCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::write")
				
				
					let returnWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: instance.write())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
			}

			func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
				let instance: Score = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Score.swift::free")
				
				return instance.free()
			}

			/* NATIVE_CALLBACKS_END */

			super.init(conflictAvoidingVariableName: 0)
			self.cOpaqueStruct = LDKScore(this_arg: Bindings.instanceToPointer(instance: self), 
			channel_penalty_msat: channel_penalty_msatCallback,
			payment_path_failed: payment_path_failedCallback,
			payment_path_successful: payment_path_successfulCallback,
			probe_failed: probe_failedCallback,
			probe_successful: probe_successfulCallback,
			write: writeCallback,
			free: freeCallback)

		}

		public init(pointer: LDKScore){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKScore, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* SWIFT_CALLBACKS_START */



					internal func dangle() -> Score {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Score \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing Score \(self.instanceNumber) due to dangle.")
						}
					}
				

		open func channel_penalty_msat(short_channel_id: UInt64, source: NodeId, target: NodeId, usage: ChannelUsage) -> UInt64 {
			/* EDIT ME */
		Bindings.print("Error: Score::channel_penalty_msat MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func payment_path_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Score::payment_path_failed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func payment_path_successful(path: [LDKRouteHop]) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Score::payment_path_successful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func probe_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Score::probe_failed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func probe_successful(path: [LDKRouteHop]) -> Void {
			/* EDIT ME */
		Bindings.print("Error: Score::probe_successful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func write() -> [UInt8] {
			/* EDIT ME */
		Bindings.print("Error: Score::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)

abort()
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating Score \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

}


public class NativelyImplementedScore: Score {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func channel_penalty_msat(short_channel_id: UInt64, source: NodeId, target: NodeId, usage: ChannelUsage) -> UInt64 {
		
				
				return withUnsafePointer(to: source.cOpaqueStruct!) { (sourcePointer: UnsafePointer<LDKNodeId>) in
withUnsafePointer(to: target.cOpaqueStruct!) { (targetPointer: UnsafePointer<LDKNodeId>) in

				self.cOpaqueStruct!.channel_penalty_msat(self.cOpaqueStruct!.this_arg, short_channel_id, sourcePointer, targetPointer, usage.danglingClone().cOpaqueStruct!)
				
}
}
			
	}

	public func payment_path_failed(path: [RouteHop], short_channel_id: UInt64) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.payment_path_failed(path: pathUnwrapped, short_channel_id: short_channel_id)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func payment_path_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.payment_path_failed(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!, short_channel_id)
				
			
	}

	public func payment_path_successful(path: [RouteHop]) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.payment_path_successful(path: pathUnwrapped)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func payment_path_successful(path: [LDKRouteHop]) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.payment_path_successful(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!)
				
			
	}

	public func probe_failed(path: [RouteHop], short_channel_id: UInt64) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.probe_failed(path: pathUnwrapped, short_channel_id: short_channel_id)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func probe_failed(path: [LDKRouteHop], short_channel_id: UInt64) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.probe_failed(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!, short_channel_id)
				
			
	}

	public func probe_successful(path: [RouteHop]) -> Void {
		
					
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
					return self.probe_successful(path: pathUnwrapped)
				
	}

@available(*, deprecated, message: "Use method taking Swift object array type instead.")
	public override func probe_successful(path: [LDKRouteHop]) -> Void {
		
				
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: path)
						defer {
							pathWrapper.noOpRetain()
						}
					
				
				self.cOpaqueStruct!.probe_successful(self.cOpaqueStruct!.this_arg, pathWrapper.dangle().cOpaqueStruct!)
				
			
	}

	public override func write() -> [UInt8] {
		
				
				return 
				Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.write(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
