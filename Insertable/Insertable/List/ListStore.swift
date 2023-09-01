//
//  ListStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/31/23.
//

import Foundation
import SwiftUI
import Combine

class ListStore: ObserveableObject {
    @Published var listStates: [InjectedState] = []
    @Published var viewStore: InjectedViewStore
    @Published var stateSubject: StateSubject
    @Published var state: State
    init(viewStore: InjectedViewStore, stateSubject: StateSubject) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject

        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().map { state in
            let listKey = viewStore.listKey
            
            if let list = state.state.first(where: {$0.id == listKey}) as? [InjectedValue] {
                return list.map { value in
                   let itemState = InjectedState(id: value.id, state: [value])
                }
            } else {
                return []
            }
        }.assign(to: &$listStates)
        stateSubject.eraseToAnyPublisher().assign(to: &$state)

    }
}