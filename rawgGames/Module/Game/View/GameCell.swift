//
//  Game.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 02/10/23.
//

import Foundation
import UIKit
import SDWebImage

class GameCell: UICollectionViewCell {
    static let gameCellIdentifier = "gameCellID"
    
    var favoPresenter: FavoritePresenterProtocol?
    
    var game: GameModel?
    let gameTitle = MyLabel(labelType: .H2, labelColor: .black, labelNumRow: .zero)
    let gameImage = UIImageView()
    let gameReleased = MyLabel(labelType: .ParagraphSmall, labelColor: .black, labelNumRow: .one)
    let gameRelease = MyLabel(labelType: .ParagraphSmall, labelColor: .black, labelNumRow: .one)
    let gameRating = UIStackView()
    var gameDeleteBtn: CustomButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
        setupUIAutoLayout()
    }
    
    func setupUI() {
        self.addSubview(gameImage)
        self.addSubview(gameTitle)
        self.addSubview(gameReleased)
        self.addSubview(gameRelease)
        self.addSubview(gameRating)
        gameImage.setHeight(100)
    }
    
    func setupDeleteButton() {
        gameDeleteBtn = CustomButton(title: "Delete Favorite", btnStyle: .danger, btnSize: .small)
        gameDeleteBtn?.withSystemIcon(name: "trash.fill")
        self.addSubview(gameDeleteBtn!)
        gameDeleteBtn?.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 15, paddingBottom: 10, paddingRight: 15)
        gameDeleteBtn?.addTarget(self, action: #selector(deleteFavoGame), for: .touchUpInside)
    }
    
    func setupUIAutoLayout() {
        gameImage.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor)
        gameTitle.anchor(top: self.gameImage.bottomAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingRight: 5)
        gameReleased.anchor(top: self.gameTitle.bottomAnchor, left: self.leftAnchor, paddingTop: 10, paddingLeft: 5)
        gameRelease.anchor(top: self.gameTitle.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingRight: 5)
        gameRating.anchor(top: self.gameRelease.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingRight: 5)
    }
    
    func configure(with game: GameModel, deleteBtn: Bool) {
        self.game = game
        if deleteBtn == true {
            setupDeleteButton()
        }
        self.gameTitle.text = game.name
        self.gameImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.gameImage.sd_setImage(with: URL(string: game.backgroundImage))
        self.gameReleased.text = "Release:"
        self.gameRelease.text = game.releaseDate
        _ = setStarRating(view: self.gameRating, rating: game.rating)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Failed load gameCell")
    }
    
    @objc func deleteFavoGame() {
        favoPresenter?.deleteGameFavorite(with: self.game!)
    }
    
}
