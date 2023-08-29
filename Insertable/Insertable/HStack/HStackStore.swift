//
//  HStackStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine
import SwiftUI

class HStackStore: ObservableObject {
    typealias Alignment = (InjectedState) -> VerticalAlignment
    typealias Spacing = (InjectedState) -> CGFloat
    
    @Published var state: InjectedState
    @Published var spacing: CGFloat? = nil
    @Published var alignment: VerticalAlignment = .center
    
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
    
    init(store: InjectedViewStore,
         container: ViewStoresContainer,
         stateSubject: CurrentValueSubject<InjectedState, Never>,
         alignmentTransform: Alignment? = nil,
         spacingTransform: Spacing? = nil) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        if let alignmentTransform = alignmentTransform {
            self.$state.map(alignmentTransform).assign(to: &$alignment)
        }
        
        if let spacingTransform = spacingTransform {
            self.$state.map(spacingTransform).assign(to: &$spacing)
        }
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
        
    }
}

