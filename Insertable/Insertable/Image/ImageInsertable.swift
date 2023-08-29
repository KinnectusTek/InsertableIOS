//
//  ImageInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/29/23.
//

import Foundation
import SwiftUI


struct ImageInsertable: View {
   @ObservedObject var store: ImageStore
    var container: ViewStoresContainer
    var body: some View {
        store.image
            .addModifiers(mods: store.viewStore.modifiers,
                          state: store.stateSubject,
                          container: container)
    }
}
