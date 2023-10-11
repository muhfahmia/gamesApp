//
//  GameDetailViewController.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation
import UIKit
import SDWebImage

protocol GameDetailViewProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }
    func updateSuccesGame(with game: GameModel)
    func updateStateFavoriteBtn(with state: String)
}

class GameDetailViewController: UIViewController {
    
    var gameDetailPresenter: GameDetailPresenterProtocol?
    let scrollViewDelegate: MyScrollViewProtocol = MyScrollView()
    
    let gameTitle = MyLabel(labelType: .H1, labelColor: .black, labelNumRow: .zero)
    let gameRelease = MyLabel(labelType: .ParagraphNormal, labelColor: .black, labelNumRow: .one)
    let gameDesc = MyLabel(labelType: .ParagraphNormal, labelColor: .black, labelNumRow: .zero)
    let gameImage = UIImageView()
    let gameRating = UIStackView()
    var gameButton = CustomButton(title: "Add to Favorite", btnStyle: .primary, btnSize: .normal)
    
    private let gameGenre: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        self.title = "Game Detail"
        gameButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        super.viewDidLoad()
        setupView()
        setupAutolayout()
        
        gameDetailPresenter?.getGameDetail()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView() {
        view.addSubview(scrollViewDelegate.scrollView)
        scrollViewDelegate.scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        scrollViewDelegate.contentView.addSubview(gameTitle)
        scrollViewDelegate.contentView.addSubview(gameImage)
        scrollViewDelegate.contentView.addSubview(gameDesc)
        scrollViewDelegate.contentView.addSubview(gameRating)
        scrollViewDelegate.contentView.addSubview(gameGenre)
        scrollViewDelegate.contentView.addSubview(gameRelease)
        scrollViewDelegate.scrollView.addSubview(gameButton)
    }
    
    func setupAutolayout() {
        gameImage.anchor(top: scrollViewDelegate.contentView.topAnchor, left: scrollViewDelegate.contentView.leftAnchor, right: scrollViewDelegate.contentView.rightAnchor)
        gameImage.setHeight(150)
        gameTitle.anchor(top: gameImage.bottomAnchor, left: scrollViewDelegate.contentView.leftAnchor, right: scrollViewDelegate.contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        gameDesc.anchor(top: gameTitle.bottomAnchor, left: scrollViewDelegate.contentView.leftAnchor, right: scrollViewDelegate.contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        gameRelease.anchor(top: gameDesc.bottomAnchor, right: scrollViewDelegate.contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        gameGenre.anchor(top: gameRelease.bottomAnchor, right: scrollViewDelegate.contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        gameRating.anchor(top: gameGenre.bottomAnchor, right: scrollViewDelegate.contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        gameButton.centerX(inView: scrollViewDelegate.scrollView)
        gameButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 25, paddingRight: 25)
        gameButton.isHidden = true
    }
    
    @objc func addToFavorite() {
        gameDetailPresenter?.addGameFavorite()
    }

}

extension GameDetailViewController: GameDetailViewProtocol {
    
    func updateStateFavoriteBtn(with state: String) {
        self.gameButton.withSystemIcon(name: state)
    }
    
    func updateSuccesGame(with game: GameModel) {
        self.gameImage.sd_setImage(with: URL(string: game.backgroundImage)) {
            (image, error, cacheType, imageUrl) in
            self.gameTitle.text = game.name
            self.gameDesc.text = game.description
            self.gameRelease.text = game.releaseDate
            _ = setStarRating(view: self.gameRating, rating: game.rating)
            self.gameButton.isHidden = false
            
            for genre in game.genres {
                let chip = MyChips(text: genre.name)
                self.gameGenre.addArrangedSubview(chip)
            }
            
        }
    }
}
