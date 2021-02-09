//
//  MenuCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import Foundation

class MenuCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return menuViewController
    }
    
    var menuViewController: MenuViewController
    
    init() {
        
        let menuViewModel = MenuViewModel()
        menuViewController = MenuViewController(viewModel: menuViewModel)
        menuViewController.menuCoordinator = self
    }
}
