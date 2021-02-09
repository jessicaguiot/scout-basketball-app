//
//  PlayersViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class PlayersViewController: UIViewController {

    var playersViewModel: PlayersViewModel
    var playersCoordinator: PlayersCoordinator?
    
    var playersContentView = PlayersView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = playersContentView
    }
    
    init(viewModel: PlayersViewModel) {
        
        self.playersViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

}
