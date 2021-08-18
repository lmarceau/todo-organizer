//
//  String+Localizable.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
