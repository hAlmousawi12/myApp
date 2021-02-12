//
//  MainDetails.swift
//  myApp
//
//  Created by Hussain on 2/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainDetails: View {
    var game: Game
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        Group {
                            HStack {
                                Group {
                                    VStack {
                                        WebImage(url: URL(string: game.THB))
                                            .resizable()
                                            .frame(width: 70, height: 70)
                                        
                                    }
                                    
                                    Text(game.HG)
                                        .bold()
                                    
                                }
                                
                                Spacer()
                                VStack{
                                    Text(game.MS)
                                        .font(.title)
                                    Text(game.MD)
                                    Text(game.MT)
                                }.padding(.vertical)
                                
                                Spacer()
                                
                                Group {
                                    Text(game.AG)
                                        .bold()
                                    VStack {
                                        WebImage(url: URL(string: game.TAB))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 70, height: 70)
                                    }
                                }
                            }
                            HStack {
                                Text(game.HN)
                                Spacer()
                                Text(game.AN)
                            }
                        }.padding(.trailing, 10)
                        Group {
                            HStack {
                                Text("Countery: ")
                                Text(game.CN)
                                WebImage(url: URL(string: game.CL))
                                    .resizable()
                                    .frame(width: 35, height: 25)
                                Spacer()
                            }
                            HStack {
                                Text("Leage: ")
                                Text(game.LN)
                                WebImage(url: URL(string: game.LL))
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                Spacer()
                            }
                            HStack {
                                Text("Half time score: ")
                                Text("\(game.MHHS) - \(game.MAHS)")
                                Spacer()
                            }
                        }
                        Group {
                            if !isExtra(game: game) {
                                HStack {
                                    Text("Extra time score: ")
                                    Text("\(game.MHES) - \(game.MAES)")
                                    Spacer()
                                }
                            }
                            if !isPenalites(game: game) {
                                HStack {
                                    Text("Penalites score: ")
                                    Text("\(game.MHPS) - \(game.MAPS)")
                                    Spacer()
                                }
                            }
                            if game.MSt != "" {
                                HStack {
                                    Text("Stadium: ")
                                    Text(game.MSt)
                                    Spacer()
                                }
                            }
                            if game.MR != "" {
                                HStack {
                                    Text("Referee: ")
                                    Text(game.MR)
                                    Spacer()
                                }
                            }
                        }
                        Divider()
                        Group {
                            HStack {
                                Text("Scores:")
                                Spacer()
                            }
                            ForEach(0..<GameGoals(game: game)) { i in
                                HStack {
                                    Text("Scorer: ")
                                    ZStack {
                                        Text(game.GS[i].HS)
                                        Text(game.GS[i].AS)
                                    }
                                    Spacer()
                                }
                                HStack {
                                    Text("Resault:")
                                    Text(game.GS[i].S)
                                    Spacer()
                                }
                                HStack{
                                    if game.GS[i].AS != "" {
                                        Text("Assisted by: ")
                                        Text(game.GS[i].AS)
                                        Spacer()
                                    }
                                }
                                HStack {
                                    if game.GS[i].I != "" {
                                        Text("")
                                    }
                                }
                            }
                        }
                    }.padding(.leading, 10)
                }
                .frame(width: geometry.size.width - 20)
                .background(Color("offW&B"))
                .cornerRadius(15)
                .padding(.leading, 10)
            }
        }
    }
    func isExtra(game: Game) -> Bool {
        game.MHES == "" && game.MAES == ""
    }
    func isPenalites(game: Game) -> Bool {
        game.MHPS == "" && game.MAPS == ""
    }
    func GameGoals(game: Game)-> Int {
        (Int(game.HG) ?? 0) + (Int(game.AG) ?? 0)
    }
}
//struct MainDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        MainDetails(game: Game(MD: "2017-08-18", MS: "Finished", MT: "22:15", HG: "1", AG: "0", HN: "Valencia", AN: "Las Palmas", THB: "https://apiv2.apifootball.com/badges/7109_valencia.png", TAB: "https://apiv2.apifootball.com/badges/7092_las-palmas.png", CN: "Spain", LN: "LaLiga", MHHS: "1", MAHS: "0", MHES: "", MAES: "", MHPS: "", MAPS: "", MSt: "", MR: "", LL: "https://apiv2.apifootball.com/badges/logo_leagues/468_laliga.png", CL: "https://apiv2.apifootball.com/badges/logo_country/135_spain.png", MOO: "41226", GS: [myApp.GoalScores(T: "22", HS: "Zaza S.", S: "1 - 0", AS: "", I: "")]))
//    }
//}


