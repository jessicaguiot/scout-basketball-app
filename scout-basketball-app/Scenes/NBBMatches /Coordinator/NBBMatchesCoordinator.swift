//
//  NBBMatchesCoordinator.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBBMatchesCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return nbbMatchesViewController
    }
    
    var nbbMatchesViewController: NBBMatchesViewController
    
    init() {
        
        let nbbMatchesViewModel = NBBMatchesViewModel()
        nbbMatchesViewController = NBBMatchesViewController(viewModel: nbbMatchesViewModel)
        nbbMatchesViewController.nbbMatchesCoordinator = self
    }
}
