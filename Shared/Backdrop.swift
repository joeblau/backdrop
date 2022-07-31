//
//  BackdropApp.swift
//  Shared
//
//  Created by Joe Blau on 7/1/21.
//

import SwiftUI
import ComposableArchitecture

@main
struct Backdrop: App {
    let store = Store(initialState: BackdropState(),
                         reducer: backdropReducer,
                         environment: BackdropEnvironment())
    
    var body: some Scene {
        WindowGroup {
            BackdropView(store: store)
                .frame(minWidth: 800, maxWidth: .infinity,
                     minHeight: 600, maxHeight: .infinity)
        }
    }
}
