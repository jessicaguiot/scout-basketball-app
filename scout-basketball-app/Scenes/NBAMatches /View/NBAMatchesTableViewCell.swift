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
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "SF Pro Text", size: 14)
        return label
    }()
    
    let awayTeamLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "SF Pro Text", size: 14)
        return label
    }()
    
    let matchDateLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "SF Pro Text", size: 16)
        return label
    }()
    
    let matchTimeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
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
        
        self.backgroundColor = .black
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(timePlayView)
        addSubview(homeTeamLabel)
        addSubview(awayTeamLabel)
        addSubview(matchTimeLabel)
        addSubview(homeTeamLogoImageView)
        addSubview(awayTeamLogoImageView)
    }
    
    let timePlayView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .actionColor
        return view
    }()
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            timePlayView.widthAnchor.constraint(equalToConstant: 90),
            timePlayView.heightAnchor.constraint(equalToConstant: 30),
            timePlayView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            timePlayView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            homeTeamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamLogoImageView.bottomAnchor, constant: 5),
            homeTeamLabel.trailingAnchor.constraint(equalTo: timePlayView.leadingAnchor, constant: -15),
            homeTeamLabel.heightAnchor.constraint(equalToConstant: 60),
            
            awayTeamLabel.leadingAnchor.constraint(equalTo: timePlayView.trailingAnchor, constant: 15),
            awayTeamLabel.topAnchor.constraint(equalTo: awayTeamLogoImageView.bottomAnchor, constant: 5),
            awayTeamLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            awayTeamLabel.heightAnchor.constraint(equalToConstant: 60),
            
            matchTimeLabel.centerYAnchor.constraint(equalTo: timePlayView.centerYAnchor),
            matchTimeLabel.trailingAnchor.constraint(equalTo: timePlayView.trailingAnchor, constant: -15),
            matchTimeLabel.leadingAnchor.constraint(equalTo: timePlayView.leadingAnchor, constant: 15),
            matchTimeLabel.heightAnchor.constraint(equalToConstant: 35),
            
            homeTeamLogoImageView.heightAnchor.constraint(equalToConstant: 45),
            homeTeamLogoImageView.widthAnchor.constraint(equalToConstant: 45),
            homeTeamLogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            homeTeamLogoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            
            awayTeamLogoImageView.heightAnchor.constraint(equalToConstant: 45),
            awayTeamLogoImageView.widthAnchor.constraint(equalToConstant: 45),
            awayTeamLogoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            awayTeamLogoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }

}
