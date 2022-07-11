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
        
        let compiledVersion = Bindings.swift_ldk_get_compiled_version()
        print("Compiled version: \(compiledVersion)")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
