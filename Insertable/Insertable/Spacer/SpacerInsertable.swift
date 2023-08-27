//
//  SpacerInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//
import Foundation
import SwiftUI

struct SpacerInsertable: View {
    @ObservedObject var store: SpacerStore
    var container: ViewStoresContainer

    var body: some View {
        Spacer()
            .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
