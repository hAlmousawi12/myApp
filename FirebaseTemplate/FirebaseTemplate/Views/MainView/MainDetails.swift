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
    @State var EGShowed = false
    @State var show = true
    var body: some View {
        GeometryReader { geometry in
            if EGShowed {
                ZStack {
                    Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)).edgesIgnoringSafeArea(.all)
                    VStack(spacing: 20) {
                        Text("Meow")
                        Text("congrats this is the first easter egg")
                        Text("Try to search the others")
                        
                        Button(action: { self.EGShowed.toggle() }, label: {
                            Text("Back to the details")
                            
                        })
                    }.font(.title2)
                }
            } else {
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
                                            RingView(color1: #colorLiteral(red: 1, green: 0.4512892365, blue: 0, alpha: 1), color2: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), width: 50, height: 50, percent: 0, show: $show, EGShowed: $EGShowed)
                                        } else if game.MS == "Finished" {
                                            RingView(color1: #colorLiteral(red: 1, green: 0.4512892365, blue: 0, alpha: 1), color2: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), width: 50, height: 50, percent: 90, show: $show, EGShowed: $EGShowed)
                                        } else {
                                            RingView(color1: #colorLiteral(red: 1, green: 0.4512892365, blue: 0, alpha: 1), color2: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), width: 50, height: 50, percent: Double(game.MS) ?? 45, show: $show, EGShowed: $EGShowed)
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
                                        MyStack(txt1: "Half time score: ", txt2: "\(game.MHHS) - \(game.MAHS)")
                                        if !isExtra(game: game) {
                                            MyStack(txt1: "Extra time score: ", txt2: "\(game.MHES) - \(game.MAES)")
                                        }
                                        if !isPenalites(game: game) {
                                            MyStack(txt1: ("Penalites score: "), txt2: "\(game.MHPS) - \(game.MAPS)")
                                        }
                                        if game.MSt != "" {
                                            MyStack(txt1: ("Stadium: "), txt2: "\(game.MSt)")
                                                .padding(.vertical, 10)
                                        }
                                        if game.MR != "" {
                                            MyStack(txt1: ("Referee: "), txt2: "\(game.MR)")
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
                                            MyStack(txt1: "Resault: ", txt2: i.S)
                                                if i.AS != "" {
                                                    
                                                    MyStack(txt1: "Assisted by: ", txt2: i.AS)
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
                                                if i.I != "" {
                                                    MyStack(txt1: i.I, txt2: "")
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
