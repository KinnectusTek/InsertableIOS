//
//  InjectedValue.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//
import Foundation
import SwiftUI

enum InjectedValue: Codable {

    case string(id: String, value: String)
    case integer(id: String, value: Int)
    case double(id: String, value: Double)
    case boolean(id: String, value: Bool)
    case data(id: String, value: Data)
    case stringArray(id: String, value: [String])
    case integerArray(id: String, value: [Int])
    case doubleArray(id: String, value: [Double])
    case booleanArray(id: String, value: [Bool])
    case dataArray(id: String, value: [Data])
    case font(id: String, name: String, size: Int)
    case frame(id: String, width: Float, height: Float)
    case backgroundColor(id: String, hex: String)
    var id: String {
        switch self {
        case .string(let id , _),
                .integer(let id , _),
                .double(let id , _),
                .boolean(let id , _),
                .data(let id , _),
                .stringArray(let id , _),
                .integerArray(let id , _),
                .doubleArray(let id , _),
                .booleanArray(let id , _),
                .dataArray(let id , _),
                .font(let id, _, _),
                .frame(let id, _, _),
                .backgroundColor(let id, _):
            return id
        }
    }
    var string: String? {
        switch self {
        case .string(_, let value):
            return value
        default:
            return nil
        }
    }
    
    var integer: Int? {
        switch self {
        case .integer(_, let value):
            return value
        default:
            return nil
        }
    }
    
    var double: Double? {
        switch self {
        case .double(_, let value):
            return value
        default:
            return nil
        }
    }
    
    var boolean: Bool? {
        switch self {
        case .boolean(_, let value):
            return value
        default:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .data(_, let value):
            return value
        default:
            return nil
        }
    }
    
    var font: (String, Int) {
        switch self {
        case let .font(_, name, size):
            return (name, size)
        default:
            return ("", Int.min)
        }
    }
    
    var frame: (Float, Float) {
        switch self {
        case let .frame(_, width, height):
            return (width, height)
        default:
            return (.nan, .nan)
        }
    }
    
    var color: String {
        switch self {
        case .backgroundColor(_, let hex):
            return hex
        default:
            return ""
        }
    }
    
    var stringArray: [String] {
        switch self {
        case .stringArray(_, let value):
            return value
        default:
            return []
        }
    }
    
    var integerArray: [Int] {
        switch self {
        case .integerArray(_, let value):
            return value
        default:
            return []
        }
    }
    
    var doubleArray: [Double] {
        switch self {
        case .doubleArray(_, let value):
            return value
        default:
            return []
        }
    }
    
    var booleanArray: [Bool] {
        switch self {
        case .booleanArray(_, let value):
            return value
        default:
            return []
        }
    }
    
    var dataArray: [Data] {
        switch self {
        case .dataArray(_, let value):
            return value
        default:
            return []
        }
    }
}


struct InjectedState: Codable {
    var state: [InjectedValue]
}

func findBooleanValue(id: String, state: InjectedState) -> Bool {
    state.state.first(where: {$0.id == id})?.boolean ?? false
}

func findStringValue(id: String, state: InjectedState) -> String {
    state.state.first(where: {$0.id == id})?.string ?? ""
}

func findIntegerValue(id: String, state: InjectedState) -> Int {
   state.state.first(where: {$0.id == id})?.integer ?? Int.min
}

func findDoubleValue(id: String, state: InjectedState) -> Double {
    state.state.first(where: {$0.id == id})?.double ?? 0
}

func findDataValue(id: String, state: InjectedState) -> Data {
    state.state.first(where: {$0.id == id})?.data ?? Data()
}

func findBooleanArrayValue(id: String, state: InjectedState) -> [Bool] {
    state.state.first(where: {$0.id == id})?.booleanArray ?? []
}

func findStringArrayValue(id: String, state: InjectedState) -> [String] {
    state.state.first(where: {$0.id == id})?.stringArray ?? []
}

func findIntegerArrayValue(id: String, state: InjectedState) -> [Int] {
   state.state.first(where: {$0.id == id})?.integerArray ?? []
}

func findDoubleArrayValue(id: String, state: InjectedState) -> [Double] {
    state.state.first(where: {$0.id == id})?.doubleArray ?? []
}

func findDataArrayValue(id: String, state: InjectedState) -> [Data] {
    state.state.first(where: {$0.id == id})?.dataArray ?? []
}
func findFontValue(id: String, state: InjectedState) -> Font {
    if let (name, size) = state.state.first(where: {$0.id == id})?.font {
        return Font(UIFont(name: name, size: CGFloat(size)) ?? UIFont.systemFont(ofSize: 12))
    }
    return Font(UIFont.systemFont(ofSize: 12))
}

func findFrameValue(id: String, state: InjectedState) -> (width: CGFloat, height: CGFloat) {
    if let (width, height) = state.state.first(where: {$0.id == id})?.frame {
      return (CGFloat(width), CGFloat(height))
    }
    return (.nan, .nan)
}

func findColorValue(id: String, state: InjectedState) -> Color {
    Color(uiColor: UIColor.hex(state.state.first(where: {$0.id == id})?.color ?? "#FFFFFF"))
}
