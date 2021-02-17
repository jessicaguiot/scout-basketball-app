//
//  MenuCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

enum ListScreens {
    
    case matches
    case players
    case nbaMatches
}

class MenuCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        
        return menuViewController
    }
    
    let matchesCoordinator = MatchesCoordinator()
    let playersCoordinator = PlayersCoordinator()
    let nbaMatchesCoordinator = NBAMatchesCoordinator()
    
    var menuViewController: MenuViewController
    
    init() {
        
        let menuViewModel = MenuViewModel()
        menuViewController = MenuViewController(viewModel: menuViewModel)
        menuViewController.menuCoordinator = self
    }
    
    private func showMacthesViewController() {
        
        menuViewController.navigationController?.pushViewController(matchesCoordinator.rootViewController, animated: true)
    }
    
    private func showPlayersViewController() {
        
        menuViewController.navigationController?.pushViewController(playersCoordinator.rootViewController, animated: true)
    }
    
    private func showNBAMatchesViewController() {
        
        menuViewController.navigationController?.pushViewController(nbaMatchesCoordinator.rootViewController, animated: true)
    }
    
    public func showScreen(toShow screen: ListScreens) {
        
        switch screen {
        
        case .matches:
            showMacthesViewController()
        case .players:
            showPlayersViewController()
        case .nbaMatches:
            showNBAMatchesViewController()
        }
    }
}
