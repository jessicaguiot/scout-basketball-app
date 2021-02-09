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
    
    var startViewController: StartViewController
    
    init() {
        
        let startViewModel = StartViewModel()
        startViewController = StartViewController(viewModel: startViewModel)
        startViewController.startCoordinator = self
    }
}
