//
//  StackAlignment.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/29/23.
//

import Foundation
import SwiftUI

enum VStackAlignment: String, Codable {
    case center, leading, trailing, listRowSeparatorLeading, listRowSeparatorTrailing
    
    var render: HorizontalAlignment {
        switch self {
        case .center:
            return HorizontalAlignment.center
        case .leading:
            return HorizontalAlignment.leading
        case .trailing:
            return HorizontalAlignment.trailing
        case .listRowSeparatorLeading:
            return HorizontalAlignment.listRowSeparatorLeading
        case .listRowSeparatorTrailing:
            return HorizontalAlignment.listRowSeparatorTrailing
        }
    }
}

enum HStackAlignment: String, Codable {
    case bottom, center, top, firstTextBaseline, lastTextBaseline
    
    var render: VerticalAlignment {
        switch self {
        case .center:
            return VerticalAlignment.center
        case .top:
            return VerticalAlignment.top
        case .bottom:
            return VerticalAlignment.bottom
        case .firstTextBaseline:
            return VerticalAlignment.firstTextBaseline
        case .lastTextBaseline:
            return VerticalAlignment.lastTextBaseline
        }
    }
}

enum ZStackAlignment: String, Codable {
    case trailing, leading, center, top, bottom, bottomLeading, bottomTrailing, topLeading, topTrailing, centerFirstTextBaseline, centerLastTextBaseline, leadingFirstTextBaseline, leadingLastTextBaseline, trailingFirstTextBaseline, trailingLastTextBaseline
    
    var render: Alignment {
        switch self {
        case .trailing:
            return Alignment.trailing
        case .leading:
            return Alignment.leading
        case .center:
            return Alignment.center
        case .top:
            return Alignment.top
        case .bottom:
            return Alignment.bottom
        case .bottomLeading:
            return Alignment.bottomLeading
        case .bottomTrailing:
            return Alignment.bottomTrailing
        case .topLeading:
            return Alignment.topLeading
        case .topTrailing:
            return Alignment.topTrailing
        case .centerFirstTextBaseline:
            return Alignment.centerFirstTextBaseline
        case .centerLastTextBaseline:
            return Alignment.centerLastTextBaseline
        case .leadingFirstTextBaseline:
            return Alignment.leadingFirstTextBaseline
        case .leadingLastTextBaseline:
            return Alignment.leadingLastTextBaseline
        case .trailingFirstTextBaseline:
            return Alignment.trailingFirstTextBaseline
        case .trailingLastTextBaseline:
            return Alignment.trailingLastTextBaseline
        }
    }
}
