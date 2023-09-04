//
//  ListStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/31/23.
//

import Foundation
import SwiftUI
import Combine

class ListStore: ObservableObject {
    @Published var listStates: [InjectedState] = []
    var itemStateSubjects: [CurrentValueSubject<InjectedState, Never>] {
        listStates.map {
            CurrentValueSubject<InjectedState, Never>($0)
        }
    }
    @Published var viewStore: ListViewStore
    @Published var stateSubject: CurrentValueSubject<InjectedState, Never>
    @Published var state: InjectedState
    private var cancellables = Set<AnyCancellable>()
    init(viewStore: ListViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject

        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().map { state in
            let listKey = viewStore.listKey
            
            if let list = state.state.first(where: {$0.id == listKey})?.array as? [InjectedValue] {
                return list.map { InjectedState(id: $0.id, state: [$0]) }
            } else {
                return []
            }
        }.assign(to: &$listStates)
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
    }
    
    func stateForItem(_ itemState: InjectedState) -> CurrentValueSubject<InjectedState, Never> {
        itemStateSubjects.first(where: {$0.value.id == itemState.id}) ?? CurrentValueSubject<InjectedState,Never>(InjectedState.init(id: "", state: []))
    }
}
