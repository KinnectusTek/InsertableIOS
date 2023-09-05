//
//  IfInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation
import SwiftUI

struct IfInsertable: View {
    @ObservedObject var store: IfStore
    var container: ViewStoresContainer
    
    var body: some View {
        if store.condition {
            Insertable(
                state: store.stateSubject,
                container: container,
                viewStore: store.viewStore.content)
        }
    }
}