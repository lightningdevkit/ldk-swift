
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias ErrorAction = Bindings.ErrorAction

			extension Bindings {

				/// Used to put an error message in a LightningError
				public class ErrorAction: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKErrorAction?

					internal init(cType: LDKErrorAction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKErrorAction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum ErrorActionType {
						
						/// The peer took some action which made us think they were useless. Disconnect them.
						case DisconnectPeer
			
						/// The peer did something harmless that we weren't able to process, just log and ignore
						case IgnoreError
			
						/// The peer did something harmless that we weren't able to meaningfully process.
						/// If the error is logged, log it at the given level.
						case IgnoreAndLog
			
						/// The peer provided us with a gossip message which we'd already seen. In most cases this
						/// should be ignored, but it may result in the message being forwarded if it is a duplicate of
						/// our own channel announcements.
						case IgnoreDuplicateGossip
			
						/// The peer did something incorrect. Tell them.
						case SendErrorMessage
			
						/// The peer did something incorrect. Tell them without closing any channels.
						case SendWarningMessage
			
					}

					public func getValueType() -> ErrorActionType {
						switch self.cType!.tag {
							case LDKErrorAction_DisconnectPeer:
								return .DisconnectPeer
			
							case LDKErrorAction_IgnoreError:
								return .IgnoreError
			
							case LDKErrorAction_IgnoreAndLog:
								return .IgnoreAndLog
			
							case LDKErrorAction_IgnoreDuplicateGossip:
								return .IgnoreDuplicateGossip
			
							case LDKErrorAction_SendErrorMessage:
								return .SendErrorMessage
			
							case LDKErrorAction_SendWarningMessage:
								return .SendWarningMessage
			
							default:
								Bindings.print("Error: Invalid value type for ErrorAction! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the ErrorAction
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ErrorAction
					internal func clone() -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKErrorAction>) in
				ErrorAction_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new DisconnectPeer-variant ErrorAction
					public class func initWithDisconnectPeer(msg: Bindings.ErrorMessage) -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_disconnect_peer(msg.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new IgnoreError-variant ErrorAction
					public class func initWithIgnoreError() -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_ignore_error()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new IgnoreAndLog-variant ErrorAction
					public class func initWithIgnoreAndLog(a: Level) -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_ignore_and_log(a.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new IgnoreDuplicateGossip-variant ErrorAction
					public class func initWithIgnoreDuplicateGossip() -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_ignore_duplicate_gossip()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new SendErrorMessage-variant ErrorAction
					public class func initWithSendErrorMessage(msg: Bindings.ErrorMessage) -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_send_error_message(msg.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new SendWarningMessage-variant ErrorAction
					public class func initWithSendWarningMessage(msg: Bindings.WarningMessage, logLevel: Level) -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_send_warning_message(msg.dynamicallyDangledClone().cType!, logLevel.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ErrorAction(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					public func getValueAsDisconnectPeer() -> DisconnectPeer? {
						if self.cType?.tag != LDKErrorAction_DisconnectPeer {
							return nil
						}

						return ErrorAction_LDKDisconnectPeer_Body(cType: self.cType!.disconnect_peer, anchor: self)
					}
			
					public func getValueAsIgnoreAndLog() -> Level? {
						if self.cType?.tag != LDKErrorAction_IgnoreAndLog {
							return nil
						}

						return Level(value: self.cType!.ignore_and_log)
					}
			
					public func getValueAsSendErrorMessage() -> SendErrorMessage? {
						if self.cType?.tag != LDKErrorAction_SendErrorMessage {
							return nil
						}

						return ErrorAction_LDKSendErrorMessage_Body(cType: self.cType!.send_error_message, anchor: self)
					}
			
					public func getValueAsSendWarningMessage() -> SendWarningMessage? {
						if self.cType?.tag != LDKErrorAction_SendWarningMessage {
							return nil
						}

						return ErrorAction_LDKSendWarningMessage_Body(cType: self.cType!.send_warning_message, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> ErrorAction {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ErrorAction {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ErrorAction \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ErrorAction \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias ErrorAction_LDKDisconnectPeer_Body = DisconnectPeer
			

					/// 
					public class DisconnectPeer: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKErrorAction_LDKDisconnectPeer_Body?

						internal init(cType: LDKErrorAction_LDKDisconnectPeer_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKErrorAction_LDKDisconnectPeer_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// An error message which we should make an effort to send before we disconnect.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getMsg() -> Bindings.ErrorMessage {
							// return value (do some wrapping)
							let returnValue = Bindings.ErrorMessage(cType: self.cType!.msg, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> DisconnectPeer {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias ErrorAction_LDKSendErrorMessage_Body = SendErrorMessage
			

					/// 
					public class SendErrorMessage: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKErrorAction_LDKSendErrorMessage_Body?

						internal init(cType: LDKErrorAction_LDKSendErrorMessage_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKErrorAction_LDKSendErrorMessage_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The message to send.
						public func getMsg() -> Bindings.ErrorMessage {
							// return value (do some wrapping)
							let returnValue = Bindings.ErrorMessage(cType: self.cType!.msg, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> SendErrorMessage {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias ErrorAction_LDKSendWarningMessage_Body = SendWarningMessage
			

					/// 
					public class SendWarningMessage: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKErrorAction_LDKSendWarningMessage_Body?

						internal init(cType: LDKErrorAction_LDKSendWarningMessage_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKErrorAction_LDKSendWarningMessage_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The message to send.
						public func getMsg() -> Bindings.WarningMessage {
							// return value (do some wrapping)
							let returnValue = Bindings.WarningMessage(cType: self.cType!.msg, anchor: self)

							return returnValue;
						}
		
						/// The peer may have done something harmless that we weren't able to meaningfully process,
						/// though we should still tell them about it.
						/// If this event is logged, log it at the given level.
						public func getLogLevel() -> Level {
							// return value (do some wrapping)
							let returnValue = Level(value: self.cType!.log_level)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> SendWarningMessage {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		