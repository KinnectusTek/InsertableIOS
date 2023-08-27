//
//  InsertableTests.swift
//  InsertableTests
//
//  Created by Blake Osonduagwueki on 8/16/23.
//

import XCTest
@testable import Insertable

final class InsertableTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testPlainTextViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
            
        guard let text = viewStores.viewStores.filter { $0.id == "text"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch text {
        case let .text(_, modifiers, textKey):
            let noModifiers = modifiers.isEmpty
            XCTAssertTrue(noModifiers && textKey == "textKey")
        default:
            XCTFail("Did not render a text viewStore")
        }
    }
    
    func testPlainButtonViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
        guard let button = viewStores.viewStores.filter { $0.id == "button"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch button {
        case let .button(_, modifiers, _, _, _, _, _, _, _, _, _, _, content):
            switch content {
            case .text(_, let modifiers, let textKey):
                XCTAssertTrue(modifiers.isEmpty && textKey == "buttonTitle")
            default:
                XCTFail("did not render to text viewStore")
            }
        default:
            XCTFail("Did not render a button viewStore")
        }
    }
    
    func testPlainVStackViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
        guard let vStack = viewStores.viewStores.filter { $0.id == "vStack"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch vStack {
        case let .vStack(_, modifiers, content, _, _, _, _, _, _, _, _, _):
            switch content {
            case .text(_, let modifiers, let textKey):
                XCTAssertTrue(modifiers.isEmpty && textKey == "vStackText")
            default:
                XCTFail("did not render to text viewStore")
            }
        default:
            XCTFail("Did not render a vStack viewStore")
        }
    }
    
    func testPlainHStackViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
        guard let hStack = viewStores.viewStores.filter { $0.id == "hStack"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch hStack {
        case let .hStack(_, modifiers, content, _, _, _, _, _, _, _, _, _):
            switch content {
            case .text(_, let modifiers, let textKey):
                XCTAssertTrue(modifiers.isEmpty && textKey == "hStackText")
            default:
                XCTFail("did not render to text viewStore")
            }
        default:
            XCTFail("Did not render a hStack viewStore")
        }
    }
    
    func testPlainFieldViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
        guard let field = viewStores.viewStores.filter { $0.id == "field"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch field {
        case let .field(_, _, modifiers, content):
            switch content {
            case .text(_, let modifiers, let textKey):
                XCTAssertTrue(modifiers.isEmpty && textKey == "fieldText")
            default:
                XCTFail("did not render to text viewStore")
            }
        default:
            XCTFail("Did not render a field viewStore")
        }
    }
    
    func testPlainSpacerViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
        guard let spacer = viewStores.viewStores.filter { $0.id == "spacer"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch spacer {
        case let .spacer(id, modifiers):
            XCTAssertTrue(modifiers.isEmpty && id == "spacer")
        default:
            XCTFail("Did not render a spacer viewStore")
        }
    }
    
    func testPlainFullScreenViewStore() {
        let bundle = Bundle(for: InsertableTests.self)
        let viewStores = bundle.decode(ViewStoresContainer.self, from: "TestInsertables.json")
        guard let hStack = viewStores.viewStores.filter { $0.id == "hStack"}.first else {
            XCTFail("did not render viewstore container")
            return
        }
 
        switch hStack {
        case let .hStack(_, modifiers, content, _, _, _, _, _, _, _, _, _):
            switch content {
            case .text(_, let modifiers, let textKey):
                XCTAssertTrue(modifiers.isEmpty && textKey == "hStackText")
            default:
                XCTFail("did not render to text viewStore")
            }
        default:
            XCTFail("Did not render a hStack viewStore")
        }
    }
}
