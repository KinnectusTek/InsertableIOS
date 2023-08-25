//
//  WireWireInjectedViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/22/23.
//

import Foundation

struct ViewStoresContainer: Codable {
    let viewStores: [WireInjectedViewStore]
}

indirect enum WireInjectedViewStore: Codable, Hashable {
    static func == (lhs: WireInjectedViewStore, rhs: WireInjectedViewStore) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    case viewStoreReference(id: String)
    case vStack(id: String = "",
                modifiers: [InjectedModifier],
                content1: WireInjectedViewStore,
                content2: WireInjectedViewStore? = nil,
                content3: WireInjectedViewStore? = nil,
                content4: WireInjectedViewStore? = nil,
                content5: WireInjectedViewStore? = nil,
                content6: WireInjectedViewStore? = nil,
                content7: WireInjectedViewStore? = nil,
                content8: WireInjectedViewStore? = nil,
                content9: WireInjectedViewStore? = nil,
                content10: WireInjectedViewStore? = nil)
    case hStack(id: String = "",
                modifiers: [InjectedModifier],
                content1: WireInjectedViewStore,
                content2: WireInjectedViewStore? = nil,
                content3: WireInjectedViewStore? = nil,
                content4: WireInjectedViewStore? = nil,
                content5: WireInjectedViewStore? = nil,
                content6: WireInjectedViewStore? = nil,
                content7: WireInjectedViewStore? = nil,
                content8: WireInjectedViewStore? = nil,
                content9: WireInjectedViewStore? = nil,
                content10: WireInjectedViewStore? = nil)
    case text(id: String = "",
              modifiers: [InjectedModifier],
              textKey: String,
              content: WireInjectedViewStore)
    case field(id: String = "",
               modifiers: [InjectedModifier],
               textKey: String,
               content: WireInjectedViewStore)
    case button(id: String = "",
                modifiers: [InjectedModifier],
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
                content: WireInjectedViewStore)
    case spacer(id: String = "",
                modifiers: [InjectedModifier])
    case empty(id: String = "")
    case fullScreenCover(
        id: String = "",
        modifiers: [InjectedModifier],
        isPresentedKey: String,
        content: WireInjectedViewStore,
        presentedContent: WireInjectedViewStore)
    case sheet(id: String = "",
               modifiers: [InjectedModifier],
               isPresentedKey: String,
               content: WireInjectedViewStore,
               presentedContent: WireInjectedViewStore)
    
    var id: String {
        switch self {
        case .viewStoreReference(let id),
                .vStack(let id,_, _, _, _, _, _, _, _, _, _, _),
                .hStack(let id,_, _, _, _, _, _, _, _, _, _, _),
                .text(let id, _, _, _),
                .field(let id, _, _, _),
                .button(let id, _, _, _, _, _, _, _, _, _, _, _, _),
                .spacer(let id, _),
                .empty(let id),
                .fullScreenCover(let id, _, _, _, _),
                .sheet(let id, _, _, _, _):
            return id
        }
    }
    var isViewStoreReference: Bool {
        if case .viewStoreReference = self {
            return true
        }
        return false
    }
    var content: (WireInjectedViewStore,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?
                  
    ) {
        switch self {
        case .vStack(_, _, let content1, let content2, let content3, let content4,let content5,let content6,let content7,let content8,let content9,let content10),
                .hStack(_, _, let content1, let content2, let content3, let content4,let content5,let content6,let content7,let content8,let content9,let content10):
            return (content1, content2, content3, content4, content5,content6,content7,content8,content9,content10)
        case .text(_, _, _, let content),
                .field(_, _, _, let content),
                .button(_, _, _,_,_,_,_,_,_,_,_,_, let content),
                .fullScreenCover(_, _, _, let content, _),
                .sheet(_, _, _, let content, _):
            return (content, nil, nil, nil, nil, nil, nil, nil, nil, nil)
        case .empty, .spacer, .viewStoreReference:
            return (.empty(id: ""), nil, nil, nil, nil, nil, nil, nil, nil, nil)
        }
    }
    func contentHasReference() -> Bool {
        let content = self.allContent
        let result = [content.0,
                      content.1,
                      content.2,
                      content.3,
                      content.4,
                      content.5,
                      content.6,
                      content.7,
                      content.8,
                      content.9,
                      content.10
        ].compactMap { $0 }.reduce(self.isViewStoreReference) { partialResult, store in
            return partialResult || store.isViewStoreReference
        }
        return result
    }
    var allContent: (WireInjectedViewStore,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore?,
                  WireInjectedViewStore
                  
    ) {
        switch self {
        case .vStack(_, _, let content1, let content2, let content3, let content4,let content5,let content6,let content7,let content8,let content9,let content10),
                .hStack(_, _, let content1, let content2, let content3, let content4,let content5,let content6,let content7,let content8,let content9,let content10):
            return (content1, content2, content3, content4, content5,content6,content7,content8,content9,content10, .empty())
        case .text(_, _, _, let content),
                .field(_, _, _, let content),
                .button(_, _, _,_,_,_,_,_,_,_,_,_, let content),
                .sheet(_, _, _, let content, _):
            return (content, nil, nil, nil, nil, nil, nil, nil, nil, nil, .empty())
        case .fullScreenCover(_, _, _, let content, let presentedContent):
            return (content, nil, nil, nil, nil, nil, nil, nil, nil, nil, presentedContent)
        case .empty, .spacer, .viewStoreReference:
            return (.empty(id: ""), nil, nil, nil, nil, nil, nil, nil, nil, nil, .empty())
        }
    }
}


