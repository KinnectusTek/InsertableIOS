//
//  ButtonStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine


class ButtonStore: ObservableObject {

    @Published var state: InjectedState
    
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
        
    }
    
    func didCommitAction() {
        if let state = action.state {
            stateSubject.send(state.value)
        }
    }
}


