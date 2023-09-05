//
//  ListViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

struct ListViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var listKey: String = ""
    var content: InjectedViewStore = .empty()
}
