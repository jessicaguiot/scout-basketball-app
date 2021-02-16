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
        label.textColor = .white
        label.text = "Scout Basquete"
        return label
    }()
    
    let teamNameTextField: FloatingLabelInput = {
        
        let textField = FloatingLabelInput()
        textField._placeholder = "Nome do seu time"
        textField.setupTextField(placeholder: textField._placeholder ?? "")
        return textField
    }()
    
    let continueButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(.actionColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.actionColor.cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .black
    }
    
    func setupViewElementsHierarchy() {
        
        addSubview(teamNameLabel)
        addSubview(teamNameTextField)
        addSubview(continueButton)
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
            continueButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

