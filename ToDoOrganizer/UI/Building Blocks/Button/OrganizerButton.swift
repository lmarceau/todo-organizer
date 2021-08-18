//
//  OrganizerButton.swift
//  ToDoOrganizer
//
//  Created by Laurie Marceau on 2021-08-17.
//

import UIKit

@IBDesignable
public class OrganizerRoundedButton: UIButton {

    let fillColor: UIColor = .systemBlue
    let highlightedFillColor: UIColor = .lightGray

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = fillColor
        layer.cornerRadius = 10.0

        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }

    func configure(viewModel: OrganizerRoundedButtonViewModel) {
        accessibilityIdentifier = viewModel.buttonA11yId
        accessibilityLabel = viewModel.buttonA11yLabel
        setTitle(viewModel.title, for: .normal)
    }

    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = highlightedFillColor
            } else {
                self.backgroundColor = fillColor
            }
        }
    }
}
