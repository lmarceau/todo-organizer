//
//  OrganizerViewController.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerViewController: UIViewController, Storyboarded {

    static var storyboardName: String = "OrganizerView"

    @IBOutlet private weak var organizerTextField: UITextField!
    @IBOutlet private weak var organizerTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
