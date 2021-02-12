//
//  NBBMatchesCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBAMatchesCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return nbaMatchesViewController
    }
    
    var nbaMatchesViewController: NBAMatchesViewController
    
    init() {
        
        let nbaMatchesViewModel = NBAMatchesViewModel()
        nbaMatchesViewController = NBAMatchesViewController(viewModel: nbaMatchesViewModel)
        nbaMatchesViewController.nbaMatchesCoordinator = self
    }
}
