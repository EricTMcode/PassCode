//
//  ContentView.swift
//  PassCode
//
//  Created by Eric on 05/02/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("You're in!")
                    
                    Button("LogOut") {
                        isAuthenticated = false
                    }
                }
            } else {
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
        .padding()
        .onChange(of: scenePhase) { oldPhase, newPhase in
            if newPhase == .inactive {
                isAuthenticated = false
            }
        }
        
    }
}

#Preview {
    ContentView()
}
