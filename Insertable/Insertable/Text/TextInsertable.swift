//
//  TextInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

struct TextInsertable: View {
    @ObservedObject var store: TextStore
    var container: ViewStoresContainer

    var body: some View {
        Text(store.text)
            .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
