//
//  NBBMatchesTableViewCell.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBAMatchesTableViewCell: UITableViewCell, ViewCode {
    
    static let reuseIdentifier = "NBAMatchesTableViewCell"

    let homeTeamLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SF Pro Text", size: 14)
        return label
    }()
    
    let awayTeamLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SF Pro Text", size: 14)
        return label
    }()
    
    let matchDateLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont(name: "SF Pro Text", size: 16)
        return label
    }()
    
    let matchTimeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont(name: "SF Pro Text", size: 16)
        return label
    }()
    
    let homeTeamLogoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let awayTeamLogoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        addSubview(homeTeamLabel)
        addSubview(awayTeamLabel)
        addSubview(matchDateLabel)
        addSubview(matchTimeLabel)
        addSubview(homeTeamLogoImageView)
        addSubview(awayTeamLogoImageView)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            homeTeamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            homeTeamLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            homeTeamLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            homeTeamLabel.heightAnchor.constraint(equalToConstant: 40),
            
            awayTeamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            awayTeamLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            awayTeamLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            awayTeamLabel.heightAnchor.constraint(equalToConstant: 30),
            
            matchDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            matchDateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            matchDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            matchDateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            matchTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            matchTimeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            matchTimeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            matchTimeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            homeTeamLogoImageView.heightAnchor.constraint(equalToConstant: 30),
            homeTeamLogoImageView.widthAnchor.constraint(equalToConstant: 30),
            homeTeamLogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            homeTeamLogoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            awayTeamLogoImageView.heightAnchor.constraint(equalToConstant: 30),
            awayTeamLogoImageView.widthAnchor.constraint(equalToConstant: 30),
            awayTeamLogoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            awayTeamLogoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ])
    }

}
