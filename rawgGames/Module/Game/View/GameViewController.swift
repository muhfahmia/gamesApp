//
//  GameListViewController.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 30/09/23.
//

import Foundation
import UIKit

protocol GameViewProtocol {
    var gamePresenter: GamePresenter? { get set }
    func updateSuccessGame(with games: [GameModel])
}

class GameViewController: UIViewController, GameViewProtocol, UICollectionViewDelegate {
    
    enum SectionLayout: Int, CaseIterable {
        case gameList
    }
    
    var gamePresenter: GamePresenter?
    var customCollectionLayout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var gameDataSource: UICollectionViewDiffableDataSource<SectionLayout, GameModel>!
    var gameDataSnapshot = NSDiffableDataSourceSnapshot<SectionLayout, GameModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Games"
        setupCollectionView()
        setupCollectionViewDataSource()
        setupCollectionCell()

        gamePresenter?.getGame()
    }
    
    func updateSuccessGame(with games: [GameModel]) {
        self.gameDataSnapshot.appendItems(games, toSection: .gameList)
        self.gameDataSource.apply(self.gameDataSnapshot, animatingDifferences: true)
//        print("update game from view: \(games)")
    }
    
    func setupCollectionView() {
        self.customCollectionLayout.customPadding(padding: 10, width: view.bounds.width, height: view.bounds.height/4, grid: 2)
        collectionView.collectionViewLayout = self.customCollectionLayout
        collectionView.delegate = self
        collectionView.backgroundColor = .lightGrayCustom
        view.addSubview(collectionView)
        collectionView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, left: self.view.leftAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor)
    }
    
    func setupCollectionCell() {
        collectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.gameCellIdentifier)
    }
    
    func setupCollectionViewDataSource() {
        self.gameDataSource = UICollectionViewDiffableDataSource<SectionLayout, GameModel>(
            collectionView: self.collectionView,
            cellProvider: { (collectionView, indexPath, game) -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.gameCellIdentifier, for: indexPath) as! GameCell
                cell.configure(with: game)
                return cell
            }
        )
        self.gameDataSnapshot.appendSections([.gameList])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        gamePresenter?.routeToDetailGame(indexPath: indexPath)
    }
}

