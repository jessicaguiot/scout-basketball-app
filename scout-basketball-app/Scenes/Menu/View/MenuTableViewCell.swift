//
//  MenuTableViewCell.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 10/02/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell, ViewCode {
    
    static let reuseIdentifier = "MenuTableViewCell"
    
    let customBorderView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .actionColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    let screensNameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
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
        self.selectionStyle = .none
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(customBorderView)
        customBorderView.addSubview(screensNameLabel)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            customBorderView.heightAnchor.constraint(equalToConstant: 60),
            customBorderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            customBorderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            customBorderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            screensNameLabel.centerYAnchor.constraint(equalTo: customBorderView.centerYAnchor),
            screensNameLabel.leadingAnchor.constraint(equalTo: customBorderView.leadingAnchor, constant: 10),
            screensNameLabel.trailingAnchor.constraint(equalTo: customBorderView.trailingAnchor, constant: -10),
            screensNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
