//
//  DirectBindingsAppApp.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 8/20/21.
//

import SwiftUI

@main
struct DirectBindingsAppApp: App {
    
    init() {
        print("Direct Bindings App is initialized")
        
        let compiledVersion = Bindings.swift_ldk_get_compiled_version()
        print("Compiled version: \(compiledVersion)")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
