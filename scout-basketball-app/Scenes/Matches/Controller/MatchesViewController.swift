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
    
    let addNewMatchBottomSheetViewController = AddNewMatchBottomSheetViewController()
    
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
        setAddNewMatchNavButton()
        setupBottomSheetView()
        setupMatchesTableView()
    }
    
    private func setupBottomSheetView() {
        
        addNewMatchBottomSheetViewController.modalPresentationStyle = .overCurrentContext
    }
    
    private func setAddNewMatchNavButton() {
        
        let addNewMatchButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddNewMatchModal))
        self.navigationItem.rightBarButtonItem = addNewMatchButton
    }

    
    @objc func showAddNewMatchModal() {
        
        self.present(addNewMatchBottomSheetViewController, animated: true, completion: nil)
        addNewMatchBottomSheetViewController.presentBlurView(true)
    }

}

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupMatchesTableView() {
        
        matchesContentView.matchesTableView.delegate = self
        matchesContentView.matchesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchesTableViewCell.reuseIdentifier) as? MatchesTableViewCell else {
            return MatchesTableViewCell()
        }
        
        return cell
    }
}
