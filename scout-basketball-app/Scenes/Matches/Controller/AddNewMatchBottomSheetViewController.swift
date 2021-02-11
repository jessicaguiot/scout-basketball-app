//
//  AddNewMatchBottomSheetViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 10/02/21.
//

import UIKit

protocol BottomSheetHandler {
    
    func bottomSheetDismiss()
}

class AddNewMatchBottomSheetViewController: UIViewController {
    
    let matchesBottomSheetContentView = AddNewMatchBottomSheetView()
    var delegate: BottomSheetHandler?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        self.view = matchesBottomSheetContentView
        addTapGestureRecognizer()
        setupCancelButton()
        setupKeybordNotifications()
    }
    
    private func setupCancelButton() {
        
        matchesBottomSheetContentView.cancelButton.addTarget(self, action: #selector(hideBottomSheetViewCancelButton), for: .touchUpInside)
    }
    
    private func addTapGestureRecognizer() {
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideBottomSheetTapGesture))
        matchesBottomSheetContentView.blurView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupKeybordNotifications() {
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideBottomSheetTapGesture() {
        
        hideBottomSheetView()
    }
    
    @objc func hideBottomSheetViewCancelButton() {
        
        hideBottomSheetView()
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
 
        matchesBottomSheetContentView.bottomSheetGoUp()
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        
        matchesBottomSheetContentView.bottomSheetGoDown()
    }
    
    private func hideBottomSheetView() {
        
        dismiss(animated: true) {
            self.delegate?.bottomSheetDismiss()
            self.presentBlurView(false)
        }
    }
    
    public func presentBlurView(_ present: Bool) {
        
        if present {
            
            matchesBottomSheetContentView.blurView.isHidden  = false
            matchesBottomSheetContentView.blurView.isUserInteractionEnabled = true
        } else {
            
            matchesBottomSheetContentView.blurView.isHidden  = true
            matchesBottomSheetContentView.blurView.isUserInteractionEnabled = false
        }
    }
}
