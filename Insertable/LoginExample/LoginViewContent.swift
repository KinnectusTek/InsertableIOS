//
//  LoginViewContent.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation

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
    
    let onboardingState: [InjectedValue] = [
        .string(stateId: "", id: "appIcon", value: "appIcon"),
        .string(stateId: "", id: "backgroundImage", value: "home.backgroundImage"),
        .string(stateId: "", id: "title", value: "Everything you need is in One Place"),
        .string(stateId: "", id: "description", value: "This is some text about the app"),
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
        .vStack(store: .init(id: "entry",
                             modifiers: [],
                             content1: .namedImage(store: .init(id: "", name: "backgroundImage", modifiers: [.frame(width: 300, height: 300)])),
                             content2: .hStack(store: .init(
                                id: "",
                                modifiers: [],
                                content1: .namedImage(store: .init(id: "", name: "appIcon", modifiers: [.frame(width: 100, height: 50)])),
                                content2: .spacer(store: .init(modifiers: [])))
                             ),
                             content4: .text(store: .init(id: "", modifiers: [.systemFont(stateId: "", nameId: "", description: "title")], textKey: "title")),
                             content5: .text(store: .init(id: "", modifiers: [.systemFont(stateId: "", nameId: "", description: "subtitle")], textKey: "description")),
                             content6: .button(store: .init(
                                id: "",
                                modifiers: [.cornerRadius(stateId: "", valueId: "", radius: 20)],
                                content: .text(store: .init(id: "", modifiers: [.foregroundColor(stateId: "", valueId: "", colorHex: "FFFFFF")], textKey: "loginButtonTitle")))),
                            content7: .button(store: .init(
                                                id: "",
                                                modifiers: [.cornerRadius(stateId: "", valueId: "", radius: 20)],
                                                content: .text(store: .init(id: "", modifiers: [], textKey: ""))))
                )
        )
    }
    return Data()
}
