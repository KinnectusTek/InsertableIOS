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
    let viewStore: ButtonViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>

    @InjectedFunctionBuilder var action: InjectedFunctionBuilder {
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation1 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation2 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation3 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation4 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation5 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation6 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation7 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation8 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation9 ?? .noOperation)
        InjectedFunctionBuilder(
            state: stateSubject,
            operation: viewStore.operation10 ?? .noOperation)
    }
    
    init(store: ButtonViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>
    ) {
        self.stateSubject = stateSubject
        self.viewStore = store
        self.state = stateSubject.value
        
        stateSubject
            .eraseToAnyPublisher()
            .removeDuplicates()
            .map({
                $0
            })
            .assign(to: &$state)
        
    }
    
    func didCommitAction() {
        if let state = action.state {
            stateSubject.send(state.value)
        }
    }
}


