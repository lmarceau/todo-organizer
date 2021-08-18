//
//  OrganizerTextFieldTests.swift
//  ToDoOrganizerTests
//
//  Created by Laurie Marceau on 2021-08-17.
//

import XCTest

@testable import ToDoOrganizer

class OrganizerTextFieldTests: XCTestCase {

    private var textField: OrganizerTextField!
    private var delegateTextField: OrganizerTextFieldDelegate!

    override func setUp() {
        super.setUp()
        self.delegateTextField = OrganizerTextFieldDelegate()
        self.textField = OrganizerTextField()
        let viewModel = OrganizerTextFieldViewModel(
            keyboardType: .default,
            textEntryPlaceholder: "",
            textEntryA11yId: "",
            textEntryA11yLabel: ""
        )

        textField.configure(viewModel: viewModel, delegate: delegateTextField)
    }

    override func tearDown() {
        super.tearDown()
        self.textField = nil
        self.delegateTextField = nil
    }

    func test_textFieldInit_notValidatedText() {
        XCTAssertEqual(textField.text, "")
        XCTAssertNil(textField.getValidatedText())
    }

    func test_textFieldHasText_validatedTextIsPresent() {
        let testText = "Some text"
        textField.text = testText

        let text = textField.getValidatedText()
        XCTAssertNotNil(text)
        XCTAssertEqual(text, testText)
    }

    func test_textNotInRange_shouldNotChange() throws {
        let range = NSRange(location: 1, length: 0)
        let shouldChange = delegateTextField.textField(textField,
                                                       shouldChangeCharactersIn: range,
                                                       replacementString: "")
        XCTAssertFalse(shouldChange)
    }

    func test_textShortThanMax_shouldChange() throws {
        let testText = "123456789"
        textField.text = testText
        let range = NSRange(location: 8, length: 1)
        let shouldChange = delegateTextField.textField(textField,
                                                       shouldChangeCharactersIn: range,
                                                       replacementString: "1")
        XCTAssertTrue(shouldChange)
    }

    func test_textLongerThanMax_shouldChange() throws {
        let testText = "123456789123456789123456789123456789123456789123456789"
        textField.text = testText
        let range = NSRange(location: 8, length: 1)
        let shouldChange = delegateTextField.textField(textField,
                                                       shouldChangeCharactersIn: range,
                                                       replacementString: "1")
        XCTAssertFalse(shouldChange)
    }
}
