//
//  RegisterPage.swift
//  yavshok-ios
//
//  Created by ve1alebe on 24.08.2025.
//

import XCTest

final class RegisterPage {
    
    private let app: XCUIApplication
    
    private var titleLabel: XCUIElement { app.staticTexts["registerTitle"] }
    private var emailField: XCUIElement { app.textFields["emailField"] }
    private var passwordField: XCUIElement { app.secureTextFields["passwordField"] }
    private var ageField: XCUIElement { app.textFields["ageField"] }
    private var registerButton: XCUIElement { app.buttons["registerButton"] }
    private var backButton: XCUIElement { app.buttons["backButton"] }
    private var validationError: XCUIElement { app.staticTexts["validationError"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> Self {
        let isVisible = titleLabel.waitForExistence(timeout: timeout)
        XCTAssertTrue(isVisible, "Заголовок регистрации не отображается")
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
    func enterAge(_ age: String) -> Self {
        guard ageField.exists else {
            XCTFail("Поле возраста не найдено")
            return self
        }
        ageField.tap()
        ageField.typeText(age)
        return self
    }

    @discardableResult
    func tapRegisterButton() -> Self {
        guard registerButton.exists else {
            XCTFail("Кнопка регистрации недоступна")
            return self
        }
        registerButton.tap()
        return self
    }

    @discardableResult
    func tapBackButton() -> Self {
        guard backButton.exists else {
            XCTFail("Кнопка назад отсутствует")
            return self
        }
        backButton.tap()
        return self
    }
}
