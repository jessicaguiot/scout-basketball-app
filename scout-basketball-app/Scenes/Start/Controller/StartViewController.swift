//
//  StartViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class StartViewController: UIViewController {
    
    var startViewModel: StartViewModel
    var startCoordinator: StartCoordinator?
    
    let startContentView = StartView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = startContentView
        self.navigationController?.navigationBar.isHidden = true
    }
    
    init(viewModel: StartViewModel) {
        
        self.startViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
