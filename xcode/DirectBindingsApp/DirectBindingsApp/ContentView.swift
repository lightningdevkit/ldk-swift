//
//  ContentView.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 8/20/21.
//

import SwiftUI

struct ContentView: View {

    @State private var isRunningTestFlow = false

    var body: some View {

        Button(action: {
            self.isRunningTestFlow = true
            if #available(iOS 15.0, *) {
                let sample = PolarIntegrationSample()
                Task {
                    try? await sample.testPolarFlow()
                    self.isRunningTestFlow = false
                }
            } else {
                // Fallback on earlier versions
            }
            
        }, label: {
            Text("Hello World")
        }).disabled(self.isRunningTestFlow)


    }

    /*@StateObject private var experiment = PolarConnectionExperiment()
    var body: some View {
        if !self.experiment.isMonitoring {
            Button("Monitor Chain") {
                self.experiment.startMonitoring()
            }.padding()
        } else {
            VStack {
                Text("Monitoring…").padding()
                if !self.experiment.hasCaughtUpToChainTip {
                    Text("Complete Sync").padding()
                } else if !self.experiment.hasCompletedChainSync {
                    Button("Complete Sync") {
                        self.experiment.completeChainSync()
                    }.padding()
                } else {
                    
                    Text("Sync Complete").padding()
                    
                    if !self.experiment.isConnectedToAlice {
                        Button("Connect to Alice") {
                            self.experiment.connectToAlice()
                        }.padding()
                    } else {
                        Text("Connected to Alice").padding()
                        
                        if !self.experiment.isChannelWithAliceOpen {
                            Button("Open Channel w/ Alice") {
                                self.experiment.openChannelWithAlice()
                            }.padding()
                        } else {
                            Text("Channel w/ Alice Open")
                        }
                    }
                }
            }
        }
    }*/
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
