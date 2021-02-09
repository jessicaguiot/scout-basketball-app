//
//  NBAMatchesResponseModel.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 08/02/21.
//

import Foundation

struct ResponseAPI: Codable {
    
    let get: String
    let parameters: Parameters
    let errors: [Errors]?
    let results: Int
    let response: [Response]?
}

struct Parameters: Codable {
    
    let league, date, timezone, season: String
    
}

struct Errors: Codable {
    
    let season: String?
}

struct Response: Codable {
    
    let id: Int
    let date: String
    let time: String
    let timestamp: Int
    let timezone: String
    let stage: String?
    let week: String?
    let status: Status
    let country: Country
    let league: League
    let teams: Teams
    let scores: Scores
}

struct Status: Codable {
    
    let long, short: String
    let timer: String?
}

struct Country: Codable {
    
    let id: Int
    let name, code, flag: String
}

struct League: Codable {
    
    let id: Int
    let name, type, logo, season: String
}

struct Teams: Codable {
    
    let home, away: Team
}

struct Team: Codable {
    
    let id: Int
    let name, logo: String
}

struct Scores: Codable {
    
    let home, away: ScoresTeam
}

struct ScoresTeam: Codable {
    
    let quarter1, quarter2, quarter3, quarter4: Int?
    let overTime, total: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case quarter1 = "quarter_1"
        case quarter2 = "quarter_2"
        case quarter3 = "quarter_3"
        case quarter4 = "quarter_4"
        case overTime = "over_time"
        case total
    }
}
