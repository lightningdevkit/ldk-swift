import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias MessageSendInstructions = Bindings.MessageSendInstructions

extension Bindings {

	/// Instructions for how and where to send a message.
	public class MessageSendInstructions: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKMessageSendInstructions?

		internal init(cType: LDKMessageSendInstructions, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMessageSendInstructions, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMessageSendInstructions, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum MessageSendInstructionsType {

			/// Indicates that a message should be sent including the provided reply path for the recipient
			/// to respond.
			case WithSpecifiedReplyPath

			/// Indicates that a message should be sent including a reply path for the recipient to
			/// respond.
			case WithReplyPath

			/// Indicates that a message should be sent without including a reply path, preventing the
			/// recipient from responding.
			case WithoutReplyPath

			/// Indicates that a message is being sent as a reply to a received message.
			case ForReply

		}

		public func getValueType() -> MessageSendInstructionsType {
			switch self.cType!.tag {
				case LDKMessageSendInstructions_WithSpecifiedReplyPath:
					return .WithSpecifiedReplyPath

				case LDKMessageSendInstructions_WithReplyPath:
					return .WithReplyPath

				case LDKMessageSendInstructions_WithoutReplyPath:
					return .WithoutReplyPath

				case LDKMessageSendInstructions_ForReply:
					return .ForReply

				default:
					Bindings.print("Error: Invalid value type for MessageSendInstructions! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the MessageSendInstructions
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageSendInstructions_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the MessageSendInstructions
		internal func clone() -> MessageSendInstructions {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMessageSendInstructions>) in
					MessageSendInstructions_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageSendInstructions(
				cType: nativeCallResult, instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new WithSpecifiedReplyPath-variant MessageSendInstructions
		public class func initWithWithSpecifiedReplyPath(
			destination: Destination, replyPath: Bindings.BlindedMessagePath
		) -> MessageSendInstructions {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageSendInstructions_with_specified_reply_path(
				destination.danglingClone().cType!, replyPath.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageSendInstructions(
				cType: nativeCallResult, instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new WithReplyPath-variant MessageSendInstructions
		public class func initWithWithReplyPath(destination: Destination, context: MessageContext)
			-> MessageSendInstructions
		{
			// native call variable prep


			// native method call
			let nativeCallResult = MessageSendInstructions_with_reply_path(
				destination.danglingClone().cType!, context.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageSendInstructions(
				cType: nativeCallResult, instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new WithoutReplyPath-variant MessageSendInstructions
		public class func initWithWithoutReplyPath(destination: Destination) -> MessageSendInstructions {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageSendInstructions_without_reply_path(destination.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageSendInstructions(
				cType: nativeCallResult, instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ForReply-variant MessageSendInstructions
		public class func initForReply(instructions: Bindings.ResponseInstruction) -> MessageSendInstructions {
			// native call variable prep


			// native method call
			let nativeCallResult = MessageSendInstructions_for_reply(instructions.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = MessageSendInstructions(
				cType: nativeCallResult, instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsWithSpecifiedReplyPath() -> WithSpecifiedReplyPath? {
			if self.cType?.tag != LDKMessageSendInstructions_WithSpecifiedReplyPath {
				return nil
			}

			return MessageSendInstructions_LDKWithSpecifiedReplyPath_Body(
				cType: self.cType!.with_specified_reply_path,
				instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsWithReplyPath() -> WithReplyPath? {
			if self.cType?.tag != LDKMessageSendInstructions_WithReplyPath {
				return nil
			}

			return MessageSendInstructions_LDKWithReplyPath_Body(
				cType: self.cType!.with_reply_path,
				instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsWithoutReplyPath() -> WithoutReplyPath? {
			if self.cType?.tag != LDKMessageSendInstructions_WithoutReplyPath {
				return nil
			}

			return MessageSendInstructions_LDKWithoutReplyPath_Body(
				cType: self.cType!.without_reply_path,
				instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsForReply() -> ForReply? {
			if self.cType?.tag != LDKMessageSendInstructions_ForReply {
				return nil
			}

			return MessageSendInstructions_LDKForReply_Body(
				cType: self.cType!.for_reply,
				instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> MessageSendInstructions {
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
						"Freeing MessageSendInstructions \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MessageSendInstructions \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias MessageSendInstructions_LDKWithSpecifiedReplyPath_Body = WithSpecifiedReplyPath


		///
		public class WithSpecifiedReplyPath: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKMessageSendInstructions_LDKWithSpecifiedReplyPath_Body?

			internal init(
				cType: LDKMessageSendInstructions_LDKWithSpecifiedReplyPath_Body, instantiationContext: String
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKWithSpecifiedReplyPath_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKWithSpecifiedReplyPath_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The destination where we need to send our message.
			public func getDestination() -> Destination {
				// return value (do some wrapping)
				let returnValue = Destination(
					cType: self.cType!.destination,
					instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// The reply path which should be included in the message.
			public func getReplyPath() -> Bindings.BlindedMessagePath {
				// return value (do some wrapping)
				let returnValue = Bindings.BlindedMessagePath(
					cType: self.cType!.reply_path,
					instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


		///
		internal typealias MessageSendInstructions_LDKWithReplyPath_Body = WithReplyPath


		///
		public class WithReplyPath: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKMessageSendInstructions_LDKWithReplyPath_Body?

			internal init(cType: LDKMessageSendInstructions_LDKWithReplyPath_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKWithReplyPath_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKWithReplyPath_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The destination where we need to send our message.
			public func getDestination() -> Destination {
				// return value (do some wrapping)
				let returnValue = Destination(
					cType: self.cType!.destination,
					instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// The context to include in the reply path we'll give the recipient so they can respond
			/// to us.
			public func getContext() -> MessageContext {
				// return value (do some wrapping)
				let returnValue = MessageContext(
					cType: self.cType!.context,
					instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


		///
		internal typealias MessageSendInstructions_LDKWithoutReplyPath_Body = WithoutReplyPath


		///
		public class WithoutReplyPath: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKMessageSendInstructions_LDKWithoutReplyPath_Body?

			internal init(cType: LDKMessageSendInstructions_LDKWithoutReplyPath_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKWithoutReplyPath_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKWithoutReplyPath_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The destination where we need to send our message.
			public func getDestination() -> Destination {
				// return value (do some wrapping)
				let returnValue = Destination(
					cType: self.cType!.destination,
					instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


		///
		internal typealias MessageSendInstructions_LDKForReply_Body = ForReply


		///
		public class ForReply: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKMessageSendInstructions_LDKForReply_Body?

			internal init(cType: LDKMessageSendInstructions_LDKForReply_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKForReply_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKMessageSendInstructions_LDKForReply_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The instructions provided by the [`Responder`].
			public func getInstructions() -> Bindings.ResponseInstruction {
				// return value (do some wrapping)
				let returnValue = Bindings.ResponseInstruction(
					cType: self.cType!.instructions,
					instantiationContext: "MessageSendInstructions.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


	}

}
