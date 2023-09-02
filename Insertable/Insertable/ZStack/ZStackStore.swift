//
//  ZStackStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/30/23.
//

import Foundation
import Combine
import SwiftUI

class ZStackStore: ObservableObject {
    @Published var state: InjectedState
    @Published var alignment: Alignment = .center
    private var cancellables = Set<AnyCancellable>()
    
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    let viewStore: InjectedViewStore
    
    init(store: InjectedViewStore,
         stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        
        
        stateSubject
            .eraseToAnyPublisher()
            .map({ $0 })
            .assign(to: &$state)
        
        $state.map { state  -> Alignment in
            let alignment = findStringValue(id: store.alignmentKey, state: state) ?? ""
            switch ZStackAlignment(rawValue: alignment) {
            case .trailing?:
                return Alignment.trailing
            case .leading?:
                return Alignment.leading
            case .center?:
                return Alignment.center
            case .top?:
                return Alignment.top
            case .bottom?:
                return Alignment.bottom
            case .bottomLeading?:
                return Alignment.bottomLeading
            case .bottomTrailing?:
                return Alignment.bottomTrailing
            case .topLeading?:
                return Alignment.topLeading
            case .topTrailing?:
                return Alignment.topTrailing
            case .centerFirstTextBaseline?:
                return Alignment.centerFirstTextBaseline
            case .centerLastTextBaseline?:
                return Alignment.centerLastTextBaseline
            case .leadingFirstTextBaseline?:
                return Alignment.leadingFirstTextBaseline
            case .leadingLastTextBaseline?:
                return Alignment.leadingLastTextBaseline
            case .trailingFirstTextBaseline?:
                return Alignment.trailingFirstTextBaseline
            case .trailingLastTextBaseline?:
                return Alignment.trailingLastTextBaseline
            default:
                return Alignment.center
            }
            
        }.compactMap { $0 }.assign(to: &$alignment)
        
    }
}
