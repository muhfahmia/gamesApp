//
//  UIButton.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 10/10/23.
//

import Foundation
import UIKit

protocol ButtonActionDelegate: AnyObject {
    func buttonDidTap(_ button: CustomButton)
}

class CustomButton: UIButton {
    // Delegate to handle button actions
    weak var actionDelegate: ButtonActionDelegate?

    // Enum to represent different button styles
    enum ButtonStyle {
        case primary
        case secondary
        case white
        case danger
    }

    // Store the current button style
    private var style: ButtonStyle = .primary

    // Initializer to set the button's style and target action
    init(style: ButtonStyle, title: String) {
        super.init(frame: .zero)
        self.style = style
        self.setTitle(title, for: .normal)
        self.setHeight(35)
        self.semanticContentAttribute = .forceRightToLeft
        self.isUserInteractionEnabled = true
        applyStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Handle button tap
    @objc private func buttonTapped() {
        actionDelegate?.buttonDidTap(self)
    }

    // Apply button style based on the selected style
    private func applyStyle() {
        switch style {
        case .primary:
            self.backgroundColor = .blue
            self.setTitleColor(.white, for: .normal)
            self.layer.cornerRadius = 8
            self.tintColor = .white
        case .secondary:
            self.backgroundColor = .lightGray
            self.setTitleColor(.black, for: .normal)
            self.layer.cornerRadius = 8
        case .white:
            self.backgroundColor = .white
            self.setTitleColor(.black, for: .normal)
            self.layer.cornerRadius = 8
        case .danger:
            self.backgroundColor = .systemRed
            self.setTitleColor(.white, for: .normal)
            self.layer.cornerRadius = 8
        }
    }
    
    func withSystemIcon(name: String) {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 10
        self.setImage(UIImage(systemName: name), for: .normal)
        self.configuration = config
    }
}
