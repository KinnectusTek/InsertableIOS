//
//  TextFieldInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

struct TextFieldInsertable: View {
    @ObservedObject var store: TextFieldStore
    var container: ViewStoresContainer

    var body: some View {
        TextField("Email",text: store.textBinding)
            .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)
    }
}
