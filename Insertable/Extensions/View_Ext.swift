//
//  View_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

extension View {
    func addModifier(mod: InsertableModifier) -> some View {
        modifier(mod)
    }
    
    func addModifiers(mods: [InsertableModifier]) -> some View {
        mods.reduce(AnyView(self), { accum, nextModifier  in
            AnyView(accum.modifier(nextModifier))
        })
    }
}


