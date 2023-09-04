//
//  StateFunctions.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/1/23.
//

import Foundation

func findBooleanValue(id: String, state: InjectedState) -> Bool? {
    state.state.first(where: {$0.id == id})?.boolean
}

func findStringValue(id: String, state: InjectedState) -> String? {
    state.state.first(where: {$0.id == id})?.string
}

func findIntegerValue(id: String, state: InjectedState) -> Int? {
   state.state.first(where: {$0.id == id})?.integer
}

func findDoubleValue(id: String, state: InjectedState) -> Double? {
    state.state.first(where: {$0.id == id})?.double
}

func findOptionalDoubleValue(id: String, state: InjectedState) -> Double? {
    state.state.first(where: {$0.id == id})?.double
}

func findDataValue(id: String, state: InjectedState) -> Data? {
    state.state.first(where: {$0.id == id})?.data
}

func findBooleanArrayValue(id: String, state: InjectedState) -> [Bool]? {
    state.state.first(where: {$0.id == id})?.booleanArray
}

func findStringArrayValue(id: String, state: InjectedState) -> [String]? {
    state.state.first(where: {$0.id == id})?.stringArray
}

func findIntegerArrayValue(id: String, state: InjectedState) -> [Int]? {
   state.state.first(where: {$0.id == id})?.integerArray
}

func findDoubleArrayValue(id: String, state: InjectedState) -> [Double]? {
    state.state.first(where: {$0.id == id})?.doubleArray
}

func findDataArrayValue(id: String, state: InjectedState) -> [Data]? {
    state.state.first(where: {$0.id == id})?.dataArray
}

func findStateArrayValue(id: String, state: InjectedState) -> [InjectedState]? {
    state.state.first(where: {$0.id == id})?.stateArray
}

func updateState(state: InjectedState, newValue: InjectedValue) -> InjectedState {
    state |> prop(\.state)({
        $0.map { value in
            if value.id == newValue.id {
                return newValue
            } else {
                return value
            }
        }
    })
}
