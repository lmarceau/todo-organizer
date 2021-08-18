//
//  OrganizerTableView.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerTableView: UITableView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tableFooterView = UIView()
        contentInset = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
    }
}
