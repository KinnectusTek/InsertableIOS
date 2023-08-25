//
//  SpacerInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//

import Foundation


import Foundation
import SwiftUI
import Combine

class SpacerStore: ObservableObject {

    @Published var state: InjectedState
    @Published var modifiers: [InsertableModifier] = []
    
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(store: InjectedViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)

        $state
            .map({ state in
                store.modifiers.map({ InsertableModifier(state: state, modifier: $0)})
            })
            .assign(to: &$modifiers)
    }
}


struct SpacerInsertable: View {
    @ObservedObject var store: SpacerStore
    var container: ViewStoresContainer

    var body: some View {
        Spacer()
            .addModifiers(mods: store.modifiers)
    }
}
