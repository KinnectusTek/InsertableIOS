//
//  ButtonViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


struct ButtonViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var operation1: InjectedOperation? = nil
    var operation2: InjectedOperation? = nil
    var operation3: InjectedOperation? = nil
    var operation4: InjectedOperation? = nil
    var operation5: InjectedOperation? = nil
    var operation6: InjectedOperation? = nil
    var operation7: InjectedOperation? = nil
    var operation8: InjectedOperation? = nil
    var operation9: InjectedOperation? = nil
    var operation10: InjectedOperation? = nil
    var content: InjectedViewStore = .empty()
}
