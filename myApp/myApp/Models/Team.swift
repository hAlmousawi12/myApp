//
//  team.swift
//  myFinalProject
//
//  Created by hussain haidar almousawi on 10/16/20.
//

import Foundation

struct Team: Codable, Identifiable {
    var id = UUID()
    var TN: String
    var S: String
    var MP: String
    var W: String
    var D: String
    var L: String
    var PTS: String
    var TB: String
    
    enum CodingKeys: String, CodingKey{
        case TN = "team_name"
        case S = "overall_league_position"
        case MP = "overall_league_payed"
        case W = "overall_league_W"
        case D = "overall_league_D"
        case L = "overall_league_L"
        case PTS = "overall_league_PTS"
        case TB = "team_badge"
    }
}

