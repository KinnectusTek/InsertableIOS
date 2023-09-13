//
//  LoginApp.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation
import SwiftUI
import Combine

//@main
struct LoginApp: App {
    var state = CurrentValueSubject<InjectedState, Never>(getState())
    var container = getViewStores()
    var body: some Scene {
        WindowGroup {
            LoginView(state: state, container: container)
        }
    }
}
