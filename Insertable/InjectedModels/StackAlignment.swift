//
//  StackAlignment.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/29/23.
//

import Foundation

enum VStackAlignment: String, Codable {
    case center, leading, trailing, listRowSeparatorLeading, listRowSeparatorTrailing
}

enum HStackAlignment: String, Codable {
    case bottom, center, top, firstTextBaseline, lastTextBaseline
}
