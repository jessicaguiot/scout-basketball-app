//
//  NBBMatchesViewModel.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import Foundation
import UIKit

class NBAMatchesViewModel {
    
    //MARK: - Properties
    
    var dataSourceNBA = NBAMatches() {
        
        didSet {
            
            self.setupNBAMatches(with: dataSourceNBA)
            self.didFinishFetch?()
        }
    }
    
    var didFinishFetch: (() -> ())?
    
    var numberOfMatches: Int?
    var nameHomeTeam: [String] = []
    var nameAwayTeam: [String] = []
    var timeMatch: [String] = []
    var homeTeamsLogo: [String] = []
    var awayTeamsLogo: [String] = []
    
    let dataService = DataService()
    
    //MARK: - Communication with NBA's API
    
    func fetchMatchesNBA() {
        
        let urlToExecute = URL(string: "https://api-basketball.p.rapidapi.com/games")!
        
        dataService.executeRequest(urlToExecute) { (matches, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let responseApi = matches?.response, let resultsAPI = matches?.results {
                
                self.dataSourceNBA.matches = responseApi
                self.dataSourceNBA.results = resultsAPI
            }
        }
    }
    
    private func setupNBAMatches(with matches: NBAMatches) {
        
        self.numberOfMatches = matches.results
        
        for match in matches.matches! {
            
            self.nameHomeTeam.append(match.teams.home.name)
            self.nameAwayTeam.append(match.teams.away.name)
            self.timeMatch.append(match.time)
            self.homeTeamsLogo.append(match.teams.home.logo)
            self.awayTeamsLogo.append(match.teams.away.logo)
        }
    }
    
    func getTodayDate(dateFormat: String) -> String {
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func getWeekDay() -> String {
        
        let myCalendar = NSCalendar(calendarIdentifier: .gregorian)
        let myComponents = myCalendar?.components(.weekday, from: Date())
        let weekDay = myComponents?.weekday
        
        switch weekDay {
            case 1:
                return "Domingo"
            case 2:
                return "Segunda"
            case 3:
                return "Terça"
            case 4:
                return "Quarta"
            case 5:
                return "Quinta"
            case 6:
                return "Sexta"
            case 7:
                return "Sábado"
            default:
                print("Error fetching days")
                return "Day"
        }
    }
}

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
