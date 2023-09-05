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
            
        case .vStack(let viewStore):
            
            VStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)
            
        case .hStack(let viewStore):
            
            HStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)
            
        case .zStack(let viewStore):
            
            ZStackInsertable(
                store: .init(store: viewStore, stateSubject: state),
                container: container)
            
        case .list(let viewStore):
            
            ListInsertable(
                store: .init(viewStore: viewStore, stateSubject: state),
                container: container)
            
        case .forEach(let viewStore):
            
            ForEachInsertable(
                store: .init(viewStore: viewStore, stateSubject: state),
                container: container)
            
        case .button(let viewStore):
            
            ButtonInsertable(container: container, store: .init(store: viewStore, stateSubject: state))
            
        case .text(let viewStore):
            
            TextInsertable(store: .init(stateSubject: state, store: viewStore), container: container)
            
        case .field(let viewStore):
            
            TextFieldInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
            
        case .namedImage(let viewStore), .systemImage(let viewStore):
            
            ImageInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
            
        case .color(let viewStore):
            
            ColorInsertable(store: .init(store: viewStore, state: state), container: container)
            
        case .spacer(let viewStore):
            
            SpacerInsertable(store: .init(store: viewStore, stateSubject: state), container: container)
        
        case .if(let viewStore):
        
            IfInsertable(store: .init(store: viewStore, stateSubject: state), container: container)    
        
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
