//
//  MenuViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuViewModel: MenuViewModel
    var menuCoordinator: MenuCoordinator?
    
    var menuContentView = MenuView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = menuContentView
    }
    
    init(viewModel: MenuViewModel) {
        
        self.menuViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
