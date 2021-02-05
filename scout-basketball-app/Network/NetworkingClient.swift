//
//  Networking.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 05/02/21.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    public func executeRequest(_ url: URL) {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let headers: HTTPHeaders = [
            
            "x-rapidapi-key": "682386614dmsh1ca966b7bd7d13ep1532c0jsn010c7df0fa95",
            "x-rapidapi-host": "api-basketball.p.rapidapi.com"
        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            
            debugPrint(response)
        }
    }
}
