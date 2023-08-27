//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

enum InjectedModifier: Codable {
    case font(id: String)
    case frame(id: String)
    case backgroundColor(id: String)
    case fullScreenCover(viewStore: InjectedViewStore)
    case sheet(viewStore: InjectedViewStore)
}

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
            return AnyView(content.background(findColorValue(id: id, state: stateSubject.value)))
        
        case .fullScreenCover(let viewStore):
            var isPresentedBinding: Binding<Bool> {
                .init {
                    let isPresented = findBooleanValue(id: viewStore.isFullScreenDisplayedKey, state: stateSubject.value)
                    return isPresented
                } set: { isPresented in
                    let state = InjectedViewStore.updateState(state: stateSubject.value, newValue: .boolean(id: viewStore.text, value: isPresented))
                    stateSubject.send(state)
                }
            }
            return AnyView(
                content.fullScreenCover(isPresented: isPresentedBinding, content: {
                   Insertable(state: stateSubject, container: container, viewStore: viewStore)
                })
            )
        case .sheet(let viewStore):
            var isPresentedBinding: Binding<Bool> {
                .init {
                    let isPresented = findBooleanValue(id: viewStore.isFullScreenDisplayedKey, state: stateSubject.value)
                    return isPresented
                } set: { isPresented in
                    let state = InjectedViewStore.updateState(state: stateSubject.value, newValue: .boolean(id: viewStore.text, value: isPresented))
                    stateSubject.send(state)
                }
            }
            return AnyView(
                content.sheet(isPresented: isPresentedBinding, content: {
                   Insertable(state: stateSubject, container: container, viewStore: viewStore)
                })
            )
        }
    }
}
