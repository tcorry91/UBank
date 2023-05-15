//
//  UBankUITests.swift
//  UBankUITests
//
//  Created by Corry Timothy on 7/5/2023.
//

import XCTest


final class UBankUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }


    ////below test is dependent on the simulator keyboard settings.
    ////if the sim keyboard is not properly enabled the test will fail
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        let key2 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        let key3 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        let key4 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        let key5 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        let key6 = app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key6.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Log In"]/*[[".buttons[\"Log In\"].staticTexts[\"Log In\"]",".staticTexts[\"Log In\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Saving")/*[[".cells.containing(.staticText, identifier:\"$25,238.24\")",".cells.containing(.staticText, identifier:\"$8,237.70\")",".cells.containing(.staticText, identifier:\"98765\")",".cells.containing(.staticText, identifier:\"Saving\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        let backButton = app.navigationBars["UBank.TransactionsVC"].buttons["Back"]
        backButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Spending")/*[[".cells.containing(.staticText, identifier:\"$500.01\")",".cells.containing(.staticText, identifier:\"112645\")",".cells.containing(.staticText, identifier:\"Spending\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        backButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Bills")/*[[".cells.containing(.staticText, identifier:\"$-469.01\")",".cells.containing(.staticText, identifier:\"$1,500.00\")",".cells.containing(.staticText, identifier:\"135790\")",".cells.containing(.staticText, identifier:\"Bills\")"],[[[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        backButton.tap()

    
              
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
