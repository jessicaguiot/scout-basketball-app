//
//  MatchesView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MatchesView: UIView, ViewCode {
    
    let matchesTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 60
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
        registerMatchesTableViewCell()
    }
    
    private func registerMatchesTableViewCell() {
        
        matchesTableView.register(MatchesTableViewCell.self, forCellReuseIdentifier: MatchesTableViewCell.reuseIdentifier)
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(matchesTableView)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            matchesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            matchesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            matchesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            matchesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
