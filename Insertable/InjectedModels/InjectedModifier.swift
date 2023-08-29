//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

enum InjectedModifier: Codable {
    case font(id: String)
    case frame(id: String)
    case backgroundColor(id: String)
    case fullScreenCover(viewStore: InjectedViewStore, isPresentedKey: String)
    case sheet(viewStore: InjectedViewStore, isPresentedKey: String)
}
