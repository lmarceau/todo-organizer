//
//  OrganizerViewController.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerViewController: BaseViewController, Storyboarded, CanDismissKeyboard {

    static var storyboardName: String = "OrganizerView"
    var keyboardDismissTapGesture: UIGestureRecognizer?

    private var viewModel: OrganizerViewModel!
    private var dataSource: OrganizerDataSource!

    private let bottomButtonConstraintConstant: CGFloat = 16
    private let textFieldDelegate = OrganizerTextFieldDelegate()

    @IBOutlet private weak var organizerTextField: OrganizerTextField!
    @IBOutlet private weak var organizerTableView: OrganizerTableView!
    @IBOutlet private weak var organizerAddButton: OrganizerRoundedButton!
    @IBOutlet private weak var bottomButtonConstraint: NSLayoutConstraint!

    static func instantiate(withModel viewModel: OrganizerViewModel) -> OrganizerViewController {
        let viewController = OrganizerViewController.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupDataSource()
        setupKeyboardNotification()
    }

    // MARK: Keyboard

    func keyboardNotification(_ notification: Notification) {
        handleButtonHeight(notification: notification)
    }
}

// MARK: Private
private extension OrganizerViewController {

    // MARK: IBAction

    @IBAction func userTouchUpInsideAddButton(_ sender: Any) {
        if let validText = organizerTextField.getValidatedText() {
            viewModel.save(text: validText)
            refreshData()
        }
    }

    // MARK: UI

    func setupUI() {
        title = viewModel.title
        organizerTextField.configure(viewModel: viewModel.textfieldViewModel, delegate: textFieldDelegate)
        organizerAddButton.configure(viewModel: viewModel.buttonViewModel)
    }

    func handleButtonHeight(notification: Notification) {
        guard let keyboardSize = notification.keyboardSize else { return }
        let buttonConstraint = (notification.shouldMoveButtonForKeyboard ? keyboardSize.height : 0) + bottomButtonConstraintConstant
        self.bottomButtonConstraint.constant = buttonConstraint
    }

    // MARK: Data

    func setupDataSource() {
        dataSource = OrganizerDataSource(reuseIdentifier: viewModel.reuseIdentifier,
                                         items: viewModel.items)
        organizerTableView.dataSource = dataSource
    }

    func refreshData() {
        dataSource.refreshData(items: viewModel.items)
        DispatchQueue.main.async {
            self.organizerTableView.reloadData()
        }
    }
}
