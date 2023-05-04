//
//  DirectlyLinkedBindingsAppApp.swift
//  DirectlyLinkedBindingsApp
//
//  Created by Arik Sosman on 7/11/22.
//

import SwiftUI

@main
struct DirectlyLinkedBindingsAppApp: App {
    
    init() {
        print("Directly linked bindings app is initialized")
        Bindings.setLogThreshold(severity: .DEBUG)
        
        func printCompiledVersion() {
            let compiledVersion = Bindings.getLDKSwiftBindingsSerializationHash()
            print("Compiled version: \(compiledVersion)\n\(#file)::\(#function):\(#line)")
        }
        printCompiledVersion()
        
        do {
            let thing = Bindings.Fallback.initWithSegWitProgram(version: 255, program: [])
        }
        
        Fallback.enableDeinitLogging = false
        do {
            let thing = Bindings.Fallback.initWithSegWitProgram(version: 255, program: [])
            let otherThing = Bindings.UserConfig.initWithDefault()
        }
        
        // let tx = BuiltCommitmentTransaction(transactionArg: [], txidArg: [UInt8](repeating: 0, count: 32))
        
        let nativeNetwork = LDKNetwork_Regtest
        let swiftNetwork = Bindings.Network.Bitcoin
        
        let restoredNetwork = swiftNetwork.getCValue()
        let reconstructedNetwork = Bindings.Network(value: nativeNetwork)
        
        print("here we are")
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
