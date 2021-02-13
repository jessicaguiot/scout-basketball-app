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
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let opponentTeamNameLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let totalPointsUserTeamNameLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let totalPointsOpponentTeamNameLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    let scoreView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .actionColor
        return view
    }()
    
    let separatorView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
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
        
        addSubview(scoreView)
        addSubview(separatorView)
        addSubview(userTeamNameLabel)
        addSubview(opponentTeamNameLabel)
        addSubview(totalPointsUserTeamNameLabel)
        addSubview(totalPointsOpponentTeamNameLabel)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            userTeamNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            userTeamNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            userTeamNameLabel.widthAnchor.constraint(equalToConstant: 120),
            userTeamNameLabel.heightAnchor.constraint(equalToConstant: 80),
            
            opponentTeamNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            opponentTeamNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            opponentTeamNameLabel.widthAnchor.constraint(equalToConstant: 120),
            opponentTeamNameLabel.heightAnchor.constraint(equalToConstant: 80),
            
            scoreView.widthAnchor.constraint(equalToConstant: 90),
            scoreView.heightAnchor.constraint(equalToConstant: 30),
            scoreView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            scoreView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                        
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            separatorView.centerXAnchor.constraint(equalTo: scoreView.centerXAnchor),
            separatorView.topAnchor.constraint(equalTo: scoreView.topAnchor),
            separatorView.bottomAnchor.constraint(equalTo: scoreView.bottomAnchor),
            
            totalPointsUserTeamNameLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            totalPointsUserTeamNameLabel.leadingAnchor.constraint(equalTo: scoreView.leadingAnchor, constant: 10),
            totalPointsUserTeamNameLabel.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: -10),
            totalPointsUserTeamNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            totalPointsOpponentTeamNameLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
            totalPointsOpponentTeamNameLabel.trailingAnchor.constraint(equalTo: scoreView.trailingAnchor, constant: -10),
            totalPointsOpponentTeamNameLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 10),
            totalPointsOpponentTeamNameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
