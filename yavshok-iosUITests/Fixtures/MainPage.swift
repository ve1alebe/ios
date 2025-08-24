//
//  MainPage.swift
//  yavshok-ios
//
//  Created by ve1alebe on 24.08.2025.
//

import XCTest

final class MainPage {
    
    private let app: XCUIApplication
    
    private var titleLabel: XCUIElement { app.staticTexts["mainTitle"] }
    private var emailInput: XCUIElement { app.textFields["emailInput"] }
    private var checkButton: XCUIElement { app.buttons["checkButton"] }
    private var navigationButton: XCUIElement { app.buttons["navigationButton"] }
    
    private var successText: XCUIElement { app.staticTexts["successText"] }
    private var failureText: XCUIElement { app.staticTexts["failureText"] }
    private var errorMessage: XCUIElement { app.staticTexts["errorMessage"] }

    init(app: XCUIApplication) { self.app = app }

    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> Self {
        let isVisible = titleLabel.waitForExistence(timeout: timeout)
        XCTAssertTrue(isVisible, "Заголовок главной страницы не отображается")
        return self
    }

    @discardableResult
    func assertSuccessState(timeout: TimeInterval = 5) -> Self {
        let successVisible = successText.waitForExistence(timeout: timeout)
        XCTAssertTrue(successVisible, "Текст с успешной ШОКовостью не отображен")
        return self
    }

    @discardableResult
    func assertFailureState(timeout: TimeInterval = 5) -> Self {
        let failureVisible = failureText.waitForExistence(timeout: timeout)
        XCTAssertTrue(failureVisible, "Текст ошибки не отображен")
        return self
    }

    @discardableResult
    func assertErrorShown(timeout: TimeInterval = 5) -> Self {
        let errorVisible = errorMessage.waitForExistence(timeout: timeout)
        XCTAssertTrue(errorVisible, "Сообщение об ошибке не показано")
        return self
    }

    @discardableResult
    func enterEmail(_ email: String) -> Self {
        guard emailInput.exists else {
            XCTFail("Поле для email недоступно")
            return self
        }
        emailInput.tap()
        emailInput.typeText(email)
        return self
    }

    @discardableResult
    func tapCheckButton() -> Self {
        guard checkButton.exists else {
            XCTFail("Кнопка проверки недоступна")
            return self
        }
        checkButton.tap()
        return self
    }

    @discardableResult
    func tapNavigationButton() -> Self {
        guard navigationButton.exists else {
            XCTFail("Кнопка перехода отсутствует")
            return self
        }
        navigationButton.tap()
        return self
    }
}
