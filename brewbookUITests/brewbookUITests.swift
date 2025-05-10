//
//  brewbookUITests.swift
//  brewbookUITests
//
//  Created by Ramsey Khalaf on 10/5/2025.
//

import XCTest

final class brewbookUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it's important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testAddBeanAndCreateRecipe() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Add a new bean
        app.buttons["Add Bean"].tap()
        
        // Fill in bean details
        let nameTextField = app.textFields["Bean Name"]
        nameTextField.tap()
        nameTextField.typeText("Test Bean")
        
        let originTextField = app.textFields["Origin"]
        originTextField.tap()
        originTextField.typeText("Test Origin")
        
        let roasterTextField = app.textFields["Roaster"]
        roasterTextField.tap()
        roasterTextField.typeText("Test Roaster")
        
        // Save the bean
        app.buttons["Save"].tap()
        
        // Wait for the bean to appear in the grid
        let beanCard = app.staticTexts["Test Bean"]
        XCTAssertTrue(beanCard.waitForExistence(timeout: 5))
        
        // Tap the Brew button
        app.buttons["Brew"].tap()
        
        // Set the dose to 12
        let doseTextField = app.textFields["Dose"]
        doseTextField.doubleTap()
        doseTextField.typeText("12")
        
        // Save the recipe
        app.buttons["Save"].tap()
        
        // Switch to Recipes tab
        app.tabBars.buttons["Recipes"].tap()
        
        // Verify the recipe appears in the list
        let recipeDose = app.staticTexts["Dose: 12.0 g"]
        XCTAssertTrue(recipeDose.waitForExistence(timeout: 5))
        
        let recipeBean = app.staticTexts["Bean: Test Bean"]
        XCTAssertTrue(recipeBean.waitForExistence(timeout: 5))
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
