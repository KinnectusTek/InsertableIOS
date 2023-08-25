//
//  InsertableApp.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/16/23.
//

import SwiftUI
import Combine


@main
struct InsertableApp: App {
    var state = CurrentValueSubject<InjectedState, Never>(getState())
    var container = getViewStores()
    var body: some Scene {
        WindowGroup {
            ContentView(state: state, container: container)
        }
    }
}
