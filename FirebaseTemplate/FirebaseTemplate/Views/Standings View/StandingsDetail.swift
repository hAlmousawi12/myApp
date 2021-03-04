//
//  StandingsDetail.swift
//  myApp
//
//  Created by Hussain on 2/15/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct StandingsDetail: View {
    var teams: Team
    @State var team: [OneTeam] = []
    @State var isShowed = true
    var body: some View {
        ZStack {
        if isShowed { AnimationScreen() }
        if !isShowed {
            
                GeometryReader { geometry in
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
                                        MyStack(txt1: "Name: ", txt2: team.C[0].CN)
                                        MyStack(txt1: "Country: ", txt2: team.C[0].CC)
                                        MyStack(txt1: "Age: ", txt2: team.C[0].CA)
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
            }
        }.onAppear { loadTeamData() }
        .navigationBarHidden(false)
    }
    func loadTeamData() {
        var arrayTeam: [OneTeam] = []
        
        guard let url = URL(string: "https://apiv2.apifootball.com/?action=get_teams&team_id=\(teams.TI)&APIkey=d25c5e396ece3fe59de0ee51970cb0fb94e7d9889b6201644c8a57742bc74c09")
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

