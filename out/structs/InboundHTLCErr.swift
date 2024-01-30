#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Invalid inbound onion payment.
public typealias InboundHTLCErr = Bindings.InboundHTLCErr

extension Bindings {


	/// Invalid inbound onion payment.
	public class InboundHTLCErr: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKInboundHTLCErr?

		internal init(cType: LDKInboundHTLCErr, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKInboundHTLCErr, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKInboundHTLCErr, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the InboundHTLCErr, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InboundHTLCErr_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// BOLT 4 error code.
		public func getErrCode() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCErr>) in
					InboundHTLCErr_get_err_code(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// BOLT 4 error code.
		public func setErrCode(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCErr>) in
					InboundHTLCErr_set_err_code(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Data attached to this error.
		///
		/// Returns a copy of the field.
		public func getErrData() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCErr>) in
					InboundHTLCErr_get_err_data(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Data attached to this error.
		public func setErrData(val: [UInt8]) {
			// native call variable prep

			let valVector = Vec_u8Z(array: val, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCErr>) in
					InboundHTLCErr_set_err_data(thisPtrPointer, valVector.cType!)
				}


			// cleanup

			// valVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Error message text.
		public func getMsg() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInboundHTLCErr>) in
					InboundHTLCErr_get_msg(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Error message text.
		public func setMsg(val: String) {
			// native call variable prep

			let valPrimitiveWrapper = Str(
				value: val, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInboundHTLCErr>) in
					InboundHTLCErr_set_msg(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new InboundHTLCErr given each field
		public init(errCodeArg: UInt16, errDataArg: [UInt8], msgArg: String) {
			// native call variable prep

			let errDataArgVector = Vec_u8Z(
				array: errDataArg, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)"
			)
			.dangle()

			let msgArgPrimitiveWrapper = Str(
				value: msgArg, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = InboundHTLCErr_new(
				errCodeArg, errDataArgVector.cType!, msgArgPrimitiveWrapper.cType!)

			// cleanup

			// errDataArgVector.noOpRetain()

			// for elided types, we need this
			msgArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = InboundHTLCErr(cType: nativeCallResult, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "InboundHTLCErr.swift::\(#function):\(#line)"
				)


		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func setCFreeability(freeable: Bool) -> InboundHTLCErr {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> InboundHTLCErr {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing InboundHTLCErr \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InboundHTLCErr \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

