//
//  NBBMatchesViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBBMatchesViewController: UIViewController {
    
    var nbbMatchesViewModel: NBBMatchesViewModel
    var nbbMatchesCoordinator: NBBMatchesCoordinator?
    
    let nbbMatchesContentView = NBBMatchesView()
    
    override func loadView() {
        
        self.view = nbbMatchesContentView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    init(viewModel: NBBMatchesViewModel) {
        
        self.nbbMatchesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
