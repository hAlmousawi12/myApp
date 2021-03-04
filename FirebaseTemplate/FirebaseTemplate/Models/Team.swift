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
    var TI: String
    
    enum CodingKeys: String, CodingKey{
        case TN = "team_name"
        case S = "overall_league_position"
        case MP = "overall_league_payed"
        case W = "overall_league_W"
        case D = "overall_league_D"
        case L = "overall_league_L"
        case PTS = "overall_league_PTS"
        case TB = "team_badge"
        case TI = "team_id"
    }
}

struct OneTeam: Codable, Identifiable {
    var id = UUID()
    var TN: String
    var TB: String
    var P: [Players]
    var C: [Coaches]
    var TK: String
    
    enum CodingKeys: String, CodingKey{
        case TN = "team_name"
        case TB = "team_badge"
        case P = "players"
        case C = "coaches"
        case TK = "team_key"
    }
}

struct Players: Codable, Identifiable {
    var id = UUID()
    var PN: String
    var PNum: String
    var PC: String
    var PT: String
    var PA: String
    var PMP: String
    var PG: String
    var PYC: String
    var PRC: String
    
    enum CodingKeys: String, CodingKey{
        case PN = "player_name"
        case PNum = "player_number"
        case PC = "player_country"
        case PT = "player_type"
        case PA = "player_age"
        case PMP = "player_match_played"
        case PG = "player_goals"
        case PYC = "player_yellow_cards"
        case PRC = "player_red_cards"
    }
}

struct Coaches: Codable, Identifiable {
    var id = UUID()
    var CN: String
    var CC: String
    var CA: String
    
    enum CodingKeys: String, CodingKey{
        case CN = "coach_name"
        case CC = "coach_country"
        case CA = "coach_age"
    }
}
