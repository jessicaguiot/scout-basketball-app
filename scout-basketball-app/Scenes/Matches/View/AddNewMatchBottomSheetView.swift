//
//  AddNewMatchModalView.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 10/02/21.
//

import UIKit

class AddNewMatchBottomSheetView: UIView, ViewCode {
    
    lazy var bottomSheet: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.frame
        blurView.alpha = 0.85
        blurView.isHidden = true
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    let opponentTeamLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SF Pro Text", size: 12)
        label.text = "Time Oponente"
        return label
    }()
    
    let opponentTeamTextField: UITextField = {
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.placeholder = "Escreva aqui o nome..."
        textField.setBottomLine()
        return textField
    }()
    
    let doneButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let cancelButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    weak var bottomSheetHeightAnchorConstraint: NSLayoutConstraint?
    weak var bottomSheetHeightAnchorConstraintAfterUpdate: NSLayoutConstraint?
    var bottomSheetHeightAnchorConstant: CGFloat = 190
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .clear
        setupBottomSheetHeightAnchor()
        setupDismissKeyboardTapGesture()
    }
    
    func setupViewElementsHierarchy() {
        
        insertSubview(blurView, at: 0)
        addSubview(bottomSheet)
        addSubview(doneButton)
        addSubview(cancelButton)
        addSubview(opponentTeamLabel)
        addSubview(opponentTeamTextField)
    }
    
    func setupBottomSheetHeightAnchor() {
        
        bottomSheetHeightAnchorConstraint  = bottomSheet.heightAnchor.constraint(equalToConstant: 190)
        bottomSheetHeightAnchorConstraint?.isActive = true
    }
    
    func bottomSheetGoUp(){
        
        bottomSheetHeightAnchorConstraint?.constant = 400
        blurView.isUserInteractionEnabled = false
    }
    
    func bottomSheetGoDown() {
        
        bottomSheetHeightAnchorConstraint?.constant = 190
        blurView.isUserInteractionEnabled = true
    }
    
    private func setupDismissKeyboardTapGesture() {
        
        let tapDismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    
        tapDismissGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapDismissGesture)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            bottomSheet.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomSheet.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomSheet.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            cancelButton.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 20),
            cancelButton.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 80),
            cancelButton.heightAnchor.constraint(equalToConstant: 5),
            
            doneButton.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -15),
            doneButton.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 20),
            doneButton.widthAnchor.constraint(equalToConstant: 80),
            doneButton.heightAnchor.constraint(equalToConstant: 5),
            
            opponentTeamLabel.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 15),
            opponentTeamLabel.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 60),
            opponentTeamLabel.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: 15),
            opponentTeamLabel.heightAnchor.constraint(equalToConstant: 20),
            
            opponentTeamTextField.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 15),
            opponentTeamTextField.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 90),
            opponentTeamTextField.widthAnchor.constraint(equalToConstant: 270),
            opponentTeamTextField.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
