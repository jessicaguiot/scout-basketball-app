//
//  NBBMatchesViewModel.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import Foundation
import UIKit

class NBAMatchesViewModel {
    
    let networkingClient = NetworkingClient()
    
    //MARK: - Communication with NBA's API
    
    func getMatchesNBA() {
        
        let urlToExecute = URL(string: "https://api-basketball.p.rapidapi.com/games")!
        
        networkingClient.executeRequest(urlToExecute) { (responseAPI, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let responses = responseAPI?.response, let results = responseAPI?.results {
                
                DispatchQueue.main.async {
                    
                    var matches = NBAMatches(matches: responses, results: results)
                    print(matches)
                }
            }
        }
    }
}
