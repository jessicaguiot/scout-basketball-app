//
//  NBBMatchesView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBBMatchesView: UIView, ViewCode {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
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
