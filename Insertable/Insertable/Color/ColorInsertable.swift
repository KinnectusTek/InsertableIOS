//
//  ColorInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//

import Foundation
import SwiftUI

struct ColorInsertable: View {
    @ObservedObject var store: ColorStore
    var container: ViewStoresContainer

    var body: some View {
        Color(store.color)
        .addModifiers(mods: store.viewStore.modifiers, state: store.stateSubject, container: container)

    }
}