//
//  ContentView.swift
//  Shared
//
//  Created by Joe Blau on 7/1/21.
//

import SwiftUI
import ComposableArchitecture

struct BackdropView: View {
    let store: Store<BackdropState, BackdropAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack{
                HStack {
                    Button {
                        viewStore.send(.removeBackground)
                    } label: {
                        Text("Remove")
                    }
                }
                Image(uiImage: viewStore.inputImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                Image(uiImage: viewStore.outputImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .background(Color.green)
        }
    }
}

#if DEBUG
struct BackdropView_Previews: PreviewProvider {
    static var previews: some View {
        BackdropView(store: sampleStore)
    }
}
#endif
