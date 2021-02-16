//
//  Networking.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import Foundation
import Alamofire

class DataService {
    
    typealias WebServiceResponse = (ResponseAPI?, Error?) -> Void
    
    public func executeRequest(_ url: URL, completion: @escaping WebServiceResponse) {
    
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let headers: HTTPHeaders = [
            
            "x-rapidapi-key": "682386614dmsh1ca966b7bd7d13ep1532c0jsn010c7df0fa95",
            "x-rapidapi-host": "api-basketball.p.rapidapi.com"
        ]
        
        var localTimeZoneAbbreviation: String {
            return TimeZone.current.identifier
        }
        
        let parameters = [
            "league": "12",
            "season": "2020-2021",
            "timezone": localTimeZoneAbbreviation,
            "date": NBAMatchesViewModel().getTodayDate(dateHandler: DateHandler(), dateFormat: "yyyy-MM-dd")
        ]
        
        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: ResponseAPI.self) { response in

            if let error = response.error {
                completion(nil, error)
            }

            if let matches = response.value {

                completion(matches, nil)
            }
        }
    }
}
