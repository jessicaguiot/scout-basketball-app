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
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let urlRequest = URL(string: "https://api-basketball.p.rapidapi.com/games?date=2020-02-05")!
        
        NetworkingClient().executeRequest(urlRequest)
    }
    
    init(viewModel: NBBMatchesViewModel) {
        
        self.nbbMatchesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Partidas NBA"
    }
}
