//
//  PlayersCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class PlayersCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return playersViewController
    }
    
    var playersViewController: PlayersViewController
    
    init() {
        
        let playersViewModel = PlayersViewModel()
        playersViewController = PlayersViewController(viewModel: playersViewModel)
        playersViewController.playersCoordinator = self
    }
}
