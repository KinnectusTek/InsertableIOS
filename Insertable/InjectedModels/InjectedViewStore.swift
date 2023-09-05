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
    
    case vStack(store: VStackViewStore)
    case hStack(store: HStackViewStore)
    case zStack(store: ZStackViewStore)
    case list(store: ListViewStore)
    case forEach(store: ForEachViewStore)
    case text(store: TextViewStore)
    case field(store: FieldViewStore)
    case button(store: ButtonViewStore)
    case namedImage(store: ImageViewStore)
    case systemImage(store: ImageViewStore)
    case color(store: ColorViewStore)
    case spacer(store: SpacerViewStore)
    case `if`(store: IfStore)
    // case `ifLet`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore)
    // case `switch`(  conditionKey: String,
    //                 modifiers: [InjectedModifier],
    //                 caseContent1: InjectedViewStore,
    //                 caseContent2: InjectedViewStore,
    //                 caseContent3: InjectedViewStore,
    //                 caseContent4: InjectedViewStore,
    //                 caseContent5: InjectedViewStore,
    //                 caseContent6: InjectedViewStore,
    //                 caseContent7: InjectedViewStore,
    //                 caseContent8: InjectedViewStore,
    //                 caseContent9: InjectedViewStore,
    //                 caseContent10: InjectedViewStore)
    // case `ifElse`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseContent: InjectedViewStore)
    // case `ifLetElse`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseContent: InjectedViewStore)
    // case `ifElseIfElese`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseIfContent: InjectedViewStore, elseContent: InjectedViewStore)
    case viewStoreReference(id: String)
    case empty(id: String = "")
    var id: String {
        switch self {
        case .viewStoreReference(let id), .empty(let id):
            return id
        case .vStack(let store):
            return store.id
        case .hStack(let store):
            return store.id
        case .zStack(let store):
            return store.id
        case .list(let store):
            return store.id
        case .forEach(let store):
            return store.id
        case .text(let store):
            return store.id
        case .field(let store):
            return store.id
        case .button(let store):
            return store.id
        case .namedImage(let store):
            return store.id
        case .systemImage(let store):
            return store.id
        case .color(let store):
            return store.id
        case .spacer(let store):
            return store.id
        case .if(let store):
            return store.id
        }
    }
}
