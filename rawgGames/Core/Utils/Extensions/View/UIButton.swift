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
    
    enum ButtonSize {
        case large
        case normal
        case small
    }

    // Store the current button style
    private var btnStyle: ButtonStyle = .primary
    private var btnSize: ButtonSize = .normal
    private var btnConfig = UIButton.Configuration.plain()
    private var imagePadding = CGFloat(5)
    private var imageSize: CGSize = CGSize(width: 25, height: 25)

    // Initializer to set the button's style and target action
    init(title: String, btnStyle: ButtonStyle, btnSize: ButtonSize) {
        super.init(frame: .zero)
        self.btnStyle = btnStyle
        self.btnSize = btnSize
        
        self.setTitle(title, for: .normal)
        self.isUserInteractionEnabled = true
        
        applyStyle()
        applyStyleSize()
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
        switch btnStyle {
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
    
    private func applyStyleSize() {
        switch btnSize {
        case .large:
            self.setHeight(40)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            self.btnConfig.imagePadding = self.imagePadding
            self.configuration = self.btnConfig
            self.imageSize = CGSize(width: 30, height: 30)
        case .normal:
            self.setHeight(40)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            self.btnConfig.imagePadding = self.imagePadding
            self.imageSize = CGSize(width: 20, height: 20)
        case .small:
            self.setHeight(20)
            self.btnConfig.imagePadding = self.imagePadding
            self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            self.imageSize = CGSize(width: 15, height: 15)
        }
    }
    
    func withSystemIcon(name: String) {
        self.semanticContentAttribute = .forceRightToLeft
        let imageSystem = UIImage(systemName: name)
        if let resizedImage = imageSystem?.resizeImage(image: imageSystem, targetSize: self.imageSize) {
            let imageView = UIImageView(image: resizedImage)
            self.setImage(imageView.image, for: .normal)
        }
    }
    
    func setImagePadding(size: CGFloat) {
        self.imagePadding = size
    }
    
}
