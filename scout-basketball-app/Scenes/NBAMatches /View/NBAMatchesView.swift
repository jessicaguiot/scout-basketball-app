//
//  NBBMatchesView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBAMatchesView: UIView, ViewCode {
    
    let nbaMatchesTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        setupNBBMatchesTableView()
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(nbaMatchesTableView)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            nbaMatchesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            nbaMatchesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            nbaMatchesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            nbaMatchesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNBBMatchesTableView() {
        
        nbaMatchesTableView.register(NBAMatchesTableViewCell.self, forCellReuseIdentifier: NBAMatchesTableViewCell.reuseIdentifier)
    }
}

