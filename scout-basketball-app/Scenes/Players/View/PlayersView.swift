//
//  PlayersView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class PlayersView: UIView, ViewCode {
    
    let playersTableView: UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .white
        registerPlayersTableViewCell()
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(playersTableView)
    }
    
    private func registerPlayersTableViewCell() {
        
        playersTableView.register(PlayersTableViewCell.self, forCellReuseIdentifier: PlayersTableViewCell.reuseIdentifier)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            playersTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            playersTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            playersTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            playersTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
