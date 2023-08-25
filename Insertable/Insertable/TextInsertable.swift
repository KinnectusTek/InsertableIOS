//
//  TextInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

class TextStore: ObservableObject {

    @Published var state: InjectedState
    @Published var text: String = ""
    @Published var modifiers: [InjectedModifier] = []
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(stateSubject: CurrentValueSubject<InjectedState, Never>, store: InjectedViewStore) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)

        $state.map({ _ in store.modifiers }).assign(to: &$modifiers)
        
        $state.map({
            findStringValue(id: store.text, state: $0)
        }).assign(to: &$text)
    }
}


struct TextInsertable: View {
    @ObservedObject var store: TextStore
    var container: ViewStoresContainer

    var body: some View {
        Text(store.text)
            .addModifiers(mods: store.modifiers)
    }
}
