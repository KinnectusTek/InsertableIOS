//
//  TextStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine

class TextStore: ObservableObject {

    @Published var state: InjectedState
    @Published var text: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(stateSubject: CurrentValueSubject<InjectedState, Never>, store: InjectedViewStore) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
        
        $state
        .map { findStringValue(id: store.text, state: $0)}
        .compactMap { $0 }
        .assign(to: &$text)
    }
}

