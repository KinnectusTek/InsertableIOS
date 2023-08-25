//
//  SheetInsertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/20/23.
//


import Foundation
import Combine
import SwiftUI

class SheetStore: ObservableObject {
    @Published var state: InjectedState
    @Published var modifiers: [InsertableModifier] = []
    
    private var cancellables = Set<AnyCancellable>()
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    let viewStore: InjectedViewStore
    
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
    
    var isPresentedBinding: Binding<Bool> {
        .init {
            let isPresented = findBooleanValue(id: self.viewStore.isSheetDisplayedKey, state: self.state)
            return isPresented
        } set: { [weak self] isPresented in
            guard let self = self else { return }
            let state = InjectedViewStore.updateState(state: self.state, newValue: .boolean(id: self.viewStore.text, value: isPresented))
            self.stateSubject.send(state)
        }

    }
    init(store: InjectedViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>){
        
        self.stateSubject = stateSubject
        self.viewStore = store
        self.state = stateSubject.value
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)

        $state
            .map({ state in
                store.modifiers.map({ InsertableModifier(state: state, modifier: $0)})
            })
            .assign(to: &$modifiers)
    }
}


struct SheetInsertable: View {
    @ObservedObject var store: SheetStore
    var container: ViewStoresContainer
    
    var body: some View {
        Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.content.0)
        .addModifiers(mods: store.modifiers)
        .sheet(isPresented: store.isPresentedBinding) {
            Insertable(state: store.stateSubject, container: container, viewStore: store.viewStore.presentedContent)
        }
    }
}


