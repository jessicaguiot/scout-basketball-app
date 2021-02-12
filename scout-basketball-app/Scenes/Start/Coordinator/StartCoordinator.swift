//
//  StartCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class StartCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        
        return startViewController
    }
    
    lazy var menuCoordinator = MenuCoordinator()
    
    var startViewController: StartViewController
    
    
    init() {
        
        let startViewModel = StartViewModel()
        startViewController = StartViewController(viewModel: startViewModel)
        startViewController.startCoordinator = self
    }
    
    public func showMenuViewController() {
        
        startViewController.navigationController?.pushViewController(menuCoordinator.menuViewController, animated: true)
    }
}
