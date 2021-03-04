//
//  FEFuncs.swift
//  myApp
//
//  Created by Hussain on 2/9/21.
//

import SwiftUI

func isDone(game : Game) -> Bool{
    game.MS == "Finished" || game.MS == "After ET" || game.MS == "Postponed" || game.MS == "After Extra Time" || game.MS == "Cancelled"
}

func isLive(game: Game) -> Bool {
    game.MS != "Finished" && game.MS != "" && game.MS != "After ET" && game.MS != "Postponed" && game.MS != "After Extra Time" && game.MS != "After Penalties" && game.MS != " " && game.MS != "Cancelled"
}
