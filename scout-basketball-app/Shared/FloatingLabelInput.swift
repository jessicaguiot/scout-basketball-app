//
//  FloatingLabelInput.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 11/02/21.
//

import UIKit

class FloatingLabelInput: UITextField {
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero)
    var floatingLabelHeight: CGFloat = 14
    
    @IBInspectable
    var _placeholder: String?
    
    @IBInspectable
    var floatingLabelColor: UIColor = .white {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }

    
    @IBInspectable
    var activeBorderColor: UIColor = .actionColor
    
    @IBInspectable
    var floatingLabelFont = UIFont(name: "SF Pro Text", size: 5) {
        
        didSet {
            
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self._placeholder = (self._placeholder != nil) ? self._placeholder : self.placeholder
        
        
        self.attributedPlaceholder = NSAttributedString(string: self._placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.cgColor])
        
        self.placeholder = self._placeholder
        
        
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.textColor = .white
        
        self.addTarget(self, action: #selector(addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(removeFloatingLabel), for: .editingDidEnd)
    }

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    @objc func addFloatingLabel() {
        
        if self.text == "" {
        
            self.floatingLabelColor = .actionColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.layer.backgroundColor = UIColor.black.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: floatingLabel.frame.width+4, height: floatingLabel.frame.height-5)
            self.floatingLabel.textAlignment = .center
           
            self.addSubview(floatingLabel)
            
            self.floatingLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            
            self.placeholder = ""
        }
        
        self.floatingLabelColor = .actionColor
        self.layer.borderColor = self.activeBorderColor.cgColor
        self.bringSubviewToFront(subviews.last!)
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        
        if self.text == "" {
            
            UIView.animate(withDuration: 0.13) {
                
                self.subviews.forEach {
                    
                    $0.removeFromSuperview()
                }
            }
            
            self.placeholder = self._placeholder
        }
        
        self.layer.borderColor = UIColor.white.cgColor
        self.floatingLabelColor = .white
    }
    
    func setError(with message: String) {
        
        UIView.animate(withDuration: 5, animations: {

            self.floatingLabel.text = message.uppercased()
            self.floatingLabel.textColor = .red
            self.layer.borderColor = UIColor.red.cgColor
            self.textColor = .red
            self.tintColor = .red
        }, completion: {  _ in
            
            self.floatingLabelColor = .actionColor
            self.floatingLabel.text = self._placeholder
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.textColor = .white
            self.tintColor = .actionColor
        })
    }
}
