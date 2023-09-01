//
//  ListStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/31/23.
//

import Foundation
import SwiftUI
import Combine

class ListStore: ObserveableObject {
    @Published var listItems: [InjectedViewStore] = []
    @Published var viewStore: InjectedViewStore
    @Published var stateSubject: StateSubject
    
    init(viewStore: InjectedViewStore, stateSubject: StateSubject) {
        self.viewStore = viewStore
        self.stateSubject = stateSubject



    }
}