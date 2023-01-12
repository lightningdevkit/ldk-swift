//
//  BlockchainObserver.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 4/10/22.
//

import Foundation

/// A class that's supposed to help monitoring a regtest blockchain data using the bitcoin RPC interface.
///
@available(iOS 15.0, *)
class RegtestBlockchainManager: BlockchainObserver {

    /**
     Mine regtest blocks
     - Parameters:
       - number: The number of blocks to mine
       - coinbaseDestinationAddress: The output address to be used in the coinbase transaction(s)
     - Returns: Array of the mined blocks' hashes
     - Throws: If the RPC connection fails or the call results in an error
     */
    public func mineBlocks(number: Int64, coinbaseDestinationAddress: String) async throws -> [String] {
        let response = try await self.callRpcMethod(method: "generatetoaddress", params: [
            "nblocks": number,
            "address": coinbaseDestinationAddress
        ])
        let result = response["result"] as! [String]
        return result
    }

    /**
     Invalidate or un-mine a block
     - Parameter hash: The block hash hex to invalidate
     - Returns:
     - Throws:
     */
    public func unmineBlock(hash: String) async throws {
        let response = try await self.callRpcMethod(method: "invalidateblock", params: [hash])
    }

}
