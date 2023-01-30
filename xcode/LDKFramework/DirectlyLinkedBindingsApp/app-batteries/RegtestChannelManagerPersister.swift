//
//  MyChannelManagerPersister.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/27/21.
//

import Foundation

class RegtestChannelManagerPersister : Persister, ExtendedChannelManagerPersister {
    
    
    private let channelManager: ChannelManager?
    private let keysManager: KeysManager? = nil
    
    init(channelManager: ChannelManager?) {
        self.channelManager = channelManager
        super.init()
    }
    
    func handleEvent(event: Event) {
        privateHandleEvent(event: event)
    }
    
    private func privateHandleEvent(event: Event) {
        if let spendableOutputEvent = event.getValueAsSpendableOutputs() {
            
            let outputs = spendableOutputEvent.getOutputs()
            
            let fastFeerate = 7500
            let destinationScriptHardcoded: [UInt8] = [118,169,20,25,18,157,83,230,49,155,175,25,219,160,89,190,173,22,109,249,10,184,245,136,172]
            
            guard let result = self.keysManager?.spendSpendableOutputs(descriptors: outputs, outputs: [], changeDestinationScript: destinationScriptHardcoded, feerateSatPer1000Weight: UInt32(fastFeerate)) else {
                return
            }
            
            if let transaction = result.getValue() {
                // sendEvent(eventName: MARKER_BROADCAST, eventBody: ["txhex": bytesToHex(bytes: transaction)])
            }
            
            return
            
        }else if let paymentSentEvent = event.getValueAsPaymentSent() {
            // print what needs printing
        }else if let pendingHTLCsForwardableEvent = event.getValueAsPendingHtlcsForwardable() {
            channelManager?.processPendingHtlcForwards()
            
            
            
            
            
            
        } else if let fundingReadyEvent = event.getValueAsFundingGenerationReady() {
            let outputScript = fundingReadyEvent.getOutputScript()
            let amount = fundingReadyEvent.getChannelValueSatoshis()
            
            print("ready stuff: \(amount) to  \(outputScript)")
            print("funding event ready!")
            
            let url = URL(string: "http://localhost:3000/api/lab/funding-generation-ready")!
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            
            let tcid = fundingReadyEvent.getTemporaryChannelId()
            
            components.queryItems = [
                URLQueryItem(name: "script", value: "\(outputScript)"),
                URLQueryItem(name: "amount", value: "\(amount)"),
                URLQueryItem(name: "tcid", value: "\(fundingReadyEvent.getTemporaryChannelId())"),
                URLQueryItem(name: "ucid", value: "\(fundingReadyEvent.getUserChannelId())")
            ]
            
            let query = components.url!.query
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = Data(query!.utf8)
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request, completionHandler: { data, response, error in
                print("received local funding generation ready response")
            })
            task.resume()
        }
    }
    
    override func persistManager(channelManager: Bindings.ChannelManager) -> Bindings.Result_NoneErrorZ {
        .initWithOk()
    }
}
