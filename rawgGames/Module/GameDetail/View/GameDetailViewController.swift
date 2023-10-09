//
//  GameDetailViewController.swift
//  rawgGames
//
//  Created by Muhammad Fahmi on 09/10/23.
//

import Foundation
import UIKit

protocol GameDetailViewProtocol {
    var gameDetailPresenter: GameDetailPresenterProtocol? { get set }
}

class GameDetailViewController: UIViewController, GameDetailViewProtocol {
    
    var gameDetailPresenter: GameDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGrayCustom
        print("success")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}
