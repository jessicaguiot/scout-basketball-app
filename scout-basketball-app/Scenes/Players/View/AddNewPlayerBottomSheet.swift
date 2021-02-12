//
//  AddNewPlayerBottomSheet.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//

import UIKit

class AddNewPlayerBottomSheet: UIView, ViewCode {
    
    lazy var pickerView: UIPickerView = {
        
        let pickerView = UIPickerView()
        pickerView.delegate     = self
        pickerView.dataSource   = self
        pickerView.backgroundColor = .white
        return pickerView
    }()
    
    lazy var playerBottomSheet: UIView = {
        
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
    
    let playerNameTextField: FloatingLabelInput = {
        let textField = FloatingLabelInput()
        textField._placeholder = "Nome"
        textField.placeholder = "Nome"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    let playerNumberTextField: FloatingLabelInput = {
        let textField = FloatingLabelInput()
        textField._placeholder = "Numeração"
        textField.placeholder = "Numeração"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        //textField.keyboardType = .numberPad
        return textField
    }()
    
    let playerPositionTextField: FloatingLabelInput = {
        
        let textField = FloatingLabelInput()
        textField._placeholder = "Posição"
        textField.placeholder = "Posição"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    
    
    weak var bottomSheetHeightAnchorConstraint: NSLayoutConstraint?
    weak var bottomSheetHeightAnchorConstraintWithKeyboard: NSLayoutConstraint?
    
    let bottomSheetHeightAnchor: CGFloat = 280
    let positionsList = ["ALA", "PIVO", "ARMADORA"]
    let items = ["Titular", "Reserva"]
    
    var segmentedControl = UISegmentedControl()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = .clear
        setupPlayerBottomSheetHeightConstraint()
        setupTapGestureRecognizer()
        setupPickerView()
        setupSegmentedControl()
    }
    
    func setupPickerView() {
        
        self.playerPositionTextField.inputView = pickerView
        dismissPickerView()
    }
    
    func setupSegmentedControl() {
        
        segmentedControl = UISegmentedControl(items: items)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .lightGray
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViewElementsHierarchy() {
        
        insertSubview(blurView, at: 0)
        addSubview(playerBottomSheet)
        addSubview(doneButton)
        addSubview(cancelButton)
        addSubview(playerNameTextField)
        addSubview(playerNumberTextField)
        addSubview(playerPositionTextField)
        addSubview(segmentedControl)
    }
    
    private func setupPlayerBottomSheetHeightConstraint() {
        
        bottomSheetHeightAnchorConstraint  = playerBottomSheet.heightAnchor.constraint(equalToConstant: bottomSheetHeightAnchor)
        bottomSheetHeightAnchorConstraint?.isActive = true
    }
    
    public func setBottomSheetUp() {
        
        bottomSheetHeightAnchorConstraint?.constant = bottomSheetHeightAnchor+346
        blurView.isUserInteractionEnabled = false
    }
    
    public func setBottomSheetDown() {
        
        bottomSheetHeightAnchorConstraint?.constant = bottomSheetHeightAnchor
        blurView.isUserInteractionEnabled = true
    }
    
    private func setupTapGestureRecognizer() {
        
        let tapDismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapDismissGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tapDismissGesture)
    }
    
    @objc func dismissKeyboard() {
        
        self.endEditing(true)
    }
    
    func setupViewElementsConstraints() {
        
        NSLayoutConstraint.activate([
            
            playerBottomSheet.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            playerBottomSheet.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            playerBottomSheet.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            
            cancelButton.leadingAnchor.constraint(equalTo: playerBottomSheet.leadingAnchor, constant: 20),
            cancelButton.topAnchor.constraint(equalTo: playerBottomSheet.topAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 80),
            cancelButton.heightAnchor.constraint(equalToConstant: 5),
            
            doneButton.trailingAnchor.constraint(equalTo: playerBottomSheet.trailingAnchor, constant: -15),
            doneButton.topAnchor.constraint(equalTo: playerBottomSheet.topAnchor, constant: 20),
            doneButton.widthAnchor.constraint(equalToConstant: 80),
            doneButton.heightAnchor.constraint(equalToConstant: 5),
            
            playerNameTextField.topAnchor.constraint(equalTo: playerBottomSheet.topAnchor, constant: 70),
            playerNameTextField.leadingAnchor.constraint(equalTo: playerBottomSheet.leadingAnchor, constant: 15),
            playerNameTextField.trailingAnchor.constraint(equalTo: playerBottomSheet.trailingAnchor, constant: -15),
            playerNameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            playerNumberTextField.topAnchor.constraint(equalTo: playerNameTextField.bottomAnchor, constant: 23),
            playerNumberTextField.leadingAnchor.constraint(equalTo: playerBottomSheet.leadingAnchor, constant: 15),
            playerNumberTextField.trailingAnchor.constraint(equalTo: playerBottomSheet.trailingAnchor, constant: -150),
            playerNumberTextField.heightAnchor.constraint(equalToConstant: 35),
            
            playerPositionTextField.topAnchor.constraint(equalTo: playerNameTextField.bottomAnchor, constant: 23),
            playerPositionTextField.leadingAnchor.constraint(equalTo: playerNumberTextField.trailingAnchor, constant: 0),
            playerPositionTextField.trailingAnchor.constraint(equalTo: playerBottomSheet.trailingAnchor, constant: -15),
            playerPositionTextField.heightAnchor.constraint(equalToConstant: 35),
            
            segmentedControl.topAnchor.constraint(equalTo: playerPositionTextField.bottomAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: playerBottomSheet.leadingAnchor, constant: 15),
            segmentedControl.trailingAnchor.constraint(equalTo: playerBottomSheet.trailingAnchor, constant: -15),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension AddNewPlayerBottomSheet: UIPickerViewDataSource, UIPickerViewDelegate {

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return positionsList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedPosition = positionsList[row]
        playerPositionTextField.text = selectedPosition
        
        pickerView.reloadAllComponents()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label:UILabel
    
        if let font = view as? UILabel {
            label = font
        } else {
            label = UILabel()
        }
        
        if pickerView.selectedRow(inComponent: component) == row {
            
            label.textColor = .systemBlue
        } else {
            
            label.textColor = .black
        }
            
        label.font                          = UIFont.systemFont(ofSize: 12)
        label.textAlignment                 = .center
        label.text                          = positionsList[row]
        
        return label
    }
    
    func dismissPickerView() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor            = .white
        toolBar.tintColor               = .systemBlue
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismiss))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.playerPositionTextField.inputAccessoryView = toolBar
    }
    
    @objc func dismiss() {
        
        self.endEditing(true)
    }
}
   
