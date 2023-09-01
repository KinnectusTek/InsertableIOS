//
//  ListInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/31/23.
//

import Foundation
import SwiftUI

struct ListInsertable: View {
    @ObservedObject var store: ListStore
    var container: ViewStoresContainer

    var body: some View {
        List(store.listStates, id: \.self) { itemState in
            Insertable(store: store.viewStore.itemStore(state: itemState), container: container)
        }
        .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
