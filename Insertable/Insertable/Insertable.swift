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
    private var _viewStore: InjectedViewStore {
        if viewStore.isViewStoreReference {
            return container.viewStores.first(where: {$0.id == viewStore.id })!
        } else {
            return viewStore
        }
    }
    @ViewBuilder var render: some View {
        switch viewStore {
        case .vStack:
        
            VStackInsertable(
                store: .init(store: _viewStore, stateSubject: state),
                container: container)
            
        case .hStack:
            
            HStackInsertable(
                store: .init(store: _viewStore, stateSubject: state),
                container: container)
        
        case .button:
            
            ButtonInsertable(container: container, store: .init(store: _viewStore, stateSubject: state))

        case .text:
           
            TextInsertable(store: .init(stateSubject: state, store: _viewStore), container: container)
                    
        case .field:
            
            TextFieldInsertable(container: container,
                                store: .init(store: _viewStore))
        
        case .fullScreenCover:
            
            FullScreenCoverInsertable(store: .init(store: _viewStore, stateSubject: state), container: <#T##ViewStoresContainer#>)
        
        case .sheet:
            
            SheetInsertable(container: container,
                            store: .init(store: _viewStore))
        
        case .spacer:
            
            SpacerInsertable(container: container,
                             store: .init(store: _viewStore))
            
        case .empty, .viewStoreReference:
            
            EmptyView()
            
        }
    }
    
    var body: some View {
        render
    }
}

