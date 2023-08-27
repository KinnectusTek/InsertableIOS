//
//  SheetInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/20/23.
//


import Foundation
import Combine
import SwiftUI

struct SheetInsertable: View {
    @ObservedObject var store: SheetStore
    var container: ViewStoresContainer
    
    var body: some View {
        Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content.0)
            .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
        .sheet(isPresented: store.isPresentedBinding) {
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.presentedContent)
        }
    }
}


