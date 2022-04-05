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
    
    func handle_event(event: Event) {
        privateHandleEvent(event: event)
    }
    
    
    func convertRouteHop(path: [LDKRouteHop]) {
        let wrappedPath = path.map { (h) in RouteHop(pointer: h) }
    }
    
    
    private func privateHandleEvent(event: Event) {
        if let spendableOutputEvent = event.getValueAsSpendableOutputs() {
            
            let outputs = spendableOutputEvent.getOutputs()
            
            let fastFeerate = 7500
            let destinationScriptHardcoded: [UInt8] = [118,169,20,25,18,157,83,230,49,155,175,25,219,160,89,190,173,22,109,249,10,184,245,136,172]
            
            guard let result = self.keysManager?.spend_spendable_outputs(descriptors: outputs, outputs: [], change_destination_script: destinationScriptHardcoded, feerate_sat_per_1000_weight: UInt32(fastFeerate)) else {
                return
            }
            
            if let transaction = result.getValue() {
                // sendEvent(eventName: MARKER_BROADCAST, eventBody: ["txhex": bytesToHex(bytes: transaction)])
            }
            
            return
            
        }else if let paymentSentEvent = event.getValueAsPaymentSent() {
            // print what needs printing
        }else if let pendingHTLCsForwardableEvent = event.getValueAsPendingHTLCsForwardable() {
            channelManager?.process_pending_htlc_forwards()
            
            
            
            // LDKC2Tuple_usizeTransactionZ(a: <#T##UInt#>, b: <#T##LDKTransaction#>)
            // channelManager?.as_Confirm().transactions_confirmed(header: <#T##[UInt8]?#>, txdata: <#T##[LDKC2Tuple_usizeTransactionZ]#>, height: <#T##UInt32#>)
            
            // C2Tuple_usizeTransactionZ_new(<#T##a: UInt##UInt#>, <#T##b: LDKTransaction##LDKTransaction#>)
            
            
            
            
        }else if let fundingReadyEvent = event.getValueAsFundingGenerationReady() {
            let outputScript = fundingReadyEvent.getOutput_script()
            let amount = fundingReadyEvent.getChannel_value_satoshis()
            
            print("ready stuff: \(amount) to  \(outputScript)")
            print("funding event ready!")
            
            let url = URL(string: "http://localhost:3000/api/lab/funding-generation-ready")!
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            
            let tcid = fundingReadyEvent.getTemporary_channel_id()
            
            components.queryItems = [
                URLQueryItem(name: "script", value: "\(outputScript)"),
                URLQueryItem(name: "amount", value: "\(amount)"),
                URLQueryItem(name: "tcid", value: "\(fundingReadyEvent.getTemporary_channel_id())"),
                URLQueryItem(name: "ucid", value: "\(fundingReadyEvent.getUser_channel_id())")
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
    
    override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
        /*
         let managerBytes = channel_manager.write()
         let defaults = UserDefaults.standard
         defaults.setValue(Data(managerBytes), forKey: "manager")
         print("PERSIST CHANNEL MANAGER:\n\n\(managerBytes)\n\n")
         */
        return Result_NoneErrorZ.ok()
    }
}
