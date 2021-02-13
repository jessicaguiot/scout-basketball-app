//
//  MatchesViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class MatchesViewController: UIViewController {

    var matchesViewModel: MatchesViewModel
    var matchesCoordinator: MatchesCoordinator?
    
    var matchesContentView = MatchesView()
    
    let addNewMatchBottomSheetViewController = AddNewMatchBottomSheetViewController()
        
    let startViewCoordinator = StartCoordinator()
    
    var matches: [Match]?
    
    var userNameLabel: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }
    
    init(viewModel: MatchesViewModel) {
        
        self.matchesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.view = matchesContentView
        userNameLabel = startViewCoordinator.startViewController.startViewModel.getTeamName()
        self.setupNavigationBar(titleScreen: "Partidas")
        setAddNewMatchNavButton()
        setupBottomSheetView()
        setupMatchesTableView()
        fetchMatches()
        setupSaveButton()
    }
    
    func fetchMatches() {
        
        matches = matchesViewModel.fetchAllPlayers()
        matchesContentView.matchesTableView.reloadData()
    }
    
    private func setupBottomSheetView() {
        
        addNewMatchBottomSheetViewController.modalPresentationStyle = .overCurrentContext
    }
    
    private func setAddNewMatchNavButton() {
        
        let addNewMatchButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddNewMatchModal))
        self.navigationItem.rightBarButtonItem = addNewMatchButton
    }
    
    private func setupSaveButton() {
        
        addNewMatchBottomSheetViewController.matchesBottomSheetContentView.doneButton.addTarget(self, action: #selector(createNewMatch), for: .touchUpInside)
    }
    
    @objc func showAddNewMatchModal() {
        
        self.present(addNewMatchBottomSheetViewController, animated: true, completion: nil)
        addNewMatchBottomSheetViewController.presentBlurView(true)
    }
    
    @objc func createNewMatch() {
        
        guard let opponentName = addNewMatchBottomSheetViewController.matchesBottomSheetContentView.opponentTeamTextField.text else { return }
        
        guard let opponentPoints = Int(addNewMatchBottomSheetViewController.matchesBottomSheetContentView.opponentTeamPointsTextField.text ?? "0") else { return }
        
        guard let userTeamPoints = Int(addNewMatchBottomSheetViewController.matchesBottomSheetContentView.userTeamPointsTextField.text ?? "0") else { return }
        
        let responseValidation = Validation.shared.validate(values: (ValidationType.alphabeticStringWithSpace, opponentName))
        
        switch responseValidation {
        case .sucess:
            if matchesViewModel.createMatch(opponentName: opponentName, opponentPoints: opponentPoints, userPoints: userTeamPoints) != nil {
                
                addNewMatchBottomSheetViewController.matchesBottomSheetContentView.opponentTeamTextField.text = ""
                addNewMatchBottomSheetViewController.matchesBottomSheetContentView.opponentTeamPointsTextField.text = ""
                addNewMatchBottomSheetViewController.matchesBottomSheetContentView.userTeamPointsTextField.text = ""
                
                fetchMatches()
            }
            
            addNewMatchBottomSheetViewController.hideBottomSheetView()
        case .failure(_, let message):
            
            addNewMatchBottomSheetViewController.matchesBottomSheetContentView.opponentTeamTextField.setError(with: message.localized())
        }
    }
}

extension MatchesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupMatchesTableView() {
        
        matchesContentView.matchesTableView.delegate = self
        matchesContentView.matchesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return matches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MatchesTableViewCell.reuseIdentifier) as? MatchesTableViewCell else {
            return MatchesTableViewCell()
        }
        
        let match = matches?[indexPath.row]
        
        cell.opponentTeamNameLabel.text = match?.opponentTeamName
        cell.totalPointsOpponentTeamNameLabel.text = String(match?.opponentPoints ?? 0)
        cell.totalPointsUserTeamNameLabel.text = String(match?.userTeamPoints ?? 0)
        cell.userTeamNameLabel.text = userNameLabel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] (action, view, completionHandler) in
            
            tableView.beginUpdates()
            
            guard let matchToDelete = matches?[indexPath.row] else { return }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            matchesViewModel.deleteMatch(match: matchToDelete)
            
            fetchMatches()
            
            tableView.endUpdates()
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
