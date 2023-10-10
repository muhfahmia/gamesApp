//
//  FavoriteViewController.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 10/10/23.
//

import Foundation
import UIKit

protocol FavoriteViewProtocol {
    var favoritePresenter: FavoritePresenterProtocol? { get set }
    func updateSuccessGame(with games: [GameModel])
}

class FavoriteViewController: UIViewController, UICollectionViewDelegate {
    
    enum SectionLayoutFavo: Int, CaseIterable {
        case gameFavo
    }
    
    var customCollectionLayout = UICollectionViewFlowLayout()
    var favoCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var gameFavoDataSource: UICollectionViewDiffableDataSource<SectionLayoutFavo, GameModel>!
    var gameFavoDataSnapshot = NSDiffableDataSourceSnapshot<SectionLayoutFavo, GameModel>()
    
    var favoritePresenter: FavoritePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorite"
        setupCollectionView()
        setupCollectionViewDataSource()
        setupCollectionCell()
        
        favoritePresenter?.getGameFavorite()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritePresenter?.getGameFavorite()
    }
    
    func setupCollectionView() {
        self.customCollectionLayout.customPadding(padding: 10, width: view.bounds.width, height: view.bounds.height/4, grid: 2)
        favoCollectionView.collectionViewLayout = self.customCollectionLayout
        favoCollectionView.delegate = self
        favoCollectionView.backgroundColor = .lightGrayCustom
        view.addSubview(favoCollectionView)
        favoCollectionView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor)
    }
    
    func setupCollectionCell() {
        favoCollectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.gameCellIdentifier)
    }
    
    func setupCollectionViewDataSource() {
        self.gameFavoDataSource = UICollectionViewDiffableDataSource<SectionLayoutFavo, GameModel>(
            collectionView: self.favoCollectionView,
            cellProvider: { (collectionView, indexPath, game) -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.gameCellIdentifier, for: indexPath) as! GameCell
                cell.configure(with: game)
                return cell
            }
        )
        self.gameFavoDataSnapshot.appendSections([.gameFavo])
    }
    
}

extension FavoriteViewController: FavoriteViewProtocol {
    func updateSuccessGame(with games: [GameModel]) {
        self.gameFavoDataSnapshot.appendItems(games, toSection: .gameFavo)
        self.gameFavoDataSource.apply(self.gameFavoDataSnapshot, animatingDifferences: true)
    }
}
