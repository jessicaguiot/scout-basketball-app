//
//  MacthesCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MatchesCoordinator:  Coordinator {
    
    var rootViewController: UIViewController {
        return matchesViewController
    }
    
    var matchesViewController: MatchesViewController
    
    init() {
        
        let matchesViewModel = MatchesViewModel()
        matchesViewController = MatchesViewController(viewModel: matchesViewModel)
        matchesViewController.matchesCoordinator = self
    }
    
}
