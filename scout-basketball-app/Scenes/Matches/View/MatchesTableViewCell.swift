//
//  MatchesTableViewCell.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 10/02/21.
//

import UIKit

class MatchesTableViewCell: UITableViewCell, ViewCode {
    
    static let reuseIdentifier = "MatchesTableViewCell"
    
    let userTeamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "UFC"
        label.font = UIFont(name: "SF Pro Text", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let opponentTeamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Unifor"
        label.font = UIFont(name: "SF Pro Text", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalPointsUserTeamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "33"
        label.textAlignment = .right
        label.font = UIFont(name: "SF Pro Text", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalPointsOpponentTeamNameLabel: UILabel = {
        let label = UILabel()
        label.text = "40"
        label.textAlignment = .right
        label.font = UIFont(name: "SF Pro Text", size: 15)
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
        
        self.backgroundColor = .white
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(userTeamNameLabel)
        addSubview(opponentTeamNameLabel)
        addSubview(totalPointsUserTeamNameLabel)
        addSubview(totalPointsOpponentTeamNameLabel)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            userTeamNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userTeamNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            userTeamNameLabel.widthAnchor.constraint(equalToConstant: 80),
            userTeamNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            opponentTeamNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            opponentTeamNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            opponentTeamNameLabel.widthAnchor.constraint(equalToConstant: 80),
            opponentTeamNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            totalPointsUserTeamNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            totalPointsUserTeamNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            totalPointsUserTeamNameLabel.widthAnchor.constraint(equalToConstant: 80),
            totalPointsUserTeamNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            totalPointsOpponentTeamNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            totalPointsOpponentTeamNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            totalPointsOpponentTeamNameLabel.widthAnchor.constraint(equalToConstant: 80),
            totalPointsOpponentTeamNameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
