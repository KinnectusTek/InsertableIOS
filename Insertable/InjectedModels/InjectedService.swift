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

func createLoginState() -> Data {
    let registerState: [InjectedValue] = [
        .string(stateId: "", id: "backButtonIcon", value: "backButton"),
        .string(stateId: "", id: "appIcon", value: "appIcon"),
        .string(stateId: "", id: "title", value: "Register"),
        .string(stateId: "", id: "subTitle", value: "Enter your personal information"),
        .string(stateId: "", id: "usernameHeading", value: "Username"),
        .string(stateId: "", id: "usernamePlaceholder", value: "Enter your name"),
        .string(stateId: "", id: "emailHeading", value: "Email"),
        .string(stateId: "", id: "emailPlaceholder", value: "Enter your email"),
        .string(stateId: "", id: "passwordHeading", value: "Password"),
        .string(stateId: "", id: "showHidePasswordIcon", value: "passwordHiddenIcon"),
        .string(stateId: "", id: "confirmPasswordHeading", value: "ConfirmPassword"),
        .string(stateId: "", id: "showHideConfirmPasswordIcon", value: "passwordHiddenIcon"),
        .string(stateId: "", id: "registerButtonTitle", value: "Register")
    ]
    
    let loginState: [InjectedValue] = [
        .string(stateId: "", id: "backButtonIcon", value: "backButton"),
        .string(stateId: "", id: "appIcon", value: "appIcon"),
        .string(stateId: "", id: "title", value: "Login"),
        .string(stateId: "", id: "subTitle", value: "Login to continue using the app"),
        .string(stateId: "", id: "emailHeading", value: "Email"),
        .string(stateId: "", id: "emailPlaceholder", value: "Enter your email"),
        .string(stateId: "", id: "passwordHeading", value: "Enter your password"),
        .string(stateId: "", id: "showHidePasswordIcon", value: "passwordHiddenIcon"),
        .string(stateId: "", id: "forgotPasswordButtonTitle", value: "Forgot Password?"),
        .string(stateId: "", id: "loginButtonTitle", value: "Login"),
        .string(stateId: "", id: "alternatleLoginText", value: "Or Login With"),
        .string(stateId: "", id: "facebookIcon", value: "facebookIcon"),
        .string(stateId: "", id: "googleIcon", value: "googleIcon"),
        .string(stateId: "", id: "appleIcon", value: "appleIcon"),
        .string(stateId: "", id: "registerButtonTitle", value: "Don't have an account, Register")
    ]
    let appState: [InjectedValue] = [
        .string(stateId: "", id: "appIcon", value: "appIcon"),
        .string(stateId: "", id: "backgroundImage", value: "home.backgroundImage"),
        .string(stateId: "", id: "title", value: "Login"),
        .string(stateId: "", id: "subTitle", value: "This is the place to Login"),
        .string(stateId: "", id: "loginDescription", value: "This is some text about the app"),
        .string(stateId: "", id: "loginButtonTitle", value: "Login"),
        .string(stateId: "", id: "registerButtonTitle", value: "Register"),
        .boolean(stateId: "", id: "isLoginPresented", value: false),
        .state(stateId: "", id: "loginState", value: InjectedState(id: "loginState", state: loginState)),
        .state(stateId: "", id: "registerState", value: InjectedState(id: "registerState", state: registerState))
    ]
    return Data()
}

func createLoginViewStore() -> Data {
    var onboardingViewStore: InjectedViewStore {
        .vStack(id: "entry",
                modifiers: [],
                content1: .hStack(
                    id: "",
                    modifiers: [],
                    content1: .namedImage(name: "", modifiers: []),
                    content2: .text(id: "", modifiers: [], textKey: "")
                ),
                content2: .text(id: "", modifiers: [], textKey: ""),
                content3: .text(id: "", modifiers: [], textKey: ""),
                content4: .button(
                    id: "",
                    modifiers: [],
                    content: .text(id: "", modifiers: [], textKey: "")
                ),
                content5: .button(
                    id: "",
                    modifiers: [],
                    content: .text(id: "", modifiers: [], textKey: "")
                )
        )
    }
    return Data()
}
func createViewStore() -> Data {
    
    var presentedContent: InjectedViewStore {
        .vStack(
            id: "presentedContent",
            
            content1: .text(id: "", textKey: "name"),
            content2: .text(id: "", textKey: "email"),
            content3: .field(id: "", textKey: "email", content: .empty()),
            content4: .button(
                id: "multiplyButton",
                operation1: .assign(key: "name", value: .string(stateId: "", id: "name", value: "Dolo")),
                operation2: .asyncAfter(operation: .assign(key: "name", value:.string(stateId: "", id: "name", value: "You did it")), delay: 2.5),
                content: .text(id: "", textKey: "multiplayButtonTitle")),
            content5: .button(
                id: "dismissButton",
                operation1: .assign(key: "isPageDisplayed", value: .boolean(stateId: "", id: "isPageDisplayed", value: false)),
                content: .text(id: "", textKey: "dismissButtonTitle")
            )
        )
    }
    
    var entryViewStore: InjectedViewStore {
        .vStack(
            id: "entry",
            modifiers: [
                .fullScreenCover(viewStore: .viewStoreReference(id: "presentedContent"), isPresentedKey: "isPageDisplayed")
            ],
            content1: .text(id: "", textKey: "fullScreenTitle"),
            content2: .spacer(id: "", modifiers: [.frame(stateId: "", widthId: "", heightId: "fullScreenSpacerHeight", width: nil, height: nil)]),
            content3: .button(id: "displayButton",
                              operation1: .assign(key: "isPageDisplayed", value: .boolean(stateId: "", id: "isPageDisplayed", value: true)),
                              content: .text(id: "", textKey: "displayButtonTitle")
                             )
        )
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
