//
//  StartViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class StartViewController: UIViewController {
    
    var startViewModel: StartViewModel
    var startCoordinator: StartCoordinator?
    
    let startContentView = StartView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view = startContentView
        self.navigationController?.navigationBar.isHidden = true
        setupContinueButton()
    }
    
    init(viewModel: StartViewModel) {
        
        self.startViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContinueButton() {
        
        startContentView.continueButton.addTarget(self, action: #selector(createNewTime), for: .touchUpInside)
    }
    
    @objc func createNewTime() {
        
        guard let name = startContentView.teamNameTextField.text else { return }
        
        let responseValidation = Validation.shared.validate(values: (ValidationType.alphabeticStringWithSpace, name))
        
        switch responseValidation {
        
        case .sucess :
            
            if startViewModel.createTeam(teamName: name) != nil {
        
                startCoordinator?.showMenuViewController()
            }
        case .failure(_, let message):
            
            print(message.localized())
            startContentView.teamNameTextField.setError(with: message.localized())
        }
    }
}
