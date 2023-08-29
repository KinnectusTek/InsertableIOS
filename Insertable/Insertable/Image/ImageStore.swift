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
    var image: Image
    let viewStore: InjectedViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(store: InjectedViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        
        switch store {
        case .namedImage(let name):
            self.image = Image(name)
        case .systemImage(let id):
            self.image = Image(systemName: id)
        default:
            self.image = Image.init(systemName: "")
        }
        stateSubject.eraseToAnyPublisher().assign(to: $&state)
    }
}
