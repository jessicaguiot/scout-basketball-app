//
//  MenuTableViewCell.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 10/02/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell, ViewCode {
    
    static let reuseIdentifier = "MenuTableViewCell"
    
    let screensNameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
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
        let rightArrow = UIImage(systemName: "chevron.right")
        self.accessoryView = UIImageView(image: rightArrow)
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(screensNameLabel)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            screensNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            screensNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            screensNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            screensNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
