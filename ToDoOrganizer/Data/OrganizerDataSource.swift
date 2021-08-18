//
//  OrganizerDataSource.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerDataSource: NSObject, UITableViewDataSource {

    private var reuseIdentifier: String!
    private var items: [OrganizerItem]!

    init(reuseIdentifier: String, items: [OrganizerItem]) {
        self.reuseIdentifier = reuseIdentifier
        self.items =  items
    }

    func refreshData(items: [OrganizerItem]) {
        self.items =  items
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.selectionStyle = .none
        return cell
    }
}
