//
//  InjectedView_Util.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation
typealias InjectedContent = () -> InjectedView

func vStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .vStack(store: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

func hStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .hStack(store: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

func zStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .zStack(store: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

func list(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    listKey: String = "",
    content: InjectedContent = { .empty()}) -> InjectedView {
        .list(store: .init(id: id, modifiers: modifiers, listKey: listKey, content: content()))
}

func forEach(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    forEachKey: String = "",
    content: InjectedContent = { .empty() }) -> InjectedView {
        .forEach(store: .init(id: id, modifiers: modifiers, forEachKey: forEachKey, content: content()))
}

func text(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    textKey: String = "") -> InjectedView {
        .text(store: .init(id: id, modifiers: modifiers, textKey: textKey))
}

func field(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    textKey: String = "",
    content: InjectedContent = { .empty()}) -> InjectedView {
        .field(store: .init(id: id, modifiers: modifiers, textKey: textKey, content: content()))
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
    content: InjectedContent = { .empty()}) -> InjectedView {
    .button(store: .init(id: id, modifiers: modifiers, operation1: operation1, operation2: operation2, operation3: operation3, operation4: operation4, operation5: operation5, operation6: operation6, operation7: operation7, operation8: operation8, operation9: operation9, operation10: operation10, content: content()))
}

func namedImage(
    id: String = "",
    name: String? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .namedImage(store: .init(id: id, name: name, modifiers: modifiers))
}

func systemImage(
    id: String = "",
    systemName: String? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .systemImage(store: .init(id: id, systemName: systemName, modifiers: modifiers))
}

func color(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    colorKey: String = "") -> InjectedView {
        .color(store: .init(id: id, modifiers: modifiers, colorKey: colorKey))
}

func spacer(
    id: String = "",
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .spacer(store: .init(id: id, modifiers: modifiers))
}
