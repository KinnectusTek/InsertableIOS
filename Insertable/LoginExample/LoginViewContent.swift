//
//  LoginViewContent.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation

extension String {
    static let empty = ""
}
struct RegisterStateKey {
    static let  none = "none"
    static let  backButtonIcon = "backButtonIcon"
    static let  appIcon = "appIcon"
    static let  title = "title"
    static let  subTitle = "subTitle"
    static let  userNameHeading = "userNameHeading"
    static let  userNamePlaceholder = "userNamePlaceholder"
    static let  emailHeading = "emailHeading"
    static let  emailPlaceholder = "emailPlaceholder"
    static let  passwordHeading = "passwordHeading"
    static let  showHidePasswordIcon = "showHidePasswordIcon"
    static let  confirmPasswordHeading = "confirmPasswordHeading"
    static let  showHidePasswordHeading = "showHidePasswordHeading"
    static let  showHideConfirmPasswordIcon = "showHideConfirmPasswordIcon"
    static let  registerButtonTitle = "registerButtonTitle"
}

struct LoginStateKey {
    static let  none = "none"
    static let  backButtonIcon = "backButtonIcon"
    static let  appIcon = "appIcon"
    static let  title = "title"
    static let  subTitle = "subTitle"
    static let  userNameHeading = "userNameHeading"
    static let  userNamePlaceholder = "userNamePlaceholder"
    static let  emailHeading = "emailHeading"
    static let  emailPlaceholder = "emailPlaceholder"
    static let  passwordHeading = "passwordHeading"
    static let  showHidePasswordIcon = "showHidePasswordIcon"
    static let  confirmPasswordHeading = "confirmPasswordHeading"
    static let  showHidePasswordHeading = "showHidePasswordHeading"
    static let  showHideConfirmPasswordIcon = "showHideConfirmPasswordIcon"
    static let  registerButtonTitle = "registerButtonTitle"
    static let  forgotPasswordButtonTitle = "forgotPasswordButtonTitle"
    static let  loginButtonTitle = "loginButtonTitle"
    static let  alternateLoginText = "alternateLoginText"
    static let  facebookIcon = "facebookIcon"
    static let  googleIcon = "googleIcon"
    static let  appleIcon = "appleIcon"
}

struct OnboardingStateKey {
    static let  none = "none"
    static let  appIcon = "appIcon"
    static let  backgroundImage = "backgroundImage"
    static let  title = "title"
    static let  subTitle = "subTitle"
    static let  loginButtonTitle = "loginButtonTitle"
    static let  registerButtonTitle = "registerButtonTitle"
    static let  isLoginPresented = "isLoginPresented"
    static let  loginState = "loginState"
    static let  registerState = "registerState"
}

func createLoginState() -> Data {
    
    let registerState: [InjectedValue] = [
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.backButtonIcon, value: "backButton"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.appIcon, value: "appIcon"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.title, value: "Register"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.subTitle, value: "Enter your personal information"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.userNameHeading, value: "Username"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.userNamePlaceholder, value: "Enter your name"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.emailHeading, value: "Email"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.emailPlaceholder, value: "Enter your email"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.passwordHeading, value: "Password"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.showHidePasswordIcon, value: "passwordHiddenIcon"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.confirmPasswordHeading, value: "ConfirmPassword"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.showHideConfirmPasswordIcon, value: "passwordHiddenIcon"),
        .string(stateId: RegisterStateKey.none, id: RegisterStateKey.registerButtonTitle, value: "Register")
    ]
    
    let loginState: [InjectedValue] = [
        .string(stateId: LoginStateKey.none, id: LoginStateKey.backButtonIcon, value: "backButton"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.appIcon, value: "appIcon"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.title, value: "Login"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.subTitle, value: "Login to continue using the app"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.emailHeading, value: "Email"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.emailPlaceholder, value: "Enter your email"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.passwordHeading, value: "Enter your password"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.showHidePasswordIcon, value: "passwordHiddenIcon"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.forgotPasswordButtonTitle, value: "Forgot Password?"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.loginButtonTitle, value: "Login"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.alternateLoginText, value: "Or Login With"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.facebookIcon, value: "facebookIcon"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.googleIcon, value: "googleIcon"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.appleIcon, value: "appleIcon"),
        .string(stateId: LoginStateKey.none, id: LoginStateKey.registerButtonTitle, value: "Don't have an account, Register")
    ]
    
    let onboardingState: [InjectedValue] = [
        .string(stateId: OnboardingStateKey.none, id: OnboardingStateKey.appIcon, value: "appIcon"),
        .string(stateId: OnboardingStateKey.none, id: OnboardingStateKey.backgroundImage, value: "home.backgroundImage"),
        .string(stateId: OnboardingStateKey.none, id: OnboardingStateKey.title, value: "Everything you need is in One Place"),
        .string(stateId: OnboardingStateKey.none, id: OnboardingStateKey.subTitle, value: "This is some text about the app"),
        .string(stateId: OnboardingStateKey.none, id: OnboardingStateKey.loginButtonTitle, value: "Login"),
        .string(stateId: OnboardingStateKey.none, id: OnboardingStateKey.registerButtonTitle, value: "Register"),
        .boolean(stateId: OnboardingStateKey.none, id: OnboardingStateKey.isLoginPresented, value: false),
        .state(stateId: OnboardingStateKey.none, id: OnboardingStateKey.loginState, value: InjectedState(id: "loginState", state: loginState)),
        .state(stateId: OnboardingStateKey.none, id: OnboardingStateKey.registerState, value: InjectedState(id: "registerState", state: registerState))
    ]
    let state = try! JSONEncoder().encode(InjectedState(id: "appState", state: onboardingState))
    print(state.count)
    return state
}

func createLoginViewStore() -> Data {
    var onboardingViewStore: InjectedView {
        vStack(id: "entry", content: {
            namedImage(id: LoginStateKey.none, name: "background")
                .frame(width: 300, height: 300)
        }, {
            hStack(content: {
                namedImage(name: LoginStateKey.appIcon)
                    .frame(width: 100, height: 50)
            }, {
                spacer()
            })
        }, {
            text(textKey: LoginStateKey.title)
                .systemFont(description: "title")
        }, {
            text(textKey: LoginStateKey.subTitle)
                .systemFont(description: "subtitle")
        }, {
            button {
                text(textKey: LoginStateKey.loginButtonTitle)
                    .foregroundColor(colorHex: "FFFFFF")
                    .background(content: color(id: .empty, colorKey: "#2F70AF"), ignoresSafeAreaEdges: .all)
                    .borderline(stateId: .empty, widthId: .empty, colorId: .empty, width: 2, colorHex: "000000")
            }
            .cornerRadius(radius: 20)
        }, {
            button {
                text(textKey: LoginStateKey.registerButtonTitle)
            }
            .cornerRadius(radius: 20)
        })
    }
    
    let container = try! JSONEncoder().encode(ViewStoresContainer(viewStores: [onboardingViewStore]))
    print(container.count)
    return container
}

func getLoginViewStores() -> ViewStoresContainer {
    return try! JSONDecoder().decode(ViewStoresContainer.self, from: createLoginViewStore())
}

func getLoginState() -> InjectedState {    
    return try! JSONDecoder().decode(InjectedState.self, from: createLoginState())
}
