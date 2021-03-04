//
//  Game.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import Foundation

var games: [Game] = []

struct Game: Codable,Identifiable {
    
    var id = UUID()
    var MD: String
    var MS: String
    var MT: String
    var HG: String
    var AG: String
    var HN: String
    var AN: String
    var THB: String
    var TAB: String
    var CN: String
    var LN: String
    var MHHS: String
    var MAHS: String
    var MHES: String
    var MAES: String
    var MHPS: String
    var MAPS: String
    var MSt: String
    var MR: String
    var LL: String
    var CL: String
    var MOO: String
    var GS: [GoalScores]
    var MHS: String
    var MAS: String
    var C: [Cards]
//    var L: [Lineup]
    var S: [Statistics]
    
    enum CodingKeys: String, CodingKey{
        case MD = "match_date"
        case HG = "match_hometeam_score"
        case MS = "match_status"
        case MT = "match_time"
        case AG = "match_awayteam_score"
        case HN = "match_hometeam_name"
        case AN = "match_awayteam_name"
        case THB = "team_home_badge"
        case TAB = "team_away_badge"
        case CN = "country_name"
        case LN = "league_name"
        case MHHS = "match_hometeam_halftime_score"
        case MAHS = "match_awayteam_halftime_score"
        case MHES = "match_hometeam_extra_score"
        case MAES = "match_awayteam_extra_score"
        case MHPS = "match_hometeam_penalty_score"
        case MAPS = "match_awayteam_penalty_score"
        case MSt = "match_stadium"
        case MR = "match_referee"
        case LL = "league_logo"
        case CL = "country_logo"
        case GS = "goalscorer"
        case MOO = "match_id"
        case MHS = "match_hometeam_system"
        case MAS = "match_awayteam_system"
        case C = "cards"
//        case L = "lineup"
        case S = "statistics"
    }
}
struct Statistics: Codable,Identifiable {
    
    var id = UUID()
    var T: String
    var H: String
    var A: String
   
    
    enum CodingKeys: String, CodingKey{
        case T = "type"
        case H = "home"
        case A = "away"
        
    }
}
struct GoalScores: Equatable,Codable,Identifiable {
    
    var id = UUID()
    var T: String
    var HS: String
    var S: String
    var AS: String
    var I: String
    
    enum CodingKeys: String, CodingKey{
        case T = "time"
        case HS = "home_scorer"
        case S = "score"
        case AS = "away_scorer"
        case I = "info"
    }
}
struct Cards: Equatable,Codable,Identifiable {
    
    var id = UUID()
    var T: String
    var HF: String
    var AF: String
    var C: String
    var I: String
    
    enum CodingKeys: String, CodingKey{
        case T = "time"
        case HF = "home_fault"
        case AF = "away_fault"
        case C = "card"
        case I = "info"
    }
}
struct Lineup: Codable,Identifiable {
    
    var id = UUID()
    var H: [MyLineup]
    var A: [MyLineup]
    
    enum CodingKeys: String, CodingKey{
        case H = "home"
        case A = "away"
    }
}
struct MyLineup: Codable,Identifiable {
    
    var id = UUID()
    var SL: [Player]
    var S: [Player]
    var C: [Player]
    var MP: [Player]
   
    
    enum CodingKeys: String, CodingKey{
        case SL = "starting_lineups"
        case S = "substitutes"
        case C = "coach"
        case MP = "missing_players"
        
    }
}
struct Player: Codable,Identifiable {
    
    var id = UUID()
    var P: String
    var N: String
    var Po: String
   
    
    enum CodingKeys: String, CodingKey{
        case P = "lineup_player"
        case N = "lineup_number"
        case Po = "lineup_position"
        
    }
}
