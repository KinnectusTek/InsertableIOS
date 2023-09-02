//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

enum InjectedModifier: Codable {
    case font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil)
    case frame(stateId: String = "", widthId: String = "", heightId: String = "", width: Double? = nil, height: Double? = nil)
    case cornerRadius(stateId: String = "", valueId: String = "", radius: Double? = nil)
    case borderline(stateId: String = "", widthId: String = "", colorId: String = "", width: Double? = nil, colorHex: String? = nil)
    case backgroundColor(stateId: String = "", valueId: String = "", colorHex: String? = nil)
    case fullScreenCover(viewStore: InjectedViewStore, isPresentedKey: String)
    case sheet(viewStore: InjectedViewStore, isPresentedKey: String)
}
