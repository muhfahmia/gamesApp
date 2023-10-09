//
//  UICollectionViewLayout.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation
import UIKit

extension UICollectionViewFlowLayout {
    func customPadding(padding: CGFloat, width: CGFloat, height: CGFloat, grid: CGFloat) {
        let padding: CGFloat = padding // Adjust the padding as needed
        let itemWidth = (width - padding * 3) / grid
        let itemHeight = height
        self.itemSize = CGSize(width: itemWidth, height: itemHeight) // Equal width and height for items
        self.minimumInteritemSpacing = padding
        self.minimumLineSpacing = padding
        self.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}
