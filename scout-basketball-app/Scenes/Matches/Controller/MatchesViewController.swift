//
//  MatchesViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MatchesViewController: UIViewController {

    var matchesViewModel: MatchesViewModel
    var matchesCoordinator: MatchesCoordinator?
    
    var matchesContentView = MatchesView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    init(viewModel: MatchesViewModel) {
        
        self.matchesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.view = matchesContentView
        self.setupNavigationBar(titleScreen: "Partidas")
    }

}
