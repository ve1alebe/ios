//
//  yavshok_iosUITests.swift
//  yavshok-iosUITests
//
//  Created by ve1alebe on 24.08.2025.
//

import XCTest

final class MainViewUITests: XCTestCase {
    
    lazy var app: XCUIApplication = XCUIApplication()
    lazy var mainView: MainPage = MainPage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        mainView = MainPage(app: app)
    }

    func testCheckEmailShowsSuccessState() {
        mainView
            .assertOnPage()
            .enterEmail("vea@gmail.com")
            .tapCheckButton()
            .assertSuccessState()
    }

    func testCheckEmailShowsFailureState() {
        mainView
            .assertOnPage()
            .enterEmail("hdskjfhskdufhsdfhsjkdfh@gmail.com")
            .tapCheckButton()
            .assertFailureState()
    }

    func testNavigateToLogin() {
        mainView
            .assertOnPage()
            .tapNavigationButton()
    }
}

final class EditProfileUITests: XCTestCase {
    
    lazy var app: XCUIApplication = XCUIApplication()
    lazy var editProfilePage: EditProfilePage = EditProfilePage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        MainPage(app: app).tapNavigationButton()
        LoginPage(app: app)
            .enterEmail("vea@gmail.com")
            .enterPassword("123456")
            .tapLoginButton()
        
        ProfilePage(app: app).tapEditProfile()
        editProfilePage = EditProfilePage(app: app)
    }

    func testEditNameAndSave() {
        editProfilePage
            .assertOnPage()
            .enterName("sdfndsfnsdflnk")
            .tapSaveButton()
        
        ProfilePage(app: app).assertOnPage()
    }

    func testCancelEdit() {
        editProfilePage
            .assertOnPage()
            .tapCancelButton()
        
        ProfilePage(app: app).assertOnPage()
    }
}


final class LoginViewUITests: XCTestCase {
    
    lazy var app: XCUIApplication = XCUIApplication()
    lazy var loginPage: LoginPage = LoginPage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        MainPage(app: app).tapNavigationButton()
        loginPage = LoginPage(app: app)
    }

    func testSuccessfulLogin() {
        loginPage
            .assertOnPage()
            .enterEmail("vea@gmail.com")
            .enterPassword("123456")
            .tapLoginButton()
        
        ProfilePage(app: app).assertOnPage()
    }

    func testValidationError() {
        loginPage
            .assertOnPage()
            .enterEmail("dsjfhjhsdfjk@gmail.com")
            .enterPassword("random_password")
            .tapLoginButton()
            .assertValidationError()
    }

    func testBackNavigation() {
        loginPage
            .assertOnPage()
            .tapBackButton()
        
        MainPage(app: app).assertOnPage()
    }

    func testOpenRegister() {
        loginPage
            .assertOnPage()
            .tapRegisterButton()
        
        RegisterPage(app: app).assertOnPage()
    }
}

final class ProfileViewUITests: XCTestCase {
    
    lazy var app: XCUIApplication = XCUIApplication()
    lazy var profileView: ProfilePage = ProfilePage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        MainPage(app: app).tapNavigationButton()
        LoginPage(app: app)
            .enterEmail("vea@gmail.com")
            .enterPassword("123456")
            .tapLoginButton()
        
        profileView = ProfilePage(app: app)
    }

    func testProfileElements() {
        profileView
            .assertOnPage()
            .assertPhotosLoaded()
    }

    func testEditProfileButton() {
        profileView
            .assertOnPage()
            .tapEditProfile()
    }

    func testLogout() {
        profileView
            .assertOnPage()
            .tapLogout()
        
        MainPage(app: app).assertOnPage()
    }
}

final class RegisterViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    lazy var registerView: RegisterPage = {
        MainPage(app: app).tapNavigationButton()
        LoginPage(app: app).tapRegisterButton()
        return RegisterPage(app: app)
    }()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testSuccessfulRegistration() {
            let randomEmail = "createme\(Int.random(in: 1000...9999))@test.com"
            
            registerView
                .assertOnPage()
                .enterEmail(randomEmail)
                .enterPassword("jdshfljhsdkjfksdfkj")
                .enterAge("20")
                .tapRegisterButton()
            
            ProfilePage(app: app).assertOnPage()
        }

        func testValidationErrorForExistingUser() {
            registerView
                .assertOnPage()
                .enterEmail("abogsysa@yandex.ru")
                .enterPassword("12345678m")
                .enterAge("26")
                .tapRegisterButton()
                .assertValidationError()
        }

        func testBackButtonNavigation() {
            registerView
                .assertOnPage()
                .tapBackButton()
            
            LoginPage(app: app).assertOnPage()
        }
    }

