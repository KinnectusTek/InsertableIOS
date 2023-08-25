//
//  InjectedOperation.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/20/23.
//

import Foundation

indirect enum InjectedOperation: Codable {
    case multiplyByInteger(key: String, multiple: Int)
    case divideByInteger(key: String, quotient: Int)
    case assign(key: String, value: InjectedValue)
    case async(operation: InjectedOperation)
    case asyncAfter(operation: InjectedOperation, delay: Double)
    case noOperation
}
