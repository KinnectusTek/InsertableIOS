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
    func addModifier(mod: InjectedModifier, state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        modifier(InsertableModifier(stateSubject: state, container: container, modifier:  mod))
    }
    
    func addModifiers(mods: [InjectedModifier], state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        mods
            .map { modifier -> InsertableModifier in
                InsertableModifier(stateSubject: state, container: container, modifier: modifier)
            }
            .reduce(AnyView(self), { accum, nextModifier  in
            AnyView(accum.modifier(nextModifier))
        })
    }
    func eraseToAnyView() -> some View {
        AnyView(self)
    }
}


