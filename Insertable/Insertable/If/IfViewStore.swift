//
//  IfViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

struct IfViewStore: Codable {
    var id: String = ""
    var conditionKey: String = ""
    var content: InjectedViewStore = .empty()
}