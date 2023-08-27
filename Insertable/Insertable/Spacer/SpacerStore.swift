//
//  SpacerStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine

class SpacerStore: ObservableObject {

    @Published var state: InjectedState
    
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(store: InjectedViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
    }
}
