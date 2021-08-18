//
//  OrganizerDataSourceTests.swift
//  ToDoOrganizerTests
//
//  Created by Laurie Marceau on 2021-08-17.
//

import XCTest

@testable import ToDoOrganizer

class OrganizerDataSourceTests: XCTestCase {

    private var tableView: UITableView!
    private let reuseIdentifier = "testReuseIdentifier"

    override func setUp() {
        super.setUp()
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func tearDown() {
        super.tearDown()
        tableView = nil
    }

    func test_dataSourceHasNoItems_countIs0() {
        let sut = OrganizerDataSource(reuseIdentifier: reuseIdentifier, items: [])
        let count = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(count, 0)
    }

    func test_dataSourceHasAnItem_countIs1() {
        let sut = OrganizerDataSource(reuseIdentifier: reuseIdentifier, items: [OrganizerItem(name: "")])
        let count = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(count, 1)
    }

    func test_dataSourceRefreshDataWithItems_countIsItemsCount() {
        let sut = OrganizerDataSource(reuseIdentifier: reuseIdentifier, items: [])
        let items = [OrganizerItem(name: ""), OrganizerItem(name: "")]
        sut.refreshData(items: items)
        let count = sut.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(items.count, count)
    }

    func test_dataSourceCellForRowAt_hasName() {
        let name = "name1"
        let sut = OrganizerDataSource(reuseIdentifier: reuseIdentifier,
                                      items: [OrganizerItem(name: name)])
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, name)
    }
}
