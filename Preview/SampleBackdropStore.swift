//
//  SampleBackdropStore.swift
//  Backdrop
//
//  Created by Joe Blau on 7/1/21.
//

#if DEBUG
import ComposableArchitecture

let sampleStore = Store(initialState: BackdropState(),
                        reducer: backdropReducer,
                        environment: BackdropEnvironment())

#endif
