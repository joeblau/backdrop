//
//  BackdropAppReducer.swift
//  Backdrop
//
//  Created by Joe Blau on 7/1/21.
//

import ComposableArchitecture

struct BackdropState: Equatable {
}

enum BackdropAction: Equatable {
}

enum BackdropEnvironment {
}

let backdropReducer = Reducer<BackdropState, BackdropAction, BackdropEnvironment> { _, _, _ in
    return .none
}
