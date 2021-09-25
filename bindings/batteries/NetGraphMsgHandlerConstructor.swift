//
//  NetGraphMsgHandlerConstructor.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 9/24/21.
//

import Foundation

public class NetGraphMsgHandlerConstructor {
    public static func initNetGraphMsgHandler(networkGraph: NetworkGraph, chainAccess: Access?, logger: Logger) -> NetGraphMsgHandler {
        return NetGraphMsgHandler(network_graph: networkGraph.dangle(), chain_access: Option_AccessZ(value: chainAccess), logger: logger)
    }
}
