//
//  NBBMatchesViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBAMatchesViewController: UIViewController {
    
    var nbaMatchesViewModel: NBAMatchesViewModel
    var nbaMatchesCoordinator: NBAMatchesCoordinator?
    
    let nbaMatchesContentView = NBAMatchesView()
    
    var dataSource : [NBAMatches] = [] {
        didSet {
            nbaMatchesContentView.nbaMatchesTableView.reloadData()
        }
    }
    
    override func loadView() {
        
        self.view = nbaMatchesContentView
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nbaMatchesContentView.nbaMatchesTableView.delegate = self
        nbaMatchesContentView.nbaMatchesTableView.dataSource = self
    }
    
    init(viewModel: NBAMatchesViewModel) {
        
        self.nbaMatchesViewModel = viewModel
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

extension NBAMatchesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NBAMatchesTableViewCell.reuseIdentifier) as? NBAMatchesTableViewCell else {
                return NBAMatchesTableViewCell()
            }
        
        return cell
    }
}
