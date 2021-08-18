//
//  OrganizerTextFieldDelegate.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerTextFieldDelegate: NSObject, UITextFieldDelegate {

    private var maxNumberOfCharacter: Int

    init(maxNumberOfCharacter: Int = 30) {
        self.maxNumberOfCharacter = maxNumberOfCharacter
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }

        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= maxNumberOfCharacter
    }
}
