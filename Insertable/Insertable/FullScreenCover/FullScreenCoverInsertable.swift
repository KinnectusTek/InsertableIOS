//
//  FullScreenCoverInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//

import Foundation
import Combine
import SwiftUI



struct FullScreenCoverInsertable: View {
    
    @ObservedObject var store: FullScreenCoverStore
    var container: ViewStoresContainer

    var body: some View {
        Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content.0)
            .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        .fullScreenCover(isPresented: store.isPresentedBinding) {
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.presentedContent)
        }
    }
}
