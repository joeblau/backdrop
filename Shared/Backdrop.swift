//
//  BackdropApp.swift
//  Shared
//
//  Created by Joe Blau on 7/1/21.
//

import SwiftUI
import ComposableArchitecture

@main
struct BackdropApp: App {
    let appState = Store(initialState: BackdropState(),
                         reducer: backdropReducer, environment: <#T##Environment#>)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
