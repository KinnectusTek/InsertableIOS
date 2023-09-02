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
            return stateId
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
    
    var array: [InjectedValue] {
        switch self {
        case let .stringArray(stateId, id, strings):
            return strings.map { InjectedValue.string(stateId: "\(stateId).\(UUID().uuidString)", id: "\(id).\(UUID().uuidString)", value: $0)}
        case let .booleanArray(stateId, id, booleans):
            return booleans.map { InjectedValue.boolean(stateId: "\(stateId).\(UUID().uuidString)", id: "\(id).\(UUID().uuidString)", value: $0)}
        case let .doubleArray(stateId, id, doubles):
            return doubles.map { InjectedValue.double(stateId: "\(stateId).\(UUID().uuidString)", id: "\(id).\(UUID().uuidString)", value: $0)}
        case let .integerArray(stateId, id, integers):
            return integers.map { InjectedValue.integer(stateId: "\(stateId).\(UUID().uuidString)", id: "\(id).\(UUID().uuidString)", value: $0)}
        case let .dataArray(stateId, id, data):
            return data.map { InjectedValue.data(stateId: "\(stateId).\(UUID().uuidString)", id: "\(id).\(UUID().uuidString)", value: $0)}
        case let .stateArray(stateId, id, states):
            return states.map { InjectedValue.state(stateId: "\(stateId).\(UUID().uuidString)", id: "\(id).\(UUID().uuidString)", value: $0)}   
        default:
            return []
        }
    }

    func updateStateId(id: String) -> InjectedValue {
        switch self {
        case .string(_, _, let value):
            return .string(stateId: self.stateId, id: self.id, value: value)
        case .integer(_, _, let value):
            return .integer(stateId: self.stateId, id: self.id, value: value)
        case .double(_, _, let value):
            return .double(stateId: self.stateId, id: self.id, value: value)
        case .boolean(_, _, let value):
            return .boolean(stateId: self.stateId, id: self.id, value: value)
        case .data(_, _, let value):
            return .data(stateId: self.stateId, id: self.id, value: value)
        case .state(_, _, let value):
            return .state(stateId: self.stateId, id: self.id, value: value)
        case .stringArray(_, _, let value):
            return .stringArray(stateId: self.stateId, id: self.id, value: value)
        case .integerArray(_, _, let value):
            return .integerArray(stateId: self.stateId, id: self.id, value: value)
        case .doubleArray(_, _, let value):
            return .doubleArray(stateId: self.stateId, id: self.id, value: value)
        case .booleanArray(_, _, let value):
            return .booleanArray(stateId: self.stateId, id: self.id, value: value)
        case .dataArray(_, _, let value):
            return .dataArray(stateId: self.stateId, id: self.id, value: value)
        case .stateArray(_, _, let value):
            return .stateArray(stateId: self.stateId, id: self.id, value: value)
        }
    }
}
