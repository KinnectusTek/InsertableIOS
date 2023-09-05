//
//  HStackViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


struct HStackViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var alignmentKey: String = ""
    var spacingKey: String = ""
    var content1: InjectedViewStore = .empty()
    var content2: InjectedViewStore? = nil
    var content3: InjectedViewStore? = nil
    var content4: InjectedViewStore? = nil
    var content5: InjectedViewStore? = nil
    var content6: InjectedViewStore? = nil
    var content7: InjectedViewStore? = nil
    var content8: InjectedViewStore? = nil
    var content9: InjectedViewStore? = nil
    var content10: InjectedViewStore? = nil
}
