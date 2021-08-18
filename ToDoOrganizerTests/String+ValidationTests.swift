//
//  String+ValidationTests.swift
//  ToDoOrganizerTests
//
//  Created by Laurie Marceau on 2021-08-17.
//

import XCTest

@testable import ToDoOrganizer

class StringValidationTests: XCTestCase {

    func test_emptyString_notValid() {
        let sut = ""
        XCTAssertFalse(sut.isValid())
    }

    func test_text_isValid() {
        let sut = "abcde"
        XCTAssertTrue(sut.isValid())
    }

    func test_numbers_isValid() {
        let sut = "12345"
        XCTAssertTrue(sut.isValid())
    }

    func test_specialChar_isValid() {
        let sut = "!@#$%^&*()"
        XCTAssertTrue(sut.isValid())
    }

    func test_emojis_isValid() {
        let sut = "🤔"
        XCTAssertTrue(sut.isValid())
    }
}
