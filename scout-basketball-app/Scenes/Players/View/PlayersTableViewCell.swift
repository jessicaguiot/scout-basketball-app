//
//  PlayersTableViewCell.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//

import UIKit

class PlayersTableViewCell: UITableViewCell, ViewCode {
    
    static let reuseIdentifier = "PlayersTableViewCell"
    
    let playerNameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let playerNumberLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .black
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(playerNameLabel)
        addSubview(playerNumberLabel)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            playerNumberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playerNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            playerNumberLabel.heightAnchor.constraint(equalToConstant: 22),
            playerNumberLabel.widthAnchor.constraint(equalToConstant: 30),
            
            playerNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playerNameLabel.leadingAnchor.constraint(equalTo: playerNumberLabel.trailingAnchor, constant: 5),
            playerNameLabel.heightAnchor.constraint(equalToConstant: 22),
            playerNameLabel.widthAnchor.constraint(equalToConstant: 200),
        
        ])
    }
}
