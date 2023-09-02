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
    @Published var state: InjectedState
    @Published var spacing: CGFloat? = nil
    @Published var alignment: VerticalAlignment = .center
    
    private var cancellables = Set<AnyCancellable>()
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    let viewStore: InjectedViewStore
  
    init(store: InjectedViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
        
        $state.map { state in
            let alignment = findStringValue(id: store.alignmentKey, state: state) ?? ""
            switch HStackAlignment(rawValue: alignment) {
            case .center?:
                return VerticalAlignment.center
            case .top?:
                return VerticalAlignment.top
            case .bottom?:
                return VerticalAlignment.bottom
            case .firstTextBaseline?:
                return VerticalAlignment.firstTextBaseline
            case .lastTextBaseline?:
                return VerticalAlignment.lastTextBaseline
            default:
                return nil
            }
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

