//
//  Main.swift
//  myApp
//
//  Created by Hussain on 2/8/21.
//

import SwiftUI

struct Main: View {
    @State var isShowed = true
    @State var isLive = false
     
    @State var toggleSize: CGFloat = 0
    @State var toggleOffset: CGFloat = 0
    @State var toggleColor: Color = .gray
    @State var toggled: Bool = false
    var body: some View {
        ZStack {
            if self.isShowed { GeometryReader{_ in AnimationScreen() }}
            if !self.isShowed {
                Form {
                    Text("game1")
                    Text("game2")
                    Text("game3")
                    Text("game4")
                    
                }
            }
            if !self.isShowed {
                GeometryReader { geommetry in
                    VStack {
                        HStack {
                            Spacer()
                            Text(toggled ? "Live" : "Not Live")
                                .foregroundColor(Color("Text"))
                            MyToggle(buttonSize: $toggleSize, buttonOffset: $toggleOffset, buttonColor: $toggleColor, toggled: $toggled)
                        }.padding(.trailing)
                        Spacer()
                        TB(color1: Color("Shadow2"), color2: Color.secondary, color3: Color.secondary, color4: Color.secondary, color5: Color.secondary)
                            .frame(width: geommetry.size.width - 20, height: 90)
                            .cornerRadius(32)
                            .padding(.horizontal, 10)
                            .shadow(color: Color("Color").opacity(0.15), radius: 5, x: 0, y: 5)
                    }
                }
            }
        }.onAppear { loadData() }
    }
    func loadData(){
        
        var arrayGame : [Game] = []
        
        guard let url = URL(string:"https://apiv2.apifootball.com/?action=get_events&from=2020-01-01&to=2021-02-09&league_id=468&APIkey=9f8607a303e682d786af195655dbd534a38ebcad84ffb25f867718d4331c2a27")
        
        else { return }
        
        URLSession.shared.dataTask(with: url){(data , response, error) in
            do{
                guard let data = data else { return }
                
                if let decodedData = try? JSONDecoder().decode([Game].self, from: data) {
                    
                    DispatchQueue.main.async {
                        for i in decodedData{
                            
                            self.isShowed = false
                            arrayGame.append(Game(MD: i.MD, MS: i.MS, MT: i.MT, HG: i.HG, AG: i.AG, HN: i.HN, AN: i.AN, THB: i.THB, TAB: i.TAB, CN: i.CN, LN: i.LN, MHHS: i.MHHS, MAHS: i.MAHS, MHES: i.MHES, MAES: i.MAES, MHPS: i.MHPS, MAPS: i.MAPS, MSt: i.MSt, MR: i.MR, LL: i.LL, CL: i.CL, GS: i.GS))
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
    }
}
