//
//  NetGraphMsgHandlerConstructor.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 9/24/21.
//

#if SWIFT_PACKAGE
import LDKHeaders
import LDKBindings
#endif

import Foundation

public class NetGraphMsgHandlerConstructor {
    public static func initNetGraphMsgHandler(networkGraph: NetworkGraph, chainAccess: Access?, logger: Logger) -> NetGraphMsgHandler {
        return NetGraphMsgHandler(network_graph: networkGraph, chain_access: Option_AccessZ(value: chainAccess), logger: logger)
    }
}
