//
//  ButtonInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

class ButtonStore: ObservableObject {

    @Published var state: InjectedState
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
    
    init(store: InjectedViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>
    ) {
        self.stateSubject = stateSubject
        self.viewStore = store
        self.state = stateSubject.value
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state
            .map({ state in
                store.modifiers.map({ InsertableModifier(state: state, modifier: $0)})
            })
            .assign(to: &$modifiers)
    }
    
    func didCommitAction() {
        if let state = action.state {
            stateSubject.send(state.value)
        }
    }
}



struct ButtonInsertable: View {
    var container: ViewStoresContainer
    @ObservedObject var store: ButtonStore

    var body: some View {
        Button(action: {
            store.didCommitAction()
        }, label: {
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content.0)
        }).addModifiers(mods: store.modifiers)
    }
}

