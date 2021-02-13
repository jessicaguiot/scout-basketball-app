//
//  MenuView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MenuView: UIView, ViewCode {
    
    let menuTableView: UITableView = {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.rowHeight = 120
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
        
        self.backgroundColor = .black
        registerMenuTableViewCell()
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(menuTableView)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            menuTableView.heightAnchor.constraint(equalToConstant: 350),
            menuTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            menuTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            menuTableView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func registerMenuTableViewCell() {
        
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
    }
}

