//
//  InjectedView_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/15/23.
//

import Foundation

extension InjectedView {
    
    func systemFont(stateId: String = "", nameId: String = "", description: String = "") -> InjectedView {
        self.addModifer(modifier: .systemFont(stateId: stateId, nameId: nameId, description: description))
    }
    
    func font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil) -> InjectedView {
        self.addModifer(modifier: .font(stateId: stateId, nameId: nameId, sizeId: sizeId, fontName: fontName, fontSize: fontSize))
    }
    func frame(stateId: String = "", widthId: String = "", heightId: String = "", width: Double? = nil, height: Double? = nil) -> InjectedView {
        self.addModifer(modifier: .frame(stateId: stateId, widthId: widthId, heightId: heightId, width: width, height: height))
    }
    
    func cornerRadius(stateId: String = "", valueId: String = "", radius: Double? = nil) -> InjectedView {
        self.addModifer(modifier: .cornerRadius(stateId: stateId, valueId: valueId, radius: radius))
    }
    
    func borderline(stateId: String = "", widthId: String = "", colorId: String = "", width: Double? = nil, colorHex: String? = nil) -> InjectedView {
        self.addModifer(modifier: .borderline(stateId: stateId, widthId: widthId, colorId: colorId, width: width, colorHex: colorHex))
    }
    
    func foregroundColor(stateId: String = "", valueId: String = "", colorHex: String? = nil) -> InjectedView {
        self.addModifer(modifier: .foregroundColor(stateId: stateId, valueId: valueId, colorHex: colorHex))
    }
    
    func background(content: InjectedView, ignoresSafeAreaEdges: InjectedEdgeSet) -> InjectedView {
        self.addModifer(modifier: .background(content: content, ignoresSafeAreaEdges: ignoresSafeAreaEdges))
    }
    
    func fullScreenCover(viewStore: InjectedView, isPresentedKey: String) -> InjectedView {
        self.addModifer(modifier: .fullScreenCover(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
    
    func sheet(viewStore: InjectedView, isPresentedKey: String) -> InjectedView {
        self.addModifer(modifier: .sheet(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
}
