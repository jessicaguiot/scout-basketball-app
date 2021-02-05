//
//  NBBMatchesTableViewCell.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBBMatchesTableViewCell: UITableViewCell, ViewCode {
    
    static let reuseIdentifier = "NBBMatchesTableViewCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .blue
    }
    
    func setupViewElementsHierarchy() {
    }
    
    func setupViewElementsConstraints() {
    }

}
