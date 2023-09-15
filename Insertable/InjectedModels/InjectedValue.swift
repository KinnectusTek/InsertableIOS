//
//  InjectedValue.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//
import Foundation
import SwiftUI


//enum Key: Codable, Equatable, ExpressibleByStringLiteral {
//    typealias StringLiteralType = String
//
//    case key(id: String)
//
//    init(stringLiteral value: String) {
//        self = .key(id: value)
//    }
//}


protocol Key: ExpressibleByStringLiteral, Equatable, Codable {
    
}
enum ValueKey: Key {
    case key(id: String)
    init(stringLiteral value: StringLiteralType) {
        self = .key(id: value)
    }
}

enum InjectedValue: Codable, Equatable {
    static func == (lhs: InjectedValue, rhs: InjectedValue) -> Bool {
        lhs.stateId == rhs.stateId && lhs.id == rhs.id
    }
    
    
    case string(stateId: String, id: String, value: String)
    case integer(stateId: String, id:String, value: Int)
    case double(stateId: String, id: String, value: Double)
    case boolean(stateId: String, id: String, value: Bool)
    case data(stateId: String, id: String, value: Data)
    case state(stateId: String, id: String, value: InjectedState)
    case stringArray(stateId: String, id: String, value: [String])
    case integerArray(stateId: String, id: String, value: [Int])
    case doubleArray(stateId: String, id: String, value: [Double])
    case booleanArray(stateId: String, id: String, value: [Bool])
    case dataArray(stateId: String, id: String, value: [Data])
    case stateArray(stateId: String, id: String, value: [InjectedState])

    var stateId: String {
        switch self {
        case .string(let stateId, _, _),
                .integer(let stateId, _, _),
                .double(let stateId, _, _),
                .boolean(let stateId, _, _),
                .data(let stateId, _, _),
                .stringArray(let stateId, _, _),
                .integerArray(let stateId, _, _),
                .doubleArray(let stateId, _, _),
                .booleanArray(let stateId, _, _),
                .dataArray(let stateId, _, _),
                .state(let stateId, _, _),
                .stateArray(let stateId, _, _):
            return "\(stateId)"
        }
    }
    
    var id: String {
        switch self {
        case .string(_, let id , _),
                .integer(_, let id , _),
                .double(_, let id , _),
                .boolean(_, let id , _),
                .data(_, let id , _),
                .stringArray(_, let id , _),
                .integerArray(_, let id , _),
                .doubleArray(_, let id , _),
                .booleanArray(_, let id , _),
                .dataArray(_, let id , _),
                .state(_, let id, _),
                .stateArray(_, let id, _):
            return "\(id)"
        }
    }
    var string: String? {
        switch self {
        case .string(_, _, let value):
            return value
        default:
            return nil
        }
    }
    
    var integer: Int? {
        switch self {
        case .integer(_, _, let value):
            return value
        default:
            return nil
        }
    }
    
    var double: Double? {
        switch self {
        case .double(_, _, let value):
            return value
        default:
            return nil
        }
    }
    
    var boolean: Bool? {
        switch self {
        case .boolean(_, _, let value):
            return value
        default:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .data(_, _, let value):
            return value
        default:
            return nil
        }
    }

    var state: InjectedState {
        switch self {
        case .state(_, _, let value):
            return value
        default:
            return InjectedState(id: "", state: [])
        }
    }
    
    var stringArray: [String] {
        switch self {
        case .stringArray(_, _, let value):
            return value
        default:
            return []
        }
    }
    
    var integerArray: [Int] {
        switch self {
        case .integerArray(_, _, let value):
            return value
        default:
            return []
        }
    }
    
    var doubleArray: [Double] {
        switch self {
        case .doubleArray(_, _, let value):
            return value
        default:
            return []
        }
    }
    
    var booleanArray: [Bool] {
        switch self {
        case .booleanArray(_, _, let value):
            return value
        default:
            return []
        }
    }
    
    var dataArray: [Data] {
        switch self {
        case .dataArray(_, _, let value):
            return value
        default:
            return []
        }
    }

     var stateArray: [InjectedState] {
        switch self {
        case .state(_, _, let value):
            return [value]
        default:
            return []
        }
    }
    
    var array: [InjectedValue] {
        switch self {
        case let .stringArray(stateId, id, strings):
            return strings.map {
                InjectedValue.string(
                    stateId: "\(stateId).\(UUID().uuidString)",
                    id: "\(id).\(UUID().uuidString)",
                    value: $0)}
        case let .booleanArray(stateId, id, booleans):
            return booleans.map {
                InjectedValue.boolean(
                    stateId:  "\(stateId).\(UUID().uuidString)",
                    id:  "\(id).\(UUID().uuidString)",
                    value: $0)}
        case let .doubleArray(stateId, id, doubles):
            return doubles.map {
                InjectedValue.double(
                    stateId:  "\(stateId).\(UUID().uuidString)",
                    id:  "\(id).\(UUID().uuidString)",
                    value: $0)}
        case let .integerArray(stateId, id, integers):
            return integers.map {
                InjectedValue.integer(
                    stateId:  "\(stateId).\(UUID().uuidString)",
                    id:  "\(id).\(UUID().uuidString)",
                    value: $0)}
        case let .dataArray(stateId, id, data):
            return data.map {
                InjectedValue.data(
                    stateId:  "\(stateId).\(UUID().uuidString)",
                    id:  "\(id).\(UUID().uuidString)",
                    value: $0)}
        case let .stateArray(stateId, id, states):
            return states.map {
                InjectedValue.state(
                    stateId:  "\(stateId).\(UUID().uuidString)",
                    id:  "\(id).\(UUID().uuidString)",
                    value: $0)}
        default:
            return []
        }
    }

    func updateStateId(stateId: String) -> InjectedValue {
        switch self {
        case let .string(_, id, value):
            return .string(stateId: stateId, id: id, value: value)
        case let .integer(_, id, value):
            return .integer(stateId: stateId, id: id, value: value)
        case let .double(_, id, value):
            return .double(stateId: stateId, id: id, value: value)
        case let .boolean(_, id, value):
            return .boolean(stateId: stateId, id: id, value: value)
        case let .data(_, id, value):
            return .data(stateId: stateId, id:  id, value: value)
        case let .state(_, id, value):
            return .state(stateId: stateId, id: id, value: value)
        case let .stringArray(_, id, value):
            return .stringArray(stateId: stateId, id: id, value: value)
        case let .integerArray(_, id, value):
            return .integerArray(stateId: stateId, id: id, value: value)
        case let .doubleArray(_, id, value):
            return .doubleArray(stateId: stateId, id: id, value: value)
        case let .booleanArray(_, id, value):
            return .booleanArray(stateId: stateId, id: id, value: value)
        case let .dataArray(_, id, value):
            return .dataArray(stateId: stateId, id: id, value: value)
        case let .stateArray(_, id, value):
            return .stateArray(stateId: stateId, id: id, value: value)
        }
    }
}



////
////  InjectedValue.swift
////  Insertable
////
////  Created by Blake Osonduagwueki on 8/19/23.
////
//import Foundation
//import SwiftUI
//
//
////enum Key: Codable, Equatable, ExpressibleByStringLiteral {
////    typealias StringLiteralType = String
////
////    case key(id: String)
////
////    init(stringLiteral value: String) {
////        self = .key(id: value)
////    }
////}
//
//
//protocol Key: ExpressibleByStringLiteral, Equatable, Codable {
//
//}
//enum ValueKey: Key {
//    case key(id: String)
//    init(stringLiteral value: StringLiteralType) {
//        self = .key(id: value)
//    }
//}
//enum InjectedValue: Codable, Equatable {
//    static func == (lhs: InjectedValue, rhs: InjectedValue) -> Bool {
//        lhs.stateId == rhs.stateId && lhs.id == rhs.id
//    }
//
//
//    case string(stateId: any Key, id: any Key, value: String)
//    case integer(stateId: any Key, id:any Key, value: Int)
//    case double(stateId: any Key, id: any Key, value: Double)
//    case boolean(stateId: any Key, id: any Key, value: Bool)
//    case data(stateId: any Key, id: any Key, value: Data)
//    case state(stateId: any Key, id: any Key, value: InjectedState)
//    case stringArray(stateId: any Key, id: any Key, value: [String])
//    case integerArray(stateId: any Key, id: any Key, value: [Int])
//    case doubleArray(stateId: any Key, id: any Key, value: [Double])
//    case booleanArray(stateId: any Key, id: any Key, value: [Bool])
//    case dataArray(stateId: any Key, id: any Key, value: [Data])
//    case stateArray(stateId: any Key, id: any Key, value: [InjectedState])
//
//    init(from decoder: Decoder) throws {
//        self = .string(stateId: ValueKey.key(id: ""), id: ValueKey.key(id: ""), value: "")
//    }
//    func encode(to encoder: Encoder) throws {
//        do {
//
//        } catch {
//
//        }
//    }
//    var stateId: String {
//        switch self {
//        case .string(let stateId, _, _),
//                .integer(let stateId, _, _),
//                .double(let stateId, _, _),
//                .boolean(let stateId, _, _),
//                .data(let stateId, _, _),
//                .stringArray(let stateId, _, _),
//                .integerArray(let stateId, _, _),
//                .doubleArray(let stateId, _, _),
//                .booleanArray(let stateId, _, _),
//                .dataArray(let stateId, _, _),
//                .state(let stateId, _, _),
//                .stateArray(let stateId, _, _):
//            return "\(stateId)"
//        }
//    }
//
//    var id: String {
//        switch self {
//        case .string(_, let id , _),
//                .integer(_, let id , _),
//                .double(_, let id , _),
//                .boolean(_, let id , _),
//                .data(_, let id , _),
//                .stringArray(_, let id , _),
//                .integerArray(_, let id , _),
//                .doubleArray(_, let id , _),
//                .booleanArray(_, let id , _),
//                .dataArray(_, let id , _),
//                .state(_, let id, _),
//                .stateArray(_, let id, _):
//            return "\(id)"
//        }
//    }
//    var string: String? {
//        switch self {
//        case .string(_, _, let value):
//            return value
//        default:
//            return nil
//        }
//    }
//
//    var integer: Int? {
//        switch self {
//        case .integer(_, _, let value):
//            return value
//        default:
//            return nil
//        }
//    }
//
//    var double: Double? {
//        switch self {
//        case .double(_, _, let value):
//            return value
//        default:
//            return nil
//        }
//    }
//
//    var boolean: Bool? {
//        switch self {
//        case .boolean(_, _, let value):
//            return value
//        default:
//            return nil
//        }
//    }
//
//    var data: Data? {
//        switch self {
//        case .data(_, _, let value):
//            return value
//        default:
//            return nil
//        }
//    }
//
//    var state: InjectedState {
//        switch self {
//        case .state(_, _, let value):
//            return value
//        default:
//            return InjectedState(id: "", state: [])
//        }
//    }
//
//    var stringArray: [String] {
//        switch self {
//        case .stringArray(_, _, let value):
//            return value
//        default:
//            return []
//        }
//    }
//
//    var integerArray: [Int] {
//        switch self {
//        case .integerArray(_, _, let value):
//            return value
//        default:
//            return []
//        }
//    }
//
//    var doubleArray: [Double] {
//        switch self {
//        case .doubleArray(_, _, let value):
//            return value
//        default:
//            return []
//        }
//    }
//
//    var booleanArray: [Bool] {
//        switch self {
//        case .booleanArray(_, _, let value):
//            return value
//        default:
//            return []
//        }
//    }
//
//    var dataArray: [Data] {
//        switch self {
//        case .dataArray(_, _, let value):
//            return value
//        default:
//            return []
//        }
//    }
//
//     var stateArray: [InjectedState] {
//        switch self {
//        case .state(_, _, let value):
//            return [value]
//        default:
//            return []
//        }
//    }
//
//    var array: [InjectedValue] {
//        switch self {
//        case let .stringArray(stateId, id, strings):
//            return strings.map {
//                InjectedValue.string(
//                    stateId: ValueKey.key(id:"\(stateId).\(UUID().uuidString)"),
//                    id: ValueKey.key(id: "\(id).\(UUID().uuidString)"),
//                    value: $0)}
//        case let .booleanArray(stateId, id, booleans):
//            return booleans.map {
//                InjectedValue.boolean(
//                    stateId: ValueKey.key(id: "\(stateId).\(UUID().uuidString)"),
//                    id: ValueKey.key(id: "\(id).\(UUID().uuidString)"),
//                    value: $0)}
//        case let .doubleArray(stateId, id, doubles):
//            return doubles.map {
//                InjectedValue.double(
//                    stateId: ValueKey.key(id: "\(stateId).\(UUID().uuidString)"),
//                    id: ValueKey.key(id: "\(id).\(UUID().uuidString)"),
//                    value: $0)}
//        case let .integerArray(stateId, id, integers):
//            return integers.map {
//                InjectedValue.integer(
//                    stateId: ValueKey.key(id: "\(stateId).\(UUID().uuidString)"),
//                    id: ValueKey.key(id: "\(id).\(UUID().uuidString)"),
//                    value: $0)}
//        case let .dataArray(stateId, id, data):
//            return data.map {
//                InjectedValue.data(
//                    stateId: ValueKey.key(id: "\(stateId).\(UUID().uuidString)"),
//                    id: ValueKey.key(id: "\(id).\(UUID().uuidString)"),
//                    value: $0)}
//        case let .stateArray(stateId, id, states):
//            return states.map {
//                InjectedValue.state(
//                    stateId: ValueKey.key(id: "\(stateId).\(UUID().uuidString)"),
//                    id: ValueKey.key(id: "\(id).\(UUID().uuidString)"),
//                    value: $0)}
//        default:
//            return []
//        }
//    }
//
//    func updateStateId(stateId: any Key) -> InjectedValue {
//        switch self {
//        case let .string(_, id, value):
//            return .string(stateId: stateId, id: id, value: value)
//        case let .integer(_, id, value):
//            return .integer(stateId: stateId, id: id, value: value)
//        case let .double(_, id, value):
//            return .double(stateId: stateId, id: id, value: value)
//        case let .boolean(_, id, value):
//            return .boolean(stateId: stateId, id: id, value: value)
//        case let .data(_, id, value):
//            return .data(stateId: stateId, id:  id, value: value)
//        case let .state(_, id, value):
//            return .state(stateId: stateId, id: id, value: value)
//        case let .stringArray(_, id, value):
//            return .stringArray(stateId: stateId, id: id, value: value)
//        case let .integerArray(_, id, value):
//            return .integerArray(stateId: stateId, id: id, value: value)
//        case let .doubleArray(_, id, value):
//            return .doubleArray(stateId: stateId, id: id, value: value)
//        case let .booleanArray(_, id, value):
//            return .booleanArray(stateId: stateId, id: id, value: value)
//        case let .dataArray(_, id, value):
//            return .dataArray(stateId: stateId, id: id, value: value)
//        case let .stateArray(_, id, value):
//            return .stateArray(stateId: stateId, id: id, value: value)
//        }
//    }
//}
