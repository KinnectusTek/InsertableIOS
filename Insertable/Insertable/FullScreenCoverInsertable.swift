//
//  FullScreenCoverInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//

import Foundation
import Combine
import SwiftUI

class FullScreenCoverStore: ObservableObject {
    @Published var state: InjectedState
    @Published var modifiers: [InjectedModifier] = []
    
    private var cancellables = Set<AnyCancellable>()
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    var isPresentedBinding: Binding<Bool> {
        .init {
            let isPresented = findBooleanValue(id: self.viewStore.isFullScreenDisplayedKey, state: self.state)
            return isPresented
        } set: { [weak self] isPresented in
            guard let self = self else { return }
            let state = InjectedViewStore.updateState(state: self.state, newValue: .boolean(id: self.viewStore.text, value: isPresented))
            self.stateSubject.send(state)
        }

    }
    @InjectedFunctionBuilder var action: InjectedFunctionBuilder {
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.0)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.1)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.2)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.3)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.4)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.5)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.6)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.7)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.8)
        InjectedFunctionBuilder(state: stateSubject, operation: viewStore.operations.9)
    }
    
    init(store: InjectedViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.state = stateSubject.value
        self.stateSubject = stateSubject
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)

        stateSubject
            .eraseToAnyPublisher()
            .map({ _ in store.modifiers })
            .assign(to: &$modifiers)
    }
}


struct FullScreenCoverInsertable: View {
    
    @ObservedObject var store: FullScreenCoverStore
    var container: ViewStoresContainer

    var body: some View {
        Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content.0)
        .addModifiers(mods: store.modifiers)
        .fullScreenCover(isPresented: store.isPresentedBinding) {
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.presentedContent)
        }
    }
}
