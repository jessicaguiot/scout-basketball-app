//
//  MenuView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MenuView: UIView, ViewCode {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        
        self.backgroundColor = .red
    }
    
    func setupViewElementsHierarchy() {
        
    }
    
    func setupViewElementsConstraints() {
        
    }
}
