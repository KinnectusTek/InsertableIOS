//
//  LoginView.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation
import SwiftUI
import Combine

struct LoginView: View {
    var state: CurrentValueSubject<InjectedState,Never>
    var container: ViewStoresContainer
    var entry: InjectedViewStore {
        container.viewStores.first(where: {$0.id == "entry" })!
    }
    var value: Bool = false
    var body: some View {
        Insertable(state: state, container: container, viewStore: entry)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let state = CurrentValueSubject<InjectedState, Never>(getState())
        let container = getViewStores()
        LoginView(state: state, container: container)
    }
}
