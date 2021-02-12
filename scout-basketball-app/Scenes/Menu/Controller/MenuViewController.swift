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
    
    let screensLabels = [
        "Suas partidas",
        "Jogadores",
        "Acompanhe a NBA"
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    init(viewModel: MenuViewModel) {
        
        self.menuViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.view = menuContentView
        self.navigationController?.navigationBar.isHidden = false
        self.setupNavigationBar(titleScreen: "Menu Time")
        setupMenuTableView()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = nil
    }

}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    private func setupMenuTableView() {
        
        menuContentView.menuTableView.delegate = self
        menuContentView.menuTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return screensLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.reuseIdentifier) as? MenuTableViewCell else {
            return MenuTableViewCell()
        }
        
        cell.screensNameLabel.text = screensLabels[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let _ = tableView.cellForRow(at: indexPath) as? MenuTableViewCell {
            
            switch indexPath.row {
            
            case 0:
                menuCoordinator?.showScreen(toShow: .matches)
            case 1:
                menuCoordinator?.showScreen(toShow: .players)
            case 2:
                menuCoordinator?.showScreen(toShow: .nbaMatches)
            default:
                break
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UIViewController  {
    
    func setupNavigationBar(titleScreen: String) {
    
        self.navigationItem.title = titleScreen
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }
}
