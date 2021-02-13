//
//  NBBMatchesViewController.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import UIKit

class NBAMatchesViewController: UIViewController {
    
    var nbaMatchesViewModel: NBAMatchesViewModel
    var nbaMatchesCoordinator: NBAMatchesCoordinator?
    
    let nbaMatchesContentView = NBAMatchesView()
    
    var numberOfMatches: Int?
    var namesHomeTeam: [String]? 
    var namesAwayTeam: [String]?
    var timesMatch: [String]?
    var homeTeamsLogo: [String]?
    var awayTeamsLogo: [String]?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
        setupDataFromViewModel()
    }
    
    init(viewModel: NBAMatchesViewModel) {
        
        self.nbaMatchesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.view = nbaMatchesContentView
        self.setupNavigationBar(titleScreen: "Partidas NBA")
        nbaMatchesContentView.nbaMatchesTableView.delegate = self
        nbaMatchesContentView.nbaMatchesTableView.dataSource = self
        let day = nbaMatchesViewModel.getTodayDate(dateFormat: "dd")
        let month = nbaMatchesViewModel.getTodayDate(dateFormat: "MMMM")
        let weekday = nbaMatchesViewModel.getWeekDay()
        nbaMatchesContentView.dateLabel.text = "\(weekday), \(day) \(month.capitalizingFirstLetter())"
    }
    
    private func setupDataFromViewModel() {
        
        nbaMatchesViewModel.fetchMatchesNBA()
        
        nbaMatchesViewModel.didFinishFetch = {
            
            self.numberOfMatches = self.nbaMatchesViewModel.numberOfMatches
            self.namesHomeTeam = self.nbaMatchesViewModel.nameHomeTeam
            self.namesAwayTeam = self.nbaMatchesViewModel.nameAwayTeam
            self.timesMatch = self.nbaMatchesViewModel.timeMatch
            self.homeTeamsLogo = self.nbaMatchesViewModel.homeTeamsLogo
            self.awayTeamsLogo = self.nbaMatchesViewModel.awayTeamsLogo
            
            self.nbaMatchesContentView.nbaMatchesTableView.reloadData()
        }
    }
}

extension NBAMatchesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfMatches ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NBAMatchesTableViewCell.reuseIdentifier) as? NBAMatchesTableViewCell else {
                return NBAMatchesTableViewCell()
            }
        
        cell.homeTeamLabel.text = self.namesHomeTeam![indexPath.row]
        cell.awayTeamLabel.text = self.namesAwayTeam![indexPath.row]
        cell.matchTimeLabel.text = self.timesMatch![indexPath.row]
        cell.homeTeamLogoImageView.downloaded(from: self.homeTeamsLogo![indexPath.row])
        cell.awayTeamLogoImageView.downloaded(from: self.awayTeamsLogo![indexPath.row])
        
        return cell
    }
}

extension String {
    
    func capitalizingFirstLetter() -> String {
        
        let first = self.prefix(1).capitalized
        let other = self.dropFirst()
        return first + other
    }
}
