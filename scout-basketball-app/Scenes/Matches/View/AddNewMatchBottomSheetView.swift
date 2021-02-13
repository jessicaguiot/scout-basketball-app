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
        view.backgroundColor = .black
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    lazy var matchblurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.frame
        blurView.alpha = 0.85
        blurView.isHidden = true
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()

    
    let opponentTeamTextField: FloatingLabelInput = {
        
        let textField = FloatingLabelInput()
        textField._placeholder = "Nome time oponente"
        textField.setupTextField(placeholder: textField._placeholder ?? "")
        return textField
    }()
    
    let opponentTeamPointsTextField: FloatingLabelInput = {
        
        let textField = FloatingLabelInput()
        textField._placeholder = "Pontuação time oponente"
        textField.setupTextField(placeholder: textField._placeholder ?? "")
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let userTeamPointsTextField: FloatingLabelInput = {
        
        let textField = FloatingLabelInput()
        textField._placeholder = "Pontuação do seu time"
        textField.setupTextField(placeholder: textField._placeholder ?? "")
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let doneButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.actionColor, for: .normal)
        return button
    }()
    
    let cancelButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(.actionColor, for: .normal)
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
        
        insertSubview(matchblurView, at: 0)
        addSubview(bottomSheet)
        addSubview(doneButton)
        addSubview(cancelButton)
        addSubview(opponentTeamTextField)
        addSubview(userTeamPointsTextField)
        addSubview(opponentTeamPointsTextField)
    }
    
    func setupBottomSheetHeightAnchor() {
        
        bottomSheetHeightAnchorConstraint  = bottomSheet.heightAnchor.constraint(equalToConstant: 300)
        bottomSheetHeightAnchorConstraint?.isActive = true
    }
    
    func bottomSheetGoUp(){
        
        bottomSheetHeightAnchorConstraint?.constant = 300+346
        matchblurView.isUserInteractionEnabled = false
    }
    
    func bottomSheetGoDown() {
        
        bottomSheetHeightAnchorConstraint?.constant = 250
        matchblurView.isUserInteractionEnabled = true
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
            
            matchblurView.heightAnchor.constraint(equalTo: self.heightAnchor),
            matchblurView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            cancelButton.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 20),
            cancelButton.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 80),
            cancelButton.heightAnchor.constraint(equalToConstant: 5),
            
            doneButton.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -15),
            doneButton.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 20),
            doneButton.widthAnchor.constraint(equalToConstant: 80),
            doneButton.heightAnchor.constraint(equalToConstant: 5),
            
            opponentTeamTextField.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 15),
            opponentTeamTextField.topAnchor.constraint(equalTo: bottomSheet.topAnchor, constant: 70),
            opponentTeamTextField.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -15),
            opponentTeamTextField.heightAnchor.constraint(equalToConstant: 35),
            
            userTeamPointsTextField.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 15),
            userTeamPointsTextField.topAnchor.constraint(equalTo: opponentTeamTextField.bottomAnchor, constant: 23),
            userTeamPointsTextField.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -15),
            userTeamPointsTextField.heightAnchor.constraint(equalToConstant: 35),
            
            opponentTeamPointsTextField.leadingAnchor.constraint(equalTo: bottomSheet.leadingAnchor, constant: 15),
            opponentTeamPointsTextField.topAnchor.constraint(equalTo: userTeamPointsTextField.bottomAnchor, constant: 23),
            opponentTeamPointsTextField.trailingAnchor.constraint(equalTo: bottomSheet.trailingAnchor, constant: -15),
            opponentTeamPointsTextField.heightAnchor.constraint(equalToConstant: 35)
            
        ])
    }
}
