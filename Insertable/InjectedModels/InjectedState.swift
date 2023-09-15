import Foundation


struct InjectedState: Codable, Equatable, Identifiable, Hashable {
    var id: String
    var state: [InjectedValue]
    init(id: String, state: [InjectedValue]) {
        self.id = id
        self.state = state.map { value in
            value.updateStateId(stateId: id)
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
