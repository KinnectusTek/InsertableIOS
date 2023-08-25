//
//  InjectedModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI

enum InjectedModifier: Codable, ViewModifier {
    case font(state: InjectedState,
              statePropertyId: String)
    case frame(state: InjectedState,
               statePropertyId: String)
    case backgroundColor(state: InjectedState,
                         statePropertyId: String)
    func body(content: Content) -> some View {
        switch self {
        case let .font(state, id):
            return AnyView(content.font(findFontValue(id: id, state: state)))
            
        case let .frame(state, id):
            let (width, height) = findFrameValue(id: id, state: state)
            return AnyView(content.frame(width: width, height: height))
            
        case let .backgroundColor(state, id):
            return AnyView(content.background(findColorValue(id: id, state: state)))
        }
    }
}
