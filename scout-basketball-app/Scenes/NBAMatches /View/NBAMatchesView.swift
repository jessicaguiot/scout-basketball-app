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
        tableView.rowHeight = 120
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        return tableView
    }()
    
    let dateLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
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
        setupNBBMatchesTableView()
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(dateLabel)
        addSubview(nbaMatchesTableView)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            nbaMatchesTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
            nbaMatchesTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            nbaMatchesTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            nbaMatchesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNBBMatchesTableView() {
        
        nbaMatchesTableView.register(NBAMatchesTableViewCell.self, forCellReuseIdentifier: NBAMatchesTableViewCell.reuseIdentifier)
    }
}

