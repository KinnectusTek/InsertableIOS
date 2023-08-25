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
}

struct InsertableModifier: ViewModifier {
    let state: InjectedState
    let modifier: InjectedModifier
    func body(content: Content) -> some View {
        switch modifier {
        case .font(let id):
            return AnyView(content.font(findFontValue(id: id, state: state)))
            
        case .frame(let id):
            let (width, height) = findFrameValue(id: id, state: state)
            return AnyView(content.frame(width: width, height: height))
            
        case .backgroundColor(let id):
            return AnyView(content.background(findColorValue(id: id, state: state)))
        }
    }
}
