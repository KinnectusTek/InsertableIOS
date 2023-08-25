//
//  TextInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

class TextStore: ObservableObject {

    @Published var state: InjectedState
    @Published var text: String = ""
    @Published var modifiers: [InsertableModifier] = []
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    @InjectedFunctionBuilder var action: InjectedFunctionBuilder {
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.0)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.1)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.2)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.3)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.4)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.5)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.6)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.7)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.8)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.9)
    }
    
    init(stateSubject: CurrentValueSubject<InjectedState, Never>, store: InjectedViewStore) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)

        $state
            .map({ state in
                store.modifiers.map({ InsertableModifier(state: state, modifier: $0)})
            })
            .assign(to: &$modifiers)
        
        $state.map({
            findStringValue(id: store.text, state: $0)
        }).assign(to: &$text)
    }
}


struct TextInsertable: View {
    @ObservedObject var store: TextStore
    var container: ViewStoresContainer

    var body: some View {
        Text(store.text)
            .addModifiers(mods: store.modifiers)
    }
}
