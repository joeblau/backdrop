//
//  BackdropAppReducer.swift
//  Backdrop
//
//  Created by Joe Blau on 7/1/21.
//

import ComposableArchitecture
import UIKit

struct BackdropState: Equatable {
    var outputImage = UIImage(named: "slack-imgs.jpg")!
    var inputImage = UIImage(named: "slack-imgs.jpg")!
}

enum BackdropAction: Equatable {
    case removeBackground
}

struct BackdropEnvironment {
}

let backdropReducer = Reducer<BackdropState, BackdropAction, BackdropEnvironment> { state, action, _ in
    switch action {
    case .removeBackground:
        switch state.inputImage.removeBackground(returnResult: .finalImage) {
        case let .some(newImage):
            state.outputImage = newImage
        case .none:
            break
        }
        return .none
    }
}
