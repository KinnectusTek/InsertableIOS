//
//  InjectedValue.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//
import Foundation
import SwiftUI

enum InjectedValue: Codable, Equatable {

    case string(stateId: String, id: String, value: String)
    case integer(stateId: String, id: String, value: Int)
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
                .state(_, let id, _):
            return id
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

    func updateStateId(id: String) -> InjectedValue {
        switch self {
        case .string(_, _, let value):
            return .string(stateId: id, id: value, value: value)
        case .integer(_, _, let value):
            return .integer(stateId: id, id: value, value: value)
        case .double(_, _, let value):
            return .double(stateId: id, id: value, value: value)
        case .boolean(_, _, let value):
            return .boolean(stateId: id, id: value, value: value)
        case .data(_, _, let value):
            return .data(stateId: id, id: value, value: value)
        case .state(_, _, let value):
            return .state(stateId: id, id: value, value: value)
        case .stringArray(_, _, let value):
            return .stringArray(stateId: id, id: value, value: value)
        case .integerArray(_, _, let value):
            return .integerArray(stateId: id, id: value, value: value)
        case .doubleArray(_, _, let value):
            return .doubleArray(stateId: id, id: value, value: value)
        case .booleanArray(_, _, let value):
            return .booleanArray(stateId: id, id: value, value: value)
        case .dataArray(_, _, let value):
            return .dataArray(stateId: id, id: value, value: value)
        case .stateArray(_, _, let value):
            return .stateArray(stateId: id, id: value, value: value)
        }
    }
}