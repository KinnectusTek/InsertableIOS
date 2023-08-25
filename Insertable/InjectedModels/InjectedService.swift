//
//  InjectedService.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//

import Foundation
import Combine

struct ViewStoresContainer: Codable {
    let viewStores: [InjectedViewStore]
}
func createState() -> Data {
    let values: [InjectedValue] = [
        .string(id: "name", value: "Blake"),
        .string(id: "email", value: "blake@mail.com"),
        .integer(id: "age", value: 35),
        .string(id: "multiplyButtonTitle", value: "Multiply"),
        .string(id: "displayButtonTitle", value: "Display"),
        .string(id: "fullScreenTitle", value: "Push Display Button"),
        .string(id: "dismissButtonTitle", value: "Dismiss"),
        .boolean(id: "isPageDisplayed", value: false),
        .frame(id: "fullScreenSpacerHeight", width: 100, height: 100)
    ]
    return try! JSONEncoder().encode(InjectedState(state: values))
}
func creatViewStore() -> Data {
    var presentedContent: InjectedViewStore {
        .vStack(
            id: "presentedContent",
            modifiers: [],
            content1: .text(id: "", modifiers: [], textKey: "name", content: .empty()),
            content2: .text(id: "", modifiers: [], textKey: "email", content: .empty()),
            content3: .field(id: "", modifiers: [], textKey: "email", content: .empty()),
            content4: .button(
                id: "multiplyButton",
                modifiers: [],
                operation1: .assign(key: "name", value: .string(id: "name", value: "Dolo")),
                operation2: .asyncAfter(operation: .assign(key: "name", value:.string(id: "name", value: "You did it")), delay: 2.5),
                content: .text(id: "", modifiers: [], textKey: "multiplayButtonTitle", content: .empty())),
            content5: .button(
                id: "dismissButton",
                modifiers: [],
                operation1: .assign(key: "isPageDisplayed", value: .boolean(id: "isPageDisplayed", value: false)),
                content: .text(id: "", modifiers: [], textKey: "dismissButtonTitle", content: .empty())
            )
        )
    }
    let fullScreenStore: InjectedViewStore = .fullScreenCover(
        id: "entry",
        modifiers: [],
        isPresentedKey: "isPageDisplayed",
        content: .vStack(
            id: "", modifiers: [],
            content1: .text(id: "", modifiers: [], textKey: "fullScreenTitle", content: .empty()),
            content2: .spacer(id: "", modifiers: [.frame(id: "fullScreenSpacerHeight")]),
            content3: .button(id: "displayButton",
                              modifiers: [],
                              operation1: .assign(key: "isPageDisplayed", value: .boolean(id: "isPageDisplayed", value: true)),
                              content: .text(id: "", modifiers: [], textKey: "displayButtonTitle", content: .empty())
                             )
                    ),
        presentedContent: .viewStoreReference(id: "presentedContent"))
            
            
    let container = ViewStoresContainer(viewStores: [fullScreenStore, presentedContent])
    return try! JSONEncoder().encode(container)
}
func getState() -> InjectedState {
//    let state = Bundle.main.decode(InjectedState.self, from: "Insertable.json")
    
    return try! JSONDecoder().decode(InjectedState.self, from: createState())
}

func getViewStores() -> ViewStoresContainer {
//    let viewStoresContainer = Bundle.main.decode(ViewStoresContainer.self, from: "ViewStore.json")
    return try! JSONDecoder().decode(ViewStoresContainer.self, from: creatViewStore())
}


extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

extension Array {
    func itemAtIndex(index: Int) -> Self.Element? {
        if count > index {
            return self[index]
        } else {
            return nil
        }
    }
}
