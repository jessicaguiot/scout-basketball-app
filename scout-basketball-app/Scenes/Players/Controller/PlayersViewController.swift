//
//  PlayersViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 09/02/21.
//

import UIKit

class PlayersViewController: UIViewController {

    var playersViewModel: PlayersViewModel
    var playersCoordinator: PlayersCoordinator?
    
    var playersContentView = PlayersView()
    let addPlayersViewController = AddPlayersViewController()
    
    var isFirstString = true
    
    var players: [Player]? {
        
        didSet {
            playersContentView.playersTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        
    }
    
    init(viewModel: PlayersViewModel) {
        
        self.playersViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        self.view = playersContentView
        fetchPlayers()
        self.setupNavigationBar(titleScreen: "Jogadores")
        setAddNewPlayerNavButton()
        setupPlayersTableViewDelegate()
        setupSegmentedControl()
        setupSaveButton()
    }
    
    func fetchPlayers() {
        
        players = playersViewModel.fetchAllPlayers()
        playersContentView.playersTableView.reloadData()
    }
    
    private func setAddNewPlayerNavButton() {
        
        let addNewPlayerButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddNewPlayerModal))
        self.navigationItem.rightBarButtonItem = addNewPlayerButton
    }
    
    private func setupSegmentedControl() {
        
        addPlayersViewController.playersBottomSheetContentView.segmentedControl.addTarget(self, action: #selector(getFirstString(sender:)), for: .valueChanged)
    }
    
    private func setupSaveButton() {
        
        addPlayersViewController.playersBottomSheetContentView.doneButton.addTarget(self, action: #selector(createNewPlayer), for: .touchUpInside)
    }
    
    @objc func showAddNewPlayerModal() {
        
        addPlayersViewController.modalPresentationStyle = .overCurrentContext
        self.present(addPlayersViewController, animated: true, completion: nil)
        addPlayersViewController.presentPlayerBlurView(true)
    }
    
    @objc func getFirstString(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            isFirstString = true
        default:
            isFirstString = false
        }
    }
    
    @objc func createNewPlayer() {
    
        guard let name = addPlayersViewController.playersBottomSheetContentView.playerNameTextField.text else { return }
        
        guard let numeration = Int64(addPlayersViewController.playersBottomSheetContentView.playerNumberTextField.text ?? "0") else { return }
        print(numeration)
        
        guard let position = addPlayersViewController.playersBottomSheetContentView.playerPositionTextField.text else
            { return }
        
        print(position)
        
        print(isFirstString)
        
        if playersViewModel.createPlayer(name: name, isFirstString: isFirstString, numeration: Int(numeration), position: position) != nil{
            fetchPlayers()
            print("SUCESS SAVING")
        }
        
        addPlayersViewController.hidePlayerBottomSheet()
    }
}

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupPlayersTableViewDelegate() {
        
        playersContentView.playersTableView.delegate = self
        playersContentView.playersTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayersTableViewCell.reuseIdentifier) as? PlayersTableViewCell else {
            return PlayersTableViewCell()
        }
        
        let player = players?[indexPath.row]
        
        cell.playerNameLabel.text = player?.name
        cell.playerNumberLabel.text = String(player?.numeration ?? 0)
        
        return cell
    }
}
