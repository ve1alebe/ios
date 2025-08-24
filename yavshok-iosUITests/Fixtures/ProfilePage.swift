//
//  ProfilePage.swift
//  yavshok-ios
//
//  Created by ve1alebe on 24.08.2025.
//

import XCTest

final class ProfilePage {
    
    private let app: XCUIApplication
    
    private var profileImage: XCUIElement { app.images["profileImage"] }
    private var userNameLabel: XCUIElement { app.staticTexts["userName"] }
    private var logoutButton: XCUIElement { app.buttons["logoutButton"] }
    private var editProfileButton: XCUIElement { app.buttons["editProfileButton"] }

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func assertOnPage(timeout: TimeInterval = 5) -> Self {
        let imageExists = profileImage.waitForExistence(timeout: timeout)
        let nameExists = userNameLabel.exists
        
        XCTAssertTrue(imageExists, "Изображение профиля не найдено")
        XCTAssertTrue(nameExists, "Имя пользователя отсутствует")
        return self
    }

    @discardableResult
    func assertPhotosLoaded(count: Int = 4) -> Self {
        for index in 1...count {
            let photoExists = profileImage.exists
            XCTAssertTrue(photoExists, "Фотография #\(index) не загружена")
        }
        return self
    }

    @discardableResult
    func tapLogout() -> Self {
        guard logoutButton.exists else {
            XCTFail("Кнопка выхода недоступна")
            return self
        }
        logoutButton.tap()
        return self
    }

    @discardableResult
    func tapEditProfile() -> Self {
        guard editProfileButton.exists else {
            XCTFail("Кнопка редактирования не найдена")
            return self
        }
        editProfileButton.tap()
        return self
    }
}
