//
//  HStackInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

struct HStackInsertable: View {
    
    @ObservedObject var store: HStackStore
    var container: ViewStoresContainer
    
    var body: some View {
        HStack {
            
            Insertable(state: store.stateSubject, container: container, id: store.viewStore.content.0)
            
            if let content = store.viewStore.content.1 {
                Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.2 {
                    Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.3 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.4 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.5 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.6 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.7 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.8 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
            if let content = store.viewStore.content.9 {
                        Insertable(state: store.stateSubject, container: container, viewStore: content)
            }
        }.addModifiers(mods: store.viewStore.modifiers)
    }
}

