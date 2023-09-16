//
//  InjectedViewStoreAddModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/13/23.
//

import Foundation

extension InjectedView {
    
    func addModifer(modifier: InjectedModifier) -> InjectedView {
        switch self {
        case .viewStoreReference, .if, .empty:
            return self
        case .vStack(let store):
            return .vStack(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), alignmentKey: store.alignmentKey, spacingKey: store.spacingKey, content1: store.content1, content2: store.content2, content3: store.content3, content4: store.content4, content5: store.content5, content6: store.content6, content7: store.content7, content8: store.content8, content9: store.content9, content10: store.content10))
        case .hStack(let store):
            return .hStack(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), alignmentKey: store.alignmentKey, spacingKey: store.spacingKey, content1: store.content1, content2: store.content2, content3: store.content3, content4: store.content4, content5: store.content5, content6: store.content6, content7: store.content7, content8: store.content8, content9: store.content9, content10: store.content10))
        case .zStack(let store):
            return .zStack(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), alignmentKey: store.alignmentKey, spacingKey: store.spacingKey, content1: store.content1, content2: store.content2, content3: store.content3, content4: store.content4, content5: store.content5, content6: store.content6, content7: store.content7, content8: store.content8, content9: store.content9, content10: store.content10))
        case .list(let store):
            return .list(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), listKey: store.listKey, content: store.content))
        case .forEach(let store):
            return .forEach(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), forEachKey: store.forEachKey, content: store.content))
        case .text(let store):
            return .text(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), textKey: store.textKey))
        case .field(let store):
            return .field(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), textKey: store.textKey))
        case .button(let store):
            return .button(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), operation1: store.operation1, operation2: store.operation2, operation3: store.operation3, operation4: store.operation4, operation5: store.operation5, operation6: store.operation6, operation7: store.operation7, operation8: store.operation8, operation9: store.operation9, operation10: store.operation10, content: store.content))
        case .namedImage(let store):
            return .namedImage(store: .init(id: store.id, name: store.name, systemName: store.systemName, modifiers: store.modifiers.appending(modifier)))
        case .systemImage(let store):
            return .systemImage(store: .init(id: store.id, name: store.name, systemName: store.systemName, modifiers: store.modifiers.appending(modifier)))
        case .color(let store):
            return .color(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier), colorKey: store.colorKey))
        case .spacer(let store):
            return .spacer(store: .init(id: store.id, modifiers: store.modifiers.appending(modifier)))
        
        }
    }
}

