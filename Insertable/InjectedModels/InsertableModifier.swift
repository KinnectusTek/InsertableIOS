//
//  InsertableModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/27/23.
//

import Foundation
import Combine
import SwiftUI

struct InsertableModifier: ViewModifier {
    let stateSubject: CurrentValueSubject<InjectedState, Never>
    let container: ViewStoresContainer
    let modifier: InjectedModifier
    
    func body(content: Content) -> some View {
        switch modifier {
        case .font(let id):
            return AnyView(content.font(findFontValue(id: id, state: stateSubject.value)))
            
        case .frame(let id):
            let (width, height) = findFrameValue(id: id, state: stateSubject.value)
            return AnyView(content.frame(width: width, height: height))
            
        case .backgroundColor(let id):
            return AnyView(content.background(Color.random))
        case let .fullScreenCover(viewStore, isPresentedKey):
            let isPresented = findBooleanValue(id: isPresentedKey, state: stateSubject.value)
            return AnyView(
                content.fullScreenCover(isPresented: .constant(isPresented), content: {
                    Insertable(state: stateSubject, container: container, viewStore: viewStore)
                })
            )
        case let .sheet(viewStore, isPresentedKey):
            return AnyView(content)
//            return AnyView(
//                content.fullScreenCover(isPresented: .constant(true), content: {
//                    Insertable(state: stateSubject, container: container, viewStore: viewStore)
//                })
//            )
        }
    }
}

