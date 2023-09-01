//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

enum InjectedModifier: Codable {
    case font(stateId: String = "", valueId: String = "", fontName: String = "", fontSize: Double = 12)
    case frame(stateId: String = "", valueId: String = "", width: Double = 0, height: Double = 0)
    case cornerRadius(stateId: String = "", valueId: String = "", radius: Double = 0)
    case borderline(stateId: String = "", valueId: String = "", width: Double = 0, colorHex: String = "")
    case backgroundColor(stateId: String = "", valueId: String = "", colorHex: String = "")
    case fullScreenCover(viewStore: InjectedViewStore, isPresentedKey: String)
    case sheet(viewStore: InjectedViewStore, isPresentedKey: String)
}
