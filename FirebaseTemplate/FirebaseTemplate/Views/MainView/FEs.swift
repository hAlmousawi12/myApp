//
//  FEs.swift
//  myApp
//
//  Created by Hussain on 2/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct UpcomingFE: View {
    var body: some View {
        ForEach(games) { game in
            if game.MS == "" && game.MS != " " {
                NavigationLink(
                    destination: MainDetails(game: game),
                    label: {
                        VStack {
                            Spacer()
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
                                    Text(game.MD)
                                        .foregroundColor(.secondary)
                                    Text(game.MT)
                                        .foregroundColor(.secondary)
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
                            Spacer()
                        }
                    })
            }
        }
    }
}

struct FinishedFE: View {
    var body: some View {
        ForEach(games) { game in
            if isDone(game: game) {
                NavigationLink(
                    destination: MainDetails(game: game),
                    label: {
                        VStack {
                            Spacer()
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
                                        .font(.title2)
                                    Text(game.MD)
                                        .foregroundColor(.secondary)
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
                            Spacer()
                        }
                    })
                
            }
        }
    }
}

struct LiveFE: View {
    
    var body: some View {
        
        ForEach(games) { game in
            if isLive(game: game){
                NavigationLink(
                    destination: MainDetails(game: game),
                    label: {
                        VStack {
                            Spacer()
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
                            Spacer()
                        }
                    })
                
            }
        }
    }
}

struct MS: View {
    var text: String
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
            Spacer()
        }.padding(.vertical, 10)
    }
}
