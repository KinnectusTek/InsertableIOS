//
//  InjectedEdgeSet.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/12/23.
//

import Foundation
import SwiftUI

enum InjectedEdgeSet: String, Codable {
    case all
    case bottom
    case horizontal
    case leading
    case top
    case trailing
    case vertical
    
    var render: Edge.Set {
        switch self {
        case .all: return Edge.Set.all
        case .bottom: return Edge.Set.bottom
        case .horizontal: return Edge.Set.horizontal
        case .leading: return Edge.Set.leading
        case .top: return Edge.Set.top
        case .trailing: return Edge.Set.trailing
        case .vertical: return Edge.Set.vertical
        }
    }
}
