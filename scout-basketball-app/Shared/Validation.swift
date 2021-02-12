//
//  Validation.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 12/02/21.
//

import Foundation

enum Alert {
    
    case sucess
    case failure
    case error
}

enum Valid {
    
    case sucess
    case failure(Alert, AlertMessages)
}

enum ValidationType {
    
    case alphabeticStringWithSpace
    case number
}

enum RegEx: String {
    
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$"
    case number = "[0-9]{2-4}"
}

enum AlertMessages: String {
    
    case inValidAlphabeticString = "Nome Inválido"
    case inValidNumber = "Número Inválido"
    
    case emptyAlphabeticString = "Campo vazio!"
    case emptyNumber = "Campo vazio! Preencha todos os campos."
    
    func localized() -> String {
        
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        
        for valueToBeChecked in values {
            
            switch valueToBeChecked.type {
            case .alphabeticStringWithSpace:
                
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringWithSpace, .emptyAlphabeticString, .inValidAlphabeticString)) {
                    
                    return tempValue
                }
            case .number:
                
                if let tempValue = isValidString((valueToBeChecked.inputValue, .number, .inValidNumber, .inValidNumber)) {
                    
                    return tempValue
                }
            }
        }
        
        return .sucess
    }
    
    func isValidString(_ input:(text:String, regEx: RegEx, emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        
        if input.text.isEmpty {
            
            return .failure(.error, input.emptyAlert)
            
        } else if isValidRegex(input.text, input.regEx) != true {
            
            return .failure(.error, input.invalidAlert)
        }
        
        return nil
    }
    
    func isValidRegex(_ testString: String, _ regEx: RegEx) -> Bool {
        
        let stringTest = NSPredicate(format: "SELF MATCHES %@", regEx.rawValue)
        let result = stringTest.evaluate(with: testString)
        return result
    }
}
