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
            return AnyView(self.background(Color(UIColor.hex(findStringValue(id: id, state: state.value)))))
        case let .fullScreenCover(viewStore, isPresentedKey):
            AnyView(
                self.fullScreenCover(isPresented: .constant(findBooleanValue(id: isPresentedKey, state: state.value)), content: {
                    Insertable(state: state, container: container, viewStore: viewStore)
                })
            )
        case let .sheet(viewStore, isPresentedKey):
            AnyView(
                self.sheet(isPresented: .constant(findBooleanValue(id: isPresentedKey, state: state.value)), content: {
                    Insertable(state: state, container: container, viewStore: viewStore)
                })
            )
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


