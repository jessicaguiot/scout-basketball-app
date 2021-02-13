//
//  ExtensionUITextField.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 13/02/21.
//

import UIKit

extension UITextField {
    
    func setupTextField(placeholder: String) {
    
        self.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
        self.tintColor = .white
    }
    
    func setBottomLine() {
        
        self.clearButtonMode = .whileEditing
        
        let bottomLine                                                                                                  = UIView()
        self.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints                                                            = false
        bottomLine.backgroundColor                                                                                      = .black
        
        //setup bottom line constraints
        bottomLine.heightAnchor.constraint(equalToConstant: 1.0).isActive                                               = true
        bottomLine.widthAnchor.constraint(equalToConstant: 270).isActive                                                = true
        bottomLine.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive                                       = true
        bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive                            = true
    }
}
