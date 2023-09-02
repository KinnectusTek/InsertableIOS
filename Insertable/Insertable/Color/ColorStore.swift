//
//  ColorStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//
import SwiftUI
import Combine

class ColorStore: ObservableObject {
    
    @Published var color: Color = .white
    @Published var viewStore: InjectedViewStore
    @Published var stateSubject: CurrentValueSubject<InjectedState, Never>
    @Published var state: InjectedState

    init(store: InjectedViewStore, state: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = state
        self.state = state.value
        if let colorValue = findStringValue(id: store.colorKey, state: state.value) {
            self.color = Color(UIColor.hex(colorValue))
        }
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)

        $state
        .map { findStringValue(id: store.colorKey, state: $0) }
        .compactMap {$0}
        .map { Color(UIColor.hex($0))}
        .assign(to: &$color)
    }
}
