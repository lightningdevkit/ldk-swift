#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A segregated witness version byte and script bytes
public typealias WitnessProgram = Bindings.WitnessProgram

extension Bindings {


	/// A segregated witness version byte and script bytes
	public class WitnessProgram: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKWitnessProgram?

		internal init(cType: LDKWitnessProgram, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKWitnessProgram, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKWitnessProgram, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Constructs a new WitnessProgram given a version and program bytes.
		///
		/// The program MUST be at least 2 bytes and no longer than 40 bytes long.
		/// Further, if the version is 0, the program MUST be either exactly 20 or exactly 32 bytes long.
		public init(version: UInt8, program: [UInt8]) {
			// native call variable prep

			let versionPrimitiveWrapper = WitnessVersion(
				value: version, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)")

			let programVector = Vec_u8Z(
				array: program, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = WitnessProgram_new(versionPrimitiveWrapper.cType!, programVector.cType!)

			// cleanup

			// for elided types, we need this
			versionPrimitiveWrapper.noOpRetain()

			// programVector.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = WitnessProgram(cType: nativeCallResult, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)"
				)


		}

		/// Gets the `WitnessVersion` of the given `WitnessProgram`
		public func getVersion() -> UInt8 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (progPointer: UnsafePointer<LDKWitnessProgram>) in
					WitnessProgram_get_version(progPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = WitnessVersion(
				cType: nativeCallResult, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Gets the witness program bytes of the given `WitnessProgram`
		public func getProgram() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (progPointer: UnsafePointer<LDKWitnessProgram>) in
					WitnessProgram_get_program(progPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = u8slice(
				cType: nativeCallResult, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()


			return returnValue
		}

		/// Creates a new WitnessProgram which has the same data as `orig`
		internal func clone() -> WitnessProgram {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKWitnessProgram>) in
					WitnessProgram_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = WitnessProgram(
				cType: nativeCallResult, instantiationContext: "WitnessProgram.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Releases any memory held by the given `WitnessProgram` (which is currently none)
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = WitnessProgram_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		internal func danglingClone() -> WitnessProgram {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing WitnessProgram \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing WitnessProgram \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

