//
//  InjectedSystemFont.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/11/23.
//

import Foundation
import SwiftUI

enum InjectedSystemFont: String {
    case callout, caption, caption2, footnote, headline, largeTitle,
    subheadline, title, title2, title3
    
    var font: Font {
        switch self {
        case .callout:
            return Font.callout
        case .caption:
            return Font.caption
        case .caption2:
            return Font.caption2
        case .footnote:
            return Font.footnote
        case .headline:
            return Font.headline
        case .largeTitle:
            return Font.largeTitle
        case .subheadline:
            return Font.subheadline
        case .title:
            return Font.title
        case .title2:
            return Font.title2
        case .title3:
            return Font.title3
        }
    }
}

