//
//  View_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

extension View {
    func addModifier(modifier: InjectedModifier, state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        switch modifier {
        case .font(let id):
            return AnyView(self.font(findFontValue(id: id, state: state.value)))
            
        case .frame(let id):
            let (width, height) = findFrameValue(id: id, state: state.value)
            return AnyView(self.frame(width: width, height: height))
            
        case .backgroundColor(let id):
            return AnyView(self.background(Color.random))
        case let .fullScreenCover(viewStore, isPresentedKey):
            let isPresented = findBooleanValue(id: isPresentedKey, state: state.value)
            return AnyView(
                self.fullScreenCover(isPresented: .constant(isPresented), content: {
                    Insertable(state: state, container: container, viewStore: viewStore)
                })
            )
        case let .sheet(viewStore, isPresentedKey):
            return AnyView(self)
//            return AnyView(
//                content.fullScreenCover(isPresented: .constant(true), content: {
//                    Insertable(state: stateSubject, container: container, viewStore: viewStore)
//                })
//            )
        }
    }
    
   
    func addModifiers(mods: [InjectedModifier], state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        print(state.value)
        return mods
            .reduce(AnyView(self), { accum, nextModifier -> AnyView in
                accum.addModifier(modifier: nextModifier, state: state, container: container).eraseToAnyView()
        })
    }
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}


