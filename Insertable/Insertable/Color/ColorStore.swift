//
//  ColorStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//
import SwiftUI
import Combine

class ColorStore: ObservableObject {
    
    @Published var color: Color
    @Published var viewStore: InjectedViewStore
    @Published var stateSubject: CurrentValueSubject<InjectedState, Never>
    @Published var state: InjectedState

    init(store: InjectedViewStore, state: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = state
        self.state = state.value

        self.color = Color(UIColor.hex(findStringValue(id: store.colorKey, state: state.value)))

        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)

        $state.map { state in
            Color(UIColor.hex(findStringValue(id: store.colorKey, state: state)))
        }.assign(to: &$color)
    }
}
