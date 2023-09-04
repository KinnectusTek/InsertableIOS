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
    let viewStore: ImageViewStore
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    
    init(store: ImageViewStore, stateSubject: CurrentValueSubject<InjectedState, Never>) {
        self.viewStore = store
        self.stateSubject = stateSubject
        self.state = stateSubject.value
        
        $state.map { state in
            if let imageKey = store.name {
                return Image(findStringValue(id: imageKey, state: state) ?? "" )
            } else if let imageKey = store.systemName {
                return Image(systemName: findStringValue(id: imageKey, state: state) ?? "" )
            } else {
                return Image(systemName: "photo.artframe")
            }
        }
        .assign(to: &$image)
        
        stateSubject.eraseToAnyPublisher().assign(to: &$state)
    }
}
