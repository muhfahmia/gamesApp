//
//  UILabel.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation
import UIKit

class MyLabel: UILabel {
    enum labelType {
            case H1
            case H2
            case H3
            case ParagraphNormal
            case ParagraphSmall
        }
        
    enum labelColor {
        case black
    }
    
    enum labelNumRow: Int, CaseIterable {
        case zero
        case one
        case two
    }
    
    init(labelType: labelType, labelColor: labelColor, labelNumRow: labelNumRow) {
        super.init(frame: .zero)
        setLabelType(type: labelType)
        setLabelColor(color: labelColor)
        self.numberOfLines = labelNumRow.rawValue
        
        self.translatesAutoresizingMaskIntoConstraints = false //For AutoLayout
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelType(type: labelType) {
        switch type {
        case .H1:
            self.font = UIFont.boldSystemFont(ofSize: 24)
        case .H2:
            self.font = UIFont.boldSystemFont(ofSize: 16)
        case .H3:
            self.font = UIFont.boldSystemFont(ofSize: 14)
        case .ParagraphNormal:
            self.font = UIFont.systemFont(ofSize: 14)
        case .ParagraphSmall:
            self.font = UIFont.systemFont(ofSize: 12)
        }
    }
    
    func setLabelColor(color: labelColor) {
        switch color {
        case .black:
            self.textColor = UIColor.black
        }
    }
}
