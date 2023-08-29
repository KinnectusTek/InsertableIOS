//
//  ContentView.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/16/23.
//

import SwiftUI
import Combine

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let state = CurrentValueSubject<InjectedState, Never>(getState())
        let container = getViewStores()
        ContentView(state: state, container: container)
    }
}
