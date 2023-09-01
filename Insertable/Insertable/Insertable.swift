//
//  Insertable.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/16/23.
//

import Foundation
import SwiftUI
import WebKit
import Combine

struct Insertable: View {

    var state: CurrentValueSubject<InjectedState,Never>
    var container: ViewStoresContainer
    var viewStore: InjectedViewStore
    @ViewBuilder var render: some View {
        switch viewStore {
        case .vStack:
        
            VStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)
            
        case .hStack:
            
            HStackInsertable(
                store: .init(store: viewStore, container: container, stateSubject: state),
                container: container)
        case .zStack:

            ZStackInsertable(
                store: .init(store: viewStore, container: container, stateSubject: state),
                container: container)
        
        case .list:

            ListInsertable(
                store: .init(viewStore: viewStore, stateSubject: state),
                container: container)
        
        case .button:
            
            ButtonInsertable(container: container, store: .init(store: viewStore, stateSubject: state))

        case .text:
           
            TextInsertable(store: .init(stateSubject: state, store: viewStore), container: container)
                    
        case .field:
            
            TextFieldInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
            
        case .namedImage, .systemImage:
            
            ImageInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
        
        case .spacer:
            
            SpacerInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
            
        case .viewStoreReference(let id):
            if let viewStore = container.viewStores.first(where: {$0.id == id })  {
                Insertable(state: state, container: container, viewStore: viewStore)
            }
            
        case .empty:
            
            EmptyView()
            
        }
    }
    
    var body: some View {
        render
    }
}

