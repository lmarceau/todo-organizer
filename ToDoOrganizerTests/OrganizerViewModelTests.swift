//
//  OrganizerViewModelTests.swift
//  ToDoOrganizerTests
//
//  Created by Laurie Marceau on 2021-08-17.
//

import XCTest

@testable import ToDoOrganizer

class OrganizerViewModelTests: XCTestCase {

    func test_viewModel_hasNoItemsAtInit() {
        let sut = OrganizerViewModel()
        XCTAssertEqual(sut.items.count, 0)
    }

    func test_viewModel_canSaveAnItem() {
        let sut = OrganizerViewModel()
        let text = "Hello"
        sut.save(text: text)
        XCTAssertEqual(sut.items.count, 1)
        XCTAssertEqual(sut.items.first?.name, text)
    }
}
