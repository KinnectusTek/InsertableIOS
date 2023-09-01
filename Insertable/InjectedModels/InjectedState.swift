import Foundation


struct InjectedState: Codable, Equatable {
    var id: String
    var state: [InjectedValue]
    init(id: String, state: [InjectedValue]) {
        self.id = id
        self.state = state.map { value in
            value.updateStateId(id: id)
        }
    }
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

func findOptionalDoubleValue(id: String, state: InjectedState) -> Double? {
    state.state.first(where: {$0.id == id})?.double
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

func findStateArrayValue(id: String, state: InjectedState) -> [InjectedState] {
    state.state.first(where: {$0.id == id})?.stateArray ?? []
}
