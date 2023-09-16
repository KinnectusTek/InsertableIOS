//
//  VStackStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine
import SwiftUI

class VStackStore: ObservableObject {
    @Published var state: InjectedState
    @Published var spacing: CGFloat? = nil
    @Published var alignment: HorizontalAlignment = .center
    private var cancellables = Set<AnyCancellable>()
    
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    let viewStore: VStackViewStore
    
    init(store: VStackViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state.map { state in
            let alignment = findStringValue(id: store.alignmentKey, state: state) ?? ""
            return VStackAlignment(rawValue: alignment)?.render ?? .center
        }.compactMap { $0 }.assign(to: &$alignment)
        
        $state.map { state in
            if let spacing = findOptionalDoubleValue(id: store.spacingKey, state: state) {
                return CGFloat(spacing)
            } else {
                return nil
            }
        }.assign(to: &$spacing)
    }
}
