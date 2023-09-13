//
//  InjectedService.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//

import Foundation
import Combine


func createState() -> Data {
    let values: [InjectedValue] = [
        .string(stateId: "", id: "name", value: "Blake"),
        .string(stateId: "", id: "email", value: "blake@mail.com"),
        .integer(stateId: "", id: "age", value: 35),
        .string(stateId: "", id: "multiplyButtonTitle", value: "Multiply"),
        .string(stateId: "", id: "displayButtonTitle", value: "Display"),
        .string(stateId: "", id: "fullScreenTitle", value: "Push Display Button"),
        .string(stateId: "", id: "dismissButtonTitle", value: "Dismiss"),
        .boolean(stateId: "", id: "isPageDisplayed", value: true)
    ]
    return try! JSONEncoder().encode(InjectedState(id: "appState", state: values))
}

func createViewStore() -> Data {
    
    var presentedContent: InjectedViewStore {
        .vStack(store: .init(
            id: "presentedContent",
            
            content1: .text(store: .init(id: "", textKey: "name")),
            content2: .text(store: .init(id: "", textKey: "email")),
            content3: .field(store: .init(id: "", textKey: "email", content: .empty())),
            content4: .button(store: .init(
                id: "multiplyButton",
                operation1: .assign(key: "name", value: .string(stateId: "", id: "name", value: "Dolo")),
                operation2: .asyncAfter(operation: .assign(key: "name", value:.string(stateId: "", id: "name", value: "You did it")), delay: 2.5),
                content: .text(store: .init(id: "", textKey: "multiplayButtonTitle")))),
            content5: .button(store: .init(
                id: "dismissButton",
                operation1: .assign(key: "isPageDisplayed", value: .boolean(stateId: "", id: "isPageDisplayed", value: false)),
                content: .text(store: .init(id: "", textKey: "dismissButtonTitle"))
            ))
        ))
    }
    
    var entryViewStore: InjectedViewStore {
        .vStack(store: .init(
            id: "entry",
            modifiers: [
                .fullScreenCover(viewStore: .viewStoreReference(id: "presentedContent"), isPresentedKey: "isPageDisplayed")
            ],
            content1: .text(store: .init(id: "", textKey: "fullScreenTitle")),
            content2: .spacer(store: .init(id: "", modifiers: [.frame(stateId: "", widthId: "", heightId: "fullScreenSpacerHeight", width: nil, height: nil)])),
            content3: .button(store: .init(id: "displayButton",
                                           operation1: .assign(key: "isPageDisplayed", value: .boolean(stateId: "", id: "isPageDisplayed", value: true)),
                                           content: .text(store: .init(id: "", textKey: "displayButtonTitle"))
                                          ))
        ))
    }
            
            
    let container = ViewStoresContainer(viewStores: [entryViewStore, presentedContent])
    return try! JSONEncoder().encode(container)
}

func getState() -> InjectedState {
//    let state = Bundle.main.decode(InjectedState.self, from: "Insertable.json")
    
    return try! JSONDecoder().decode(InjectedState.self, from: createState())
}

func getViewStores() -> ViewStoresContainer {
//    let viewStoresContainer = Bundle.main.decode(ViewStoresContainer.self, from: "ViewStore.json")
    return try! JSONDecoder().decode(ViewStoresContainer.self, from: createViewStore())
}
