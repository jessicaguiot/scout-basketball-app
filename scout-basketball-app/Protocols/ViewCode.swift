//
//  ViewCode.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import Foundation

protocol ViewCode {
    
    func setupViewCode()
    func setupView()
    func setupViewElementsHierarchy()
    func setupViewElementsConstraints()
}

extension ViewCode {
    
    func setupViewCode() {
        
        setupView()
        setupViewElementsHierarchy()
        setupViewElementsConstraints()
    }
}
