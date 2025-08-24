//
//  EditProfilePage.swift
//  yavshok-ios
//
//  Created by ve1alebe on 24.08.2025.
//

import XCTest

extension XCUIElement {
    func clearAndTypeText(_ text: String) {
        tap()
        guard let currentValue = self.value as? String else {
            typeText(text)
            return
        }
        let deleteSequence = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
        typeText(deleteSequence)
        typeText(text)
    }
}

final class EditProfilePage {
    
    private let app: XCUIApplication
    
    private var nameField: XCUIElement { app.textFields["nameField"] }
    private var saveButton: XCUIElement { app.buttons["saveButton"] }
    private var cancelButton: XCUIElement { app.buttons["cancelButton"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> Self {
        let isVisible = nameField.waitForExistence(timeout: timeout)
        XCTAssertTrue(isVisible, "Поле имени не отображается на странице")
        return self
    }

    @discardableResult
    func enterName(_ newName: String) -> Self {
        guard nameField.exists else {
            XCTFail("Поле для ввода имени недоступно")
            return self
        }
        nameField.tap()
        nameField.clearAndTypeText(newName)
        return self
    }

    @discardableResult
    func tapSaveButton() -> Self {
        guard saveButton.exists else {
            XCTFail("Кнопка сохранения отсутствует")
            return self
        }
        saveButton.tap()
        return self
    }

    @discardableResult
    func tapCancelButton() -> Self {
        guard cancelButton.exists else {
            XCTFail("Кнопка отмены не найдена")
            return self
        }
        cancelButton.tap()
        return self
    }
}
