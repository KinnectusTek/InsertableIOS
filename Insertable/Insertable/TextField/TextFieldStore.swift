//
//  TextFieldStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine
import SwiftUI

class TextFieldStore: ObservableObject {

    @Published var state: InjectedState
    @Published var text: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: FieldViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    var textBinding: Binding<String> {
        .init(
            get: {
                self.text
            },
            set: {[weak self] text in
                guard let self = self else { return }
                let state = updateState(state: self.state, newValue: .string(stateId: self.state.id, id: self.viewStore.textKey, value: text))
                self.stateSubject.send(state)
            }
        )
    }
    
    init(store: FieldViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.state = stateSubject.value
        self.stateSubject = stateSubject
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state
        .map { findStringValue(id: store.textKey, state: $0)}
        .compactMap { $0 }
        .assign(to: &$text)

    }
}
