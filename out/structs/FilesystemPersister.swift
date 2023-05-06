
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// FilesystemPersister persists channel data on disk, where each channel's
			/// data is stored in a file named after its funding outpoint.
			/// 
			/// Warning: this module does the best it can with calls to persist data, but it
			/// can only guarantee that the data is passed to the drive. It is up to the
			/// drive manufacturers to do the actual persistence properly, which they often
			/// don't (especially on consumer-grade hardware). Therefore, it is up to the
			/// user to validate their entire storage stack, to ensure the writes are
			/// persistent.
			/// Corollary: especially when dealing with larger amounts of money, it is best
			/// practice to have multiple channel data backups and not rely only on one
			/// FilesystemPersister.
			public typealias FilesystemPersister = Bindings.FilesystemPersister

			extension Bindings {
		

				/// FilesystemPersister persists channel data on disk, where each channel's
				/// data is stored in a file named after its funding outpoint.
				/// 
				/// Warning: this module does the best it can with calls to persist data, but it
				/// can only guarantee that the data is passed to the drive. It is up to the
				/// drive manufacturers to do the actual persistence properly, which they often
				/// don't (especially on consumer-grade hardware). Therefore, it is up to the
				/// user to validate their entire storage stack, to ensure the writes are
				/// persistent.
				/// Corollary: especially when dealing with larger amounts of money, it is best
				/// practice to have multiple channel data backups and not rely only on one
				/// FilesystemPersister.
				public class FilesystemPersister: NativeTypeWrapper {

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

					internal var cType: LDKFilesystemPersister?

					internal init(cType: LDKFilesystemPersister, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKFilesystemPersister, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKFilesystemPersister, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the FilesystemPersister, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FilesystemPersister_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Initialize a new FilesystemPersister and set the path to the individual channels'
					/// files.
					public init(pathToChannelData: String) {
						// native call variable prep
						
						let pathToChannelDataPrimitiveWrapper = Str(value: pathToChannelData, instantiationContext: "FilesystemPersister.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = FilesystemPersister_new(pathToChannelDataPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						pathToChannelDataPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = FilesystemPersister(cType: nativeCallResult, instantiationContext: "FilesystemPersister.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "FilesystemPersister.swift::\(#function):\(#line)")
				
			
					}
		
					/// Get the directory which was provided when this persister was initialized.
					public func getDataDir() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKFilesystemPersister>) in
				FilesystemPersister_get_data_dir(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult, instantiationContext: "FilesystemPersister.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read `ChannelMonitor`s from disk.
					public func readChannelmonitors(entropySource: EntropySource, signerProvider: SignerProvider) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKFilesystemPersister>) in
				
						withUnsafePointer(to: signerProvider.activate().cType!) { (signerProviderPointer: UnsafePointer<LDKSignerProvider>) in
				FilesystemPersister_read_channelmonitors(thisArgPointer, entropySource.activate().cType!, signerProviderPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(cType: nativeCallResult, instantiationContext: "FilesystemPersister.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> FilesystemPersister {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> FilesystemPersister {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> FilesystemPersister {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing FilesystemPersister \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing FilesystemPersister \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		