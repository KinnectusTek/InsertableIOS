//
//  InjectedViewStoreAddModifier.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/13/23.
//

import Foundation

extension InjectedViewStore {
    
    func addModifer(modifier: InjectedModifier) -> InjectedViewStore {
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


extension InjectedViewStore {
    
    func systemFont(stateId: String = "", nameId: String = "", description: String = "") -> InjectedViewStore {
        self.addModifer(modifier: .systemFont(stateId: stateId, nameId: nameId, description: description))
    }
    
    func font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil) -> InjectedViewStore {
        self.addModifer(modifier: .font(stateId: stateId, nameId: nameId, sizeId: sizeId, fontName: fontName, fontSize: fontSize))
    }
    func frame(stateId: String = "", widthId: String = "", heightId: String = "", width: Double? = nil, height: Double? = nil) -> InjectedViewStore {
        self.addModifer(modifier: .frame(stateId: stateId, widthId: widthId, heightId: heightId, width: width, height: height))
    }
    
    func cornerRadius(stateId: String = "", valueId: String = "", radius: Double? = nil) -> InjectedViewStore {
        self.addModifer(modifier: .cornerRadius(stateId: stateId, valueId: valueId, radius: radius))
    }
    
    func borderline(stateId: String = "", widthId: String = "", colorId: String = "", width: Double? = nil, colorHex: String? = nil) -> InjectedViewStore {
        self.addModifer(modifier: .borderline(stateId: stateId, widthId: widthId, colorId: colorId, width: width, colorHex: colorHex))
    }
    
    func foregroundColor(stateId: String = "", valueId: String = "", colorHex: String? = nil) -> InjectedViewStore {
        self.addModifer(modifier: .foregroundColor(stateId: stateId, valueId: valueId, colorHex: colorHex))
    }
    
    func background(content: InjectedViewStore, ignoresSafeAreaEdges: InjectedEdgeSet) -> InjectedViewStore {
        self.addModifer(modifier: .background(content: content, ignoresSafeAreaEdges: ignoresSafeAreaEdges))
    }
    
    func fullScreenCover(viewStore: InjectedViewStore, isPresentedKey: String) -> InjectedViewStore {
        self.addModifer(modifier: .fullScreenCover(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
    
    func sheet(viewStore: InjectedViewStore, isPresentedKey: String) -> InjectedViewStore {
        self.addModifer(modifier: .sheet(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
}
