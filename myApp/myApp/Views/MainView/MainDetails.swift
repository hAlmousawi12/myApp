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
    @State var show = true
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
                                    if game.MS == "" || game.MS == " " {
                                        RingView(color1: #colorLiteral(red: 1, green: 0.4512892365, blue: 0, alpha: 1), color2: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), width: 50, height: 50, percent: 0, show: $show)
                                    } else if game.MS == "Finished" {
                                        RingView(color1: #colorLiteral(red: 1, green: 0.4512892365, blue: 0, alpha: 1), color2: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), width: 50, height: 50, percent: 90, show: $show)
                                    } else {
                                        RingView(color1: #colorLiteral(red: 1, green: 0.4512892365, blue: 0, alpha: 1), color2: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), width: 50, height: 50, percent: Double(game.MS) ?? 45, show: $show)
                                    }
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
                            }.font(.title)
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
                            
                        }.font(.title2)
                        if game.MS == "" && game.MS != " " {
                            Text("Wait for the game to start to see more details")
                                .font(.title)
                        } else {
                            VStack {
                            Group {
                                HStack {
                                    Text("Half time score: ")
                                    Text("\(game.MHHS) - \(game.MAHS)")
                                    Spacer()
                                }
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
                                    }.padding(.vertical, 10)
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
                                    if game.GS == []{
                                        if isLive(game: game) {
                                            Text("No one has scored yet")
                                        } else {
                                            Text("No one has scored in this match")
                                        }
                                        Spacer()
                                    }
                                }
                                ForEach(game.GS) { i in
                                    HStack {
                                        Text("Scorer: ")
                                        ZStack {
                                            Text(i.HS)
                                            Text(i.AS)
                                        }
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Resault:")
                                        Text(i.S)
                                        Spacer()
                                    }
                                    HStack{
                                        if i.AS != "" {
                                            Text("Assisted by: ")
                                            Text(i.AS)
                                            Spacer()
                                        }
                                    }
                                    HStack {
                                        Text("For: ")
                                        if i.HS == "" {
                                            Text(game.AN)
                                        } else {
                                            Text(game.HN)
                                        }
                                        Spacer()
                                    }
                                    HStack {
                                        if i.I != "" {
                                            Text(i.I)
                                            Spacer()
                                        }
                                    }
                                    Divider()
                                }
                            }
                            Group {
                                HStack {
                                    
                                    Text("Cards :")
                                    if game.C == []{
                                        if isLive(game: game) {
                                        Text("No cards yet")
                                        } else {
                                            Text("There isn't any card in this match")
                                        }
                                    }
                                    Spacer()
                                }
                                ForEach(game.C) { card in
                                    
                                    HStack {
                                        Text("Time: ")
                                        Text(card.T)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Fault: ")
                                        ZStack {
                                            Text(card.HF)
                                            Text(card.AF)
                                            
                                        }
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Card: ")
                                        Text(card.C)
                                        Spacer()
                                    }
                                    HStack {
                                        Text("Reason: ")
                                        Text(card.I)
                                        Spacer()
                                    }
                                    Divider()
                                }
                                
                            }
                            Group {
                                ForEach(game.S) { s in
                                    Text("\(s.T): ")
                                    Text("\(s.H) - \(s.A)")
                                }
                            }
                            }.font(.title2)
                        }
                    }.padding(.leading, 10)
                }
                .frame(width: geometry.size.width - 20)
                .background(Color("offW&B"))
                .cornerRadius(15)
                .padding(.leading, 10)
                .shadow(color: Color("Shadow").opacity(0.15), radius: 10, x: 0, y: 10)
                
            }
        }
    }
    func isExtra(game: Game) -> Bool {
        game.MHES == "" && game.MAES == ""
    }
    func isPenalites(game: Game) -> Bool {
        game.MHPS == "" && game.MAPS == ""
    }
    func isLive(game: Game) -> Bool {
        game.MS != "Finished" && game.MS != "" && game.MS != "After ET" && game.MS != "Postponed" && game.MS != "After Extra Time" && game.MS != "After Penalties" && game.MS != " " && game.MS != "Cancelled"
    }

}
