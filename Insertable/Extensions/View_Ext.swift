//
//  View_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

extension View {
    func addModifier(mod: InjectedModifier) -> some View {
        modifier(mod)
    }
    
    func addModifiers(mods: [InjectedModifier]) -> some View {
        mods.reduce(self, { accum, nextModifier  in
            accum.addModifier(mod: nextModifier) as! Self
        })
    }
}


