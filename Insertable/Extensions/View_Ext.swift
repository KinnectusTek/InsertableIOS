//
//  View_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import SwiftUI
import Combine

extension View {
    func addModifier(modifier: InjectedModifier, state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        switch modifier {
        case let .font(stateId, nameId, sizeId, fontName, fontSize):
        //Route state value using statedi and id
            if let fontName = findStringValue(id: nameId, state: state.value), let fontSize = findDoubleValue(id: sizeId, state: state.value) {
                return AnyView(
                    self.font(Font(UIFont(name: fontName, size: fontSize)!))
                )
            } else if let fontName = fontName, let fontSize = fontSize {
                return AnyView(
                    self.font(Font(UIFont(name: fontName, size: fontSize)!))
                )
            } else {
                return AnyView(self)
            }
            
        case let .frame(stateId, widthId, heightId, width, height):
            //Route state value using statedi and id
            if let width = findDoubleValue(id: widthId, state: state.value), let height = findDoubleValue(id: heightId, state: state.value) {
                return AnyView(
                    self.frame(width: width, height: height)
                    )
            } else if let width = width, let height = height {
                return AnyView(
                    self.frame(width: width, height: height)
                    )
            } else {
                return AnyView(self)
            }
            
        case let .backgroundColor(stateId, id, hex):
            if let hexValue = findStringValue(id: id, state: state.value) {
                return AnyView(self.background(Color(UIColor.hex(hexValue))))
            } else if let hex = hex {
                return AnyView(self.background(Color(UIColor.hex(hex))))
            } else {
                return AnyView(self)
            }
        case let .fullScreenCover(viewStore, isPresentedKey):
            if let isPresented = findBooleanValue(id: isPresentedKey, state: state.value) {
                return AnyView(
                    self.fullScreenCover(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: viewStore)
                    })
                )
            } else {
                return AnyView(self)
            }
        case let .sheet(viewStore, isPresentedKey):
            if let isPresented = findBooleanValue(id: isPresentedKey, state: state.value) {
                return AnyView(
                    self.sheet(isPresented: .constant(isPresented), content: {
                        Insertable(state: state, container: container, viewStore: viewStore)
                    })
                )
            } else {
                return AnyView(self)
            }
        case .cornerRadius(stateId: let stateId, valueId: let valueId, radius: let radius):
            //Route state value using statedi and id
            if let radiusValue = findDoubleValue(id: valueId, state: state.value) {
                return AnyView(
                    self.cornerRadius(CGFloat(radiusValue))
                )
            } else if let radius = radius {
                return AnyView(
                    self.cornerRadius(CGFloat(radius))
                )
            } else {
                return AnyView(self)
            }
        case let .borderline(_, widthId, colorId, width, color):
            if let widthValue = findDoubleValue(id: widthId, state: state.value), let colorValue = findStringValue(id: colorId, state: state.value) {
                return AnyView(
                    self.border(Color(UIColor.hex(colorValue)), width: CGFloat(widthValue))
                )
            } else if let width = width, let color = color {
                return AnyView(
                    self.border(Color(UIColor.hex(color)), width: CGFloat(width))
                )
            } else {
                return AnyView(self)
            }
            
        }
    }
    
   
    func addModifiers(mods: [InjectedModifier], state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        print(state.value)
        return mods
            .reduce(AnyView(self), { accum, nextModifier -> AnyView in
                accum.addModifier(modifier: nextModifier, state: state, container: container).eraseToAnyView()
        })
    }
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}


