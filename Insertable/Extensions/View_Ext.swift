//
//  View_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}


