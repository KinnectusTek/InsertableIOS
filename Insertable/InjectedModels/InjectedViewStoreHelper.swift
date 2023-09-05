//
//  InjectedViewStoreHelper.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation

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
