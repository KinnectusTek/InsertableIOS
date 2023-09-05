//
//  IfStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation
import Combine

class IfStore: ObservableObject {
    var viewStore: IfViewStore
    var stateSubject: CurrentValueSubject<InjectedState,Never>
    @Published var state: InjectedState
    @Published var condition: Bool = false
    
    init(store: IfViewStore, stateSubject: CurrentValueSubject<InjectedState,Never>) {
        self.store = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        self.condition = stateSubject.value[store.conditionKey] as? Bool ?? false

        self.stateSubject.erasesToAnyPublisher().assign(to: &$state)

        stateSubject.map { state in 
            findBooleanValue(state: state, key: store.conditionKey)
        }
        .compactMap { $0 }
        .assign(to: &$condition)
    }
}
