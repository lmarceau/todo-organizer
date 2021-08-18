//
//  OrganizerViewModel.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

class OrganizerViewModel {
    let title = "organizer.view.title".localized()
    let reuseIdentifier = "OrganizerIdentifier"

    var textfieldViewModel: OrganizerTextFieldViewModel {
        OrganizerTextFieldViewModel(keyboardType: .default,
                                    textEntryPlaceholder: "organizer.textfield.placeholder".localized(),
                                    textEntryA11yId: "organizer.textfield.a11yId".localized(),
                                    textEntryA11yLabel: "organizer.textfield.a11yLabel".localized())
    }

    var buttonViewModel: OrganizerRoundedButtonViewModel {
        OrganizerRoundedButtonViewModel(buttonA11yId: "organizer.button.a11yId".localized(),
                                        buttonA11yLabel: "organizer.button.a11yLabel".localized(),
                                        title: "organizer.button.title".localized())
    }

    var items: [OrganizerItem] = []
    func save(text: String) {
        let newItem = OrganizerItem(name: text)
        items.append(newItem)
    }
}
