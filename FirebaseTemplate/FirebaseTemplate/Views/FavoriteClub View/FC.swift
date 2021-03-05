//
//  FC.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/5/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI



struct FC: View {
    @EnvironmentObject var env: FirebaseEnv
    @EnvironmentObject var envv: UserEnv
    @State var team: [OneTeam] = []
    @State var isShowed = true
    @State var FCId = "7105"
    var clubs = ["Atl. Madrid", "Barcelona", "Real Madrid", "Sevilla", "Real Sociedad", "Betis", "Villarreal", "Granada CF", "Levante", "Ath Bilbao", "Celta Vigo", "Osasuna", "Getafe", "Valencia", "Cadiz CF", "Eibar", "Valladolid", "Alaves", "Elchi", "Huesca"]
    
    var body: some View {
        
        
            GeometryReader { geometry in
                ZStack {
                    if isShowed { AnimationScreen(isFC: true) }
                    if !isShowed {
                    ScrollView {
                        ForEach(team) { team in
                            
                            VStack {
                                Group {
                                    HStack {
                                        WebImage(url: URL(string: "\(team.TB)"))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 75, height: 75)
                                        Spacer()
                                    }
                                    MyStack(txt1: team.TN, txt2: "")
                                    
                                }
                                Group {
                                    MyStack(txt1: "Coach info: ", txt2: "")
                                    if team.C != [] {
                                        MyStack(txt1: "Name: ", txt2: team.C[0].CN)
                                        MyStack(txt1: "Country: ", txt2: team.C[0].CC)
                                        MyStack(txt1: "Age: ", txt2: team.C[0].CA)
                                    }
                                }
                                Divider()
                                Group {
                                    MyStack(txt1: "Players: ", txt2: "")
                                    ForEach(team.P) { player in
                                        MyStack(txt1: "Name: ", txt2: player.PN)
                                        MyStack(txt1: "Number: ", txt2: player.PNum)
                                        MyStack(txt1: "Country: ", txt2: player.PC)
                                        MyStack(txt1: "Position: ", txt2: player.PT)
                                        MyStack(txt1: "Age: ", txt2: player.PA)
                                        MyStack(txt1: "Match played: ", txt2: player.PMP)
                                        MyStack(txt1: "Goals: ", txt2: player.PG)
                                        MyStack(txt1: "Yellow cards: ", txt2: player.PYC)
                                        MyStack(txt1: "Red cards: ", txt2: player.PRC)
                                        Divider()
                                    }
                                }
                            }.padding(10)
                            .font(.title2)
                            
                        }
                    }
                    .frame(width: geometry.size.width - 20)
                    .background(Color("offW&B"))
                    .cornerRadius(15)
                    .padding(.leading, 10)
                    .shadow(color: Color("Shadow").opacity(0.15), radius: 10, x: 0, y: 10)
                }
                
                VStack {
                    Spacer()
                    
                    TB(color1: Color("Primary3ks"), color2: Color("Primary3ks"), color3: Color("Primary"), color4: Color("Primary3ks"), color5: Color("Primary3ks"))
                        .frame(width: geometry.size.width - 20, height: 90)
                        .cornerRadius(32)
                        .padding(.horizontal, 10)
                        .shadow(color: Color("Color").opacity(0.15), radius: 5, x: 0, y: 5)
                }
                
            }
        }.onAppear {
            
            envv.getUserFC()
            print("favorite club is : \(envv.userFC)")
            switch(envv.userFC) {
            case clubs[0] : FCId = "7106"
            case clubs[1] : FCId = "7105"
            case clubs[2] : FCId = "7099"
            case clubs[3] : FCId = "7102"
            case clubs[4] : FCId = "7101"
            case clubs[5] : FCId = "7091"
            case clubs[6] : FCId = "7107"
            case clubs[7] : FCId = "7110"
            case clubs[8] : FCId = "7097"
            case clubs[9] : FCId = "7104"
            case clubs[10] : FCId = "7095"
            case clubs[11] : FCId = "7113"
            case clubs[12] : FCId = "7100"
            case clubs[13] : FCId = "7109"
            case clubs[14] : FCId = "7126"
            case clubs[15] : FCId = "7096"
            case clubs[16] : FCId = "7115"
            case clubs[17] : FCId = "7108"
            case clubs[18] : FCId = "7173"
            case clubs[19] : FCId = "7125"
            default : FCId = ""
            }
            loadTeamData()
        }
        .navigationBarHidden(true)
    }
    
    
    func loadTeamData() {
        var arrayTeam: [OneTeam] = []
        
        guard let url = URL(string: "https://apiv2.apifootball.com/?action=get_teams&team_id=\(FCId)&APIkey=d25c5e396ece3fe59de0ee51970cb0fb94e7d9889b6201644c8a57742bc74c09")
        else { return }
        
        URLSession.shared.dataTask(with: url){(data , response , error)  in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([OneTeam].self, from: data)
                DispatchQueue.main.async {
                    isShowed = false
                    for i in decodedData {
                        arrayTeam.append(OneTeam(TN: i.TN, TB: i.TB, P: i.P, C: i.C, TK: i.TK))
                        team = arrayTeam
                        
                    }
                }
            }
            catch {
                print("XXXXXX \(error)")
            }
        }.resume()
    }
}

struct FC_Previews: PreviewProvider {
    static var previews: some View {
        FC()
    }
}
