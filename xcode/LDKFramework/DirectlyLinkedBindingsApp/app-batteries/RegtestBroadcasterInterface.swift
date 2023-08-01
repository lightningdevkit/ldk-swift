//
//  MyBroadcasterInterface.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

import Foundation

class RegtestBroadcasterInterface: BroadcasterInterface {
    
    override func broadcastTransactions(txs: [[UInt8]]) {
        

        let url = URL(string: "http://localhost:3000/api/lab/broadcast")!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!

        for tx in txs {
            print("TX TO BROADCAST: \(tx)")
            components.queryItems = [
                URLQueryItem(name: "tx", value: "\(tx)")
            ]

            let query = components.url!.query

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = Data(query!.utf8)

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request, completionHandler: { data, response, error in
                print("transaction broadcast result")
            })
            task.resume()
        }
    }
    
}
