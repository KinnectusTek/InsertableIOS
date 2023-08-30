//
//  ImageStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/29/23.
//

import Foundation
import SwiftUI
import Combine

class ImageStore: ObservableObject {
    @Published var state: InjectedState
    @Published var image: Image = .init(systemName: "")
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(store: InjectedViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        $state.map { state in
            switch store {
            case .namedImage(let imageKey, _):
                return Image(findStringValue(id: imageKey, state: state))
            case .systemImage(let imageKey, _):
                return Image(systemName: findStringValue(id: imageKey, state: state))
            default:
                return Image.init(systemName: "")
            }
        }.assign(to: &$image)
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
    }
}
