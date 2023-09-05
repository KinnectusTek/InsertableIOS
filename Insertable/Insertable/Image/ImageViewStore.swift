//
//  ImageViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation


struct ImageViewStore: Codable {
    var id: String = ""
    var name: String? = nil
    var systemName: String? = nil
    var modifiers: [InjectedModifier] = []
}

