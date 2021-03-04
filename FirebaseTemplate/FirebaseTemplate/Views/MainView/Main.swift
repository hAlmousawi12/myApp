//
//  Main.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Main: View {
    @State var isShowed = true
    @State var isLive = false
    @State var toggled = false
    
    var body: some View {
        
        ZStack {
            if self.isShowed { AnimationScreen() }
            if !self.isShowed {
                ZStack {
                    Form {
                        if toggled {
                            MS(text: "Live🔴")
                            LiveFE()
                        } else  {
                            MS(text: "Upcoming🧨")
                            UpcomingFE()
                            
                            MS(text: "Done🪄")
                            FinishedFE()
                        }
                    }
                }
                TBandTGL(toggled: $toggled)
            }
        }.navigationBarHidden(true)
        .onAppear { loadData() }
        
    }
    func loadData(){
        
        var arrayGame : [Game] = []
        
        guard let url = URL(string:"https://apiv2.apifootball.com/?action=get_events&from=2015-01-01&to=3030-01-01&league_id=468&APIkey=d25c5e396ece3fe59de0ee51970cb0fb94e7d9889b6201644c8a57742bc74c09")
        
        
        else { return }
        
        URLSession.shared.dataTask(with: url){(data , response, error) in
            do {
                
                    guard let data = data else { return }
                    
                    if let decodedData = try? JSONDecoder().decode([Game].self, from: data) {
                        DispatchQueue.main.async {
                            for i in decodedData{
                                
                                self.isShowed = false
                                arrayGame.append(Game(MD: i.MD, MS: i.MS, MT: i.MT, HG: i.HG, AG: i.AG, HN: i.HN, AN: i.AN, THB: i.THB, TAB: i.TAB, CN: i.CN, LN: i.LN, MHHS: i.MHHS, MAHS: i.MAHS, MHES: i.MHES, MAES: i.MAES, MHPS: i.MHPS, MAPS: i.MAPS, MSt: i.MSt, MR: i.MR, LL: i.LL, CL: i.CL, MOO: i.MOO, GS: i.GS, MHS: i.MHS, MAS: i.MAS , C: i.C, S: i.S))  //, L: i.L
                                games = arrayGame
                                
                            }
                        }
                    }
            }
        }.resume()
    }
}


struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
            .preferredColorScheme(.dark)
    }
}
