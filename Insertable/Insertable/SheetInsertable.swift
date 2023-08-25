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
    @Published var modifiers: [InjectedModifier] = []
    
    private var cancellables = Set<AnyCancellable>()
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    let viewStore: InjectedViewStore
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

        stateSubject
            .eraseToAnyPublisher()
            .map({ _ in store.modifiers })
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


