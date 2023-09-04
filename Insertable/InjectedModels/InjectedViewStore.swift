//
//  InjectedViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine


struct VStackViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var alignmentKey: String = ""
    var spacingKey: String = ""
    var content1: InjectedViewStore = .empty()
    var content2: InjectedViewStore? = nil
    var content3: InjectedViewStore? = nil
    var content4: InjectedViewStore? = nil
    var content5: InjectedViewStore? = nil
    var content6: InjectedViewStore? = nil
    var content7: InjectedViewStore? = nil
    var content8: InjectedViewStore? = nil
    var content9: InjectedViewStore? = nil
    var content10: InjectedViewStore? = nil
}

struct HStackViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var alignmentKey: String = ""
    var spacingKey: String = ""
    var content1: InjectedViewStore = .empty()
    var content2: InjectedViewStore? = nil
    var content3: InjectedViewStore? = nil
    var content4: InjectedViewStore? = nil
    var content5: InjectedViewStore? = nil
    var content6: InjectedViewStore? = nil
    var content7: InjectedViewStore? = nil
    var content8: InjectedViewStore? = nil
    var content9: InjectedViewStore? = nil
    var content10: InjectedViewStore? = nil
}
struct ZStackViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var alignmentKey: String = ""
    var spacingKey: String = ""
    var content1: InjectedViewStore = .empty()
    var content2: InjectedViewStore? = nil
    var content3: InjectedViewStore? = nil
    var content4: InjectedViewStore? = nil
    var content5: InjectedViewStore? = nil
    var content6: InjectedViewStore? = nil
    var content7: InjectedViewStore? = nil
    var content8: InjectedViewStore? = nil
    var content9: InjectedViewStore? = nil
    var content10: InjectedViewStore? = nil
}

struct ListViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var listKey: String = ""
    var content: InjectedViewStore = .empty()
}

struct ForEachViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var forEachKey: String = ""
    var content: InjectedViewStore = .empty()
}

struct TextViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var textKey: String = ""
}

struct FieldViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var textKey: String = ""
    var content: InjectedViewStore = .empty()
}

struct ButtonViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var operation1: InjectedOperation? = nil
    var operation2: InjectedOperation? = nil
    var operation3: InjectedOperation? = nil
    var operation4: InjectedOperation? = nil
    var operation5: InjectedOperation? = nil
    var operation6: InjectedOperation? = nil
    var operation7: InjectedOperation? = nil
    var operation8: InjectedOperation? = nil
    var operation9: InjectedOperation? = nil
    var operation10: InjectedOperation? = nil
    var content: InjectedViewStore = .empty()
}

struct ImageViewStore: Codable {
    var id: String = ""
    var name: String? = nil
    var systemName: String? = nil
    var modifiers: [InjectedModifier] = []
}

struct ColorViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
    var colorKey: String = ""
}

struct SpacerViewStore: Codable {
    var id: String = ""
    var modifiers: [InjectedModifier] = []
}

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
    // case `if`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore)
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
        }
    }
}

func vStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content1: InjectedViewStore = .empty(),
    content2: InjectedViewStore? = nil,
    content3: InjectedViewStore? = nil,
    content4: InjectedViewStore? = nil,
    content5: InjectedViewStore? = nil,
    content6: InjectedViewStore? = nil,
    content7: InjectedViewStore? = nil,
    content8: InjectedViewStore? = nil,
    content9: InjectedViewStore? = nil,
    content10: InjectedViewStore? = nil) -> InjectedViewStore {
        .vStack(store: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
    
}
func hStackStore(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content1: InjectedViewStore = .empty(),
    content2: InjectedViewStore? = nil,
    content3: InjectedViewStore? = nil,
    content4: InjectedViewStore? = nil,
    content5: InjectedViewStore? = nil,
    content6: InjectedViewStore? = nil,
    content7: InjectedViewStore? = nil,
    content8: InjectedViewStore? = nil,
    content9: InjectedViewStore? = nil,
    content10: InjectedViewStore? = nil) -> InjectedViewStore {
        .hStack(store: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
    
}
func zStackStore(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content1: InjectedViewStore = .empty(),
    content2: InjectedViewStore? = nil,
    content3: InjectedViewStore? = nil,
    content4: InjectedViewStore? = nil,
    content5: InjectedViewStore? = nil,
    content6: InjectedViewStore? = nil,
    content7: InjectedViewStore? = nil,
    content8: InjectedViewStore? = nil,
    content9: InjectedViewStore? = nil,
    content10: InjectedViewStore? = nil) -> InjectedViewStore {
        .zStack(store: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
    
}
func list(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    listKey: String = "",
    content: InjectedViewStore = .empty()) -> InjectedViewStore {
        .list(store: .init(id: id, modifiers: modifiers, listKey: listKey, content: content))
    
}
func forEach(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    forEachKey: String = "",
    content: InjectedViewStore = .empty()) -> InjectedViewStore {
        .forEach(store: .init(id: id, modifiers: modifiers, forEachKey: forEachKey, content: content))
    
}
func text(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    textKey: String = "") -> InjectedViewStore {
        .text(store: .init(id: id, modifiers: modifiers, textKey: textKey))
    
}
func field(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    textKey: String = "",
    content: InjectedViewStore = .empty()) -> InjectedViewStore {
        .field(store: .init(id: id, modifiers: modifiers, textKey: textKey, content: content))
    
}
func button(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    operation1: InjectedOperation? = nil,
    operation2: InjectedOperation? = nil,
    operation3: InjectedOperation? = nil,
    operation4: InjectedOperation? = nil,
    operation5: InjectedOperation? = nil,
    operation6: InjectedOperation? = nil,
    operation7: InjectedOperation? = nil,
    operation8: InjectedOperation? = nil,
    operation9: InjectedOperation? = nil,
    operation10: InjectedOperation? = nil,
    content: InjectedViewStore = .empty()) -> InjectedViewStore {
        .button(store: .init(id: id, modifiers: modifiers, operation1: operation1, operation2: operation2, operation3: operation3, operation4: operation4, operation5: operation5, operation6: operation6, operation7: operation7, operation8: operation8, operation9: operation9, operation10: operation10, content: content))
    
}
func namedImage(
    id: String = "",
    name: String? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedViewStore {
        .namedImage(store: .init(id: id, name: name, modifiers: modifiers))
    
}
func systemImage(
    id: String = "",
    systemName: String? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedViewStore {
        .systemImage(store: .init(id: id, systemName: systemName, modifiers: modifiers))
    
}
func color(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    colorKey: String = "") -> InjectedViewStore {
        .color(store: .init(id: id, modifiers: modifiers, colorKey: colorKey))
    
}
func spacer(
    id: String = "",
    modifiers: [InjectedModifier] = []) -> InjectedViewStore {
        .spacer(store: .init(id: id, modifiers: modifiers))
    
}
// case `if`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore)
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
