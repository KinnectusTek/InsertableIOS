//
//  ButtonInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

class ButtonStore: ObservableObject {

    @Published var state: InjectedState
    @Published var modifiers: [InjectedModifier] = []
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
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
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ _ in store.modifiers })
            .assign(to: &$modifiers)
    }
    
    func didCommitAction() {
//        if let state = viewStore.action.state {
//            stateSubject.send(state.value)
//        }
    }
}



struct ButtonInsertable: View {
    var container: ViewStoresContainer
    @ObservedObject var store: ButtonStore

    var body: some View {
        Button(action: {
            store.didCommitAction()
        }, label: {
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content)
        })
    }
}

