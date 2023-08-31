//
//  InjectedViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine

indirect enum InjectedViewStore: Codable, Hashable {
    static func == (lhs: InjectedViewStore, rhs: InjectedViewStore) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    case viewStoreReference(id: String)
    case vStack(id: String = "",
                modifiers: [InjectedModifier] = [],
                alignmentKey: String = "",
                spacingKey: String = "",
                content1: InjectedViewStore,
                content2: InjectedViewStore? = nil,
                content3: InjectedViewStore? = nil,
                content4: InjectedViewStore? = nil,
                content5: InjectedViewStore? = nil,
                content6: InjectedViewStore? = nil,
                content7: InjectedViewStore? = nil,
                content8: InjectedViewStore? = nil,
                content9: InjectedViewStore? = nil,
                content10: InjectedViewStore? = nil)
    case hStack(id: String = "",
                modifiers: [InjectedModifier] = [],
                alignmentKey: String = "",
                spacingKey: String = "",
                content1: InjectedViewStore,
                content2: InjectedViewStore? = nil,
                content3: InjectedViewStore? = nil,
                content4: InjectedViewStore? = nil,
                content5: InjectedViewStore? = nil,
                content6: InjectedViewStore? = nil,
                content7: InjectedViewStore? = nil,
                content8: InjectedViewStore? = nil,
                content9: InjectedViewStore? = nil,
                content10: InjectedViewStore? = nil)
    case text(id: String = "",
              modifiers: [InjectedModifier] = [],
              textKey: String)
    case field(id: String = "",
               modifiers: [InjectedModifier] = [],
               textKey: String,
               content: InjectedViewStore)
    case button(id: String = "",
                modifiers: [InjectedModifier] = [],
                operation1: InjectedOperation? = .noOperation,
                operation2: InjectedOperation? = .noOperation,
                operation3: InjectedOperation? = .noOperation,
                operation4: InjectedOperation? = .noOperation,
                operation5: InjectedOperation? = .noOperation,
                operation6: InjectedOperation? = .noOperation,
                operation7: InjectedOperation? = .noOperation,
                operation8: InjectedOperation? = .noOperation,
                operation9: InjectedOperation? = .noOperation,
                operation10: InjectedOperation? = .noOperation,
                content: InjectedViewStore)
    case namedImage(name: String = "", modifiers: [InjectedModifier] = [])
    case systemImage(id: String = "", modifiers: [InjectedModifier] = [])
    case color(id: String = "", modifiers: [InjectedModifier] = [], colorKey: String)
    case spacer(id: String = "",
                modifiers: [InjectedModifier] = [])
    case empty(id: String = "")
    var id: String {
        switch self {
        case .viewStoreReference(let id),
                .vStack(let id,_, _, _, _, _, _, _, _, _, _, _, _, _),
                .hStack(let id,_, _, _, _, _, _, _, _, _, _, _, _, _),
                .text(let id, _, _),
                .field(let id, _, _, _),
                .button(let id, _, _, _, _, _, _, _, _, _, _, _, _),
                .namedImage(let id, _),
                .systemImage(let id, _),
                .spacer(let id, _),
                .empty(let id):
            return id
        }
    }
    var isViewStoreReference: Bool {
        if case .viewStoreReference = self {
            return true
        }
        return false
    }
    var modifiers: [InjectedModifier] {
        switch self {
        case .vStack(_, let modifiers, _, _, _, _, _, _, _,_,_,_,_,_),
                .hStack(_, let modifiers, _, _,_, _, _, _,_,_,_,_,_,_),
                .text(_, let modifiers, _),
                .field(_, let modifiers, _, _),
                .button(_, let modifiers, _, _,_,_,_,_,_,_,_,_,_),
                .namedImage(_, let modifiers),
                .systemImage(_, let modifiers),
                .color(_, let modifiers),
                .spacer(_, let modifiers):
            return modifiers
        default:
            return []
        }
    }
    var content: (InjectedViewStore,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?,
                  InjectedViewStore?
                 
    ) {
        switch self {
        case .vStack(_, _, _, _, let content1, let content2, let content3, let content4,let content5,let content6,let content7,let content8,let content9,let content10),
                .hStack(_, _, _, _, let content1, let content2, let content3, let content4,let content5,let content6,let content7,let content8,let content9,let content10):
            return (content1, content2, content3, content4, content5,content6,content7,content8,content9,content10)
        case .field(_, _, _, let content),
                .button(_, _, _,_,_,_,_,_,_,_,_,_, let content):
            return (content, nil, nil, nil, nil, nil, nil, nil, nil, nil)
        case .empty, .spacer, .viewStoreReference, .text, .systemImage, .namedImage, .color:
            return (.empty(id: ""), nil, nil, nil, nil, nil, nil, nil, nil, nil)
        }
    }
    
    var text: String {
        switch self {
        case .text(_, _, let text), .field(_, _, let text, _):
            return text
        default:
            return ""
        }
    }
    
    var operations: (InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation,
                 InjectedOperation) {
        switch self {
        case let .button(_, _, operation1, operation2,operation3,operation4,operation5,operation6,operation7,operation8,operation9,operation10, _):
            return (operation1 ?? .noOperation, operation2  ?? .noOperation, operation3  ?? .noOperation, operation4  ?? .noOperation,operation5  ?? .noOperation,operation6  ?? .noOperation,operation7 ?? .noOperation ,operation8 ?? .noOperation,operation9  ?? .noOperation,operation10  ?? .noOperation)
        default:
            return (.noOperation, .noOperation, .noOperation, .noOperation, .noOperation, .noOperation, .noOperation, .noOperation, .noOperation, .noOperation)
        }
    }
    var alignmentKey: String {
        switch self {
        case .vStack(_, _, let alignmentKey, _, _, _, _, _, _, _, _, _, _, _),
            .hStack(_, _, let alignmentKey, _, _, _, _, _, _, _, _, _, _, _):
            return alignmentKey
        default:
            return ""
        }
    }
    var spacingKey: String {
        switch self {
        case .vStack(_, _, _, let spacingKey, _, _, _, _, _, _, _, _, _, _),
            .hStack(_, _, _, let spacingKey, _, _, _, _, _, _, _, _, _, _):
            return spacingKey
        default:
            return ""
        }
    }
    var colorKey: String {
        switch self {
        case .color(_, _, let colorKey):
            return id
        default:
            return ""
        }
    }
}


extension InjectedViewStore {
    
    static func updateState(state: InjectedState, newValue: InjectedValue) -> InjectedState {
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
}
