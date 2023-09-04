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
        case let .text(store):
            let noModifiers = store.modifiers.isEmpty
            XCTAssertTrue(noModifiers && store.textKey == "textKey")
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
        case let .button(store):
            switch store.content {
            case .text(let textStore):
                XCTAssertTrue(store.modifiers.isEmpty && textStore.textKey == "buttonTitle")
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
        case let .vStack(store):
            switch store.content1 {
            case .text(let textStore):
                XCTAssertTrue(store.modifiers.isEmpty && textStore.textKey == "vStackText")
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
        case let .hStack(store):
            switch store.content1 {
            case .text(let textStore):
                XCTAssertTrue(store.modifiers.isEmpty && textStore.textKey == "hStackText")
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
        case let .field(store):
            switch store.content {
            case .text(let textStore):
                XCTAssertTrue(store.modifiers.isEmpty && textStore.textKey == "fieldText")
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
        case let .spacer(store):
            XCTAssertTrue(store.modifiers.isEmpty && store.id == "spacer")
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
        case let .hStack(store):
            switch store.content1 {
            case .text(let textStore):
                XCTAssertTrue(store.modifiers.isEmpty && textStore.textKey == "hStackText")
            default:
                XCTFail("did not render to text viewStore")
            }
        default:
            XCTFail("Did not render a hStack viewStore")
        }
    }
}
