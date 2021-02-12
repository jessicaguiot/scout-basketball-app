//
//  StartView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class StartView: UIView, ViewCode {
    
    let teamNameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textColor = .black
        label.text = "Basquete Scout"
        return label
    }()
    
    let teamNameTextField: FloatingLabelInput = {
        
        let textField = FloatingLabelInput()
        textField._placeholder = "Nome do seu time"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let continueButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let errorMessageLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .white
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(teamNameLabel)
        addSubview(teamNameTextField)
        addSubview(continueButton)
        addSubview(errorMessageLabel)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            teamNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            teamNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 185),
            teamNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            teamNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            teamNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            teamNameTextField.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 50),
            teamNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            continueButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            continueButton.topAnchor.constraint(equalTo: teamNameTextField.bottomAnchor, constant: 40),
            continueButton.heightAnchor.constraint(equalToConstant: 40),
            
            errorMessageLabel.heightAnchor.constraint(equalToConstant: 15),
            errorMessageLabel.topAnchor.constraint(equalTo: teamNameTextField.bottomAnchor, constant: 10),
            errorMessageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            errorMessageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
        ])
    }
}


extension UITextField {
    
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
        bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive                                         = true
    }
}
