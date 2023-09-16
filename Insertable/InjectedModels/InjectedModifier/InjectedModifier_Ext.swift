//
//  InjectedModifier_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/5/23.
//

import Foundation
import SwiftUI
import Combine

extension View {
    
    func addModifier(modifier: InjectedModifier, state: CurrentValueSubject<InjectedState, Never>, container: ViewStoresContainer) -> some View {
        switch modifier {
        case let .systemFont(_, descriptionId, description):
            if let fontDescription = findStringValue(id: descriptionId, state: state.value), let injectedSystemFont = InjectedSystemFont(rawValue: fontDescription) {
                return AnyView(
                    self.font(injectedSystemFont.font)
                )
            } else if let injectedSystemFont = InjectedSystemFont(rawValue: description) {
                return AnyView(
                    self.font(injectedSystemFont.font)
                )
            } else {
                return AnyView(self)
            }
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
        
        case let .foregroundColor(stateId, id, hex):
            if let hexValue = findStringValue(id: id, state: state.value) {
                return AnyView(
                    self.foregroundColor(Color(UIColor.hex(hexValue)))
                )
            } else if let hex = hex {
                return AnyView(
                    self.foregroundColor(Color(UIColor.hex(hex)))
                )
            } else {
                return AnyView(self)
            }
        case let .background(viewStore, ignoresSafeAreaEdges, alignment):
                return AnyView(
                    self.background(Insertable(state: state, container: container, viewStore: viewStore), alignment: alignment.render)
                )
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
        case let .cornerRadius(stateId, valueId, radius):
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
        case let .minWidth(stateId, widthId, width):
            if let width = findDoubleValue(id: widthId, state: state.value) {
                return AnyView(
                    self.frame(minWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    self.frame(minWidth: CGFloat(width))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .maxWidth(stateId, widthId, width):
            if let width = findDoubleValue(id: widthId, state: state.value) {
                return AnyView(
                    self.frame(maxWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    self.frame(maxWidth: CGFloat(width))
                )
            } else {
                return AnyView(
                    self
                )
            }
            
        case let .minHeight(stateId, heightId, height):
            if let height = findDoubleValue(id: heightId, state: state.value) {
                return AnyView(
                    self.frame(minHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    self.frame(minHeight: CGFloat(height))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .maxHeight(stateId, heightId, height):
            if let height = findDoubleValue(id: heightId, state: state.value) {
                return AnyView(
                    self.frame(maxHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    self.frame(maxHeight: CGFloat(height))
                )
            } else {
                return AnyView(
                    self
                )
            }
            
        case let .idealWidth(stateId, widthId, width):
            if let width = findDoubleValue(id: widthId, state: state.value) {
                return AnyView(
                    self.frame(idealWidth: CGFloat(width))
                )
            } else if let width = width {
                return AnyView(
                    self.frame(idealWidth: CGFloat(width))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .idealHeight(stateId, heightId, height):
            if let height = findDoubleValue(id: heightId, state: state.value) {
                return AnyView(
                    self.frame(idealHeight: CGFloat(height))
                )
            } else if let height = height {
                return AnyView(
                    self.frame(idealHeight: CGFloat(height))
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .alignment(stateId, alignmentId, alignment):
            if let alignmentString = findStringValue(id: alignmentId, state: state.value), let alignment = ZStackAlignment(rawValue: alignmentString) {
                return AnyView(
                    self.frame(alignment: alignment.render)
                )
            } else if let alignment = alignment {
                return AnyView(
                    self.frame(alignment: alignment.render)
                )
            } else {
                return AnyView(
                    self
                )
            }
        case let .padding(stateId, edgeSetId, lengthId, edgeSet, length):
            if let id = findStringValue(id: edgeSetId, state: state.value), let edgeSet = InjectedEdgeSet(rawValue: id) {
                return AnyView(
                    self.padding(edgeSet.render, CGFloat(findDoubleValue(id: lengthId, state: state.value) ?? 10))
                )
            } else if let edgeSet = edgeSet {
                return AnyView(
                    self.padding(edgeSet.render, CGFloat(length ?? 10))
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
}
