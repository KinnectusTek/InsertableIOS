//
//  Array_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation
extension Array {
    
    func itemAtIndex(index: Int) -> Self.Element? {
        if count > index {
            return self[index]
        } else {
            return nil
        }
    }
    
    func appending(_ item: Element) -> Array {
        var copy = self
        copy.append(item)
        return copy
    }
}
