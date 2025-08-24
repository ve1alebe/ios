//
//  LoginPage.swift
//  yavshok-ios
//
//  Created by ve1alebe on 24.08.2025.
//

import XCTest

final class LoginPage {
    
    private let app: XCUIApplication
    
    private var titleLabel: XCUIElement { app.staticTexts["loginTitle"] }
    private var emailField: XCUIElement { app.textFields["emailField"] }
    private var passwordField: XCUIElement { app.secureTextFields["passwordField"] }
    private var loginButton: XCUIElement { app.buttons["loginButton"] }
    private var backButton: XCUIElement { app.buttons["backButton"] }
    private var registerButton: XCUIElement { app.buttons["registerButton"] }
    private var validationError: XCUIElement { app.staticTexts["validationError"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> Self {
        let isVisible = titleLabel.waitForExistence(timeout: timeout)
        XCTAssertTrue(isVisible, "Заголовок экрана входа не отображается")
        return self
    }

    @discardableResult
    func assertValidationError(timeout: TimeInterval = 5) -> Self {
        let errorVisible = validationError.waitForExistence(timeout: timeout)
        XCTAssertTrue(errorVisible, "Ошибка валидации не показана")
        return self
    }

    @discardableResult
    func enterEmail(_ email: String) -> Self {
        guard emailField.exists else {
            XCTFail("Поле email недоступно")
            return self
        }
        emailField.tap()
        emailField.typeText(email)
        return self
    }

    @discardableResult
    func enterPassword(_ password: String) -> Self {
        guard passwordField.exists else {
            XCTFail("Поле пароля отсутствует")
            return self
        }
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }

    @discardableResult
    func tapLoginButton() -> Self {
        guard loginButton.exists else {
            XCTFail("Кнопка входа не найдена")
            return self
        }
        loginButton.tap()
        return self
    }

    @discardableResult
    func tapBackButton() -> Self {
        guard backButton.exists else {
            XCTFail("Кнопка назад недоступна")
            return self
        }
        backButton.tap()
        return self
    }

    @discardableResult
    func tapRegisterButton() -> Self {
        guard registerButton.exists else {
            XCTFail("Кнопка регистрации отсутствует")
            return self
        }
        registerButton.tap()
        return self
    }
}
