//
//  AddPlayersViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//

import UIKit

class AddPlayersViewController: UIViewController {
    
    let playersBottomSheetContentView = AddNewPlayerBottomSheet()
    var playersViewModel = PlayersViewModel()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        self.view = playersBottomSheetContentView
        playersBottomSheetContentView.playerNameTextField.delegate = self
        setupTapGestureRecognizer()
        setupPlayersButtons()
        setupKeyboardNotifications()
    }
    
    private func setupTapGestureRecognizer() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideBottomSheetWithTapGesture))
        playersBottomSheetContentView.blurView.addGestureRecognizer(tapGesture)
    }
    
    private func setupPlayersButtons() {
        
        playersBottomSheetContentView.cancelButton.addTarget(self, action: #selector(hideBottomSheetWithCancelButton), for: .touchUpInside)
    }

    
    private func setupKeyboardNotifications() {
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    public func hidePlayerBottomSheet() {
        
        dismiss(animated: true) {
            
            self.presentPlayerBlurView(false)
        }
    }
    
    public func presentPlayerBlurView(_ present: Bool) {
        
        if present {
            
            playersBottomSheetContentView.blurView.isHidden = false
            playersBottomSheetContentView.isUserInteractionEnabled = true
            
        } else {
            
            playersBottomSheetContentView.blurView.isHidden = true
            playersBottomSheetContentView.blurView.isUserInteractionEnabled = false
        }
    }
    
    
    @objc func hideBottomSheetWithTapGesture() {
        
        hidePlayerBottomSheet()
    }
    
    @objc func hideBottomSheetWithCancelButton() {
        
        hidePlayerBottomSheet()
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        
        playersBottomSheetContentView.setBottomSheetUp()
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        
        playersBottomSheetContentView.setBottomSheetDown()
    }
    
   
}

extension AddPlayersViewController:  UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
}
