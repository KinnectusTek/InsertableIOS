//
//  ForEachInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/2/23.
//

import Foundation
import SwiftUI

struct ForEachInsertable: View {

    @ObservedObject var store: ForEachStore
    var container: ViewStoresContainer

    var body: some View {
        ForEach(store.forEachStates, id: \.self) { forEachState in
            Insertable(
                state: store.stateForItem(forEachState),
                container: container,
                viewStore: store.viewStore.forEachStore)
            
        }
        .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
