//
//  TextFieldInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

class TextFieldStore: ObservableObject {

    @Published var state: InjectedState
    @Published var modifiers: [InjectedModifier] = []
    @Published var text: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    var textBinding: Binding<String> {
        .init(
            get: {
                self.text
            },
            set: {[weak self] text in
                guard let self = self else { return }
                let state = InjectedViewStore.updateState(state: self.state, newValue: .string(id: self.viewStore.text, value: text))
                self.stateSubject.send(state)
            }
        )
    }
    
    init(store: InjectedViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
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
        
        $state.map({
            findStringValue(id: store.text, state: $0)
        }).assign(to: &$text)

    }
}



struct TextFieldInsertable: View {
    @ObservedObject var store: TextFieldStore
    var container: ViewStoresContainer

    var body: some View {
        TextField("Email",text: store.textBinding)
            .addModifiers(mods: store.modifiers)
    }
}
