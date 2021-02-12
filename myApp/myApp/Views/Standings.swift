//
//  Standings.swift
//  myFinalProject
//
//  Created by hussain haidar almousawi on 10/16/20.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct Standings: View {
    
    @State var teams: [Team] = []
    @State var isShowed = true
    var body: some View {
        ZStack {
            VStack{
                if self.isShowed { AnimationScreen() }
                if !self.isShowed{
                    Form{
                        
                        HStack {
                            Group {
                                Text("Team")
                                Spacer()
                                Spacer()
                                Text("PTS")
                                Spacer()
                                Text("PLY")
                                Spacer()
                            }
                            Group {
                                Text("W")
                                    .offset(x: -3 , y: 0)
                                Spacer()
                                Text("D")
                                    .offset(x: 5 , y: 0)
                                Spacer()
                                Text("L")
                                    .offset(x: 10 , y: 0)
                            }
                        }.padding(10)
                        ForEach(teams) {item in
                            VStack {
                                Spacer()
                                HStack(alignment: .center){
                                    Group {
                                        Text("\(item.S).")
                                    WebImage(url: URL(string: "\(item.TB)"))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    }
                                    .frame(width: 30, height: 50)
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Text(item.PTS)
                                        Spacer()
                                        Text(item.MP)
                                        Spacer()
                                        Text(item.W)
                                        Spacer()
                                        Text(item.D)
                                        Spacer()
                                        Text(item.L)
                                    }
                                }
                                Spacer()
                            }
                            
                        }
                    }.listStyle(SidebarListStyle())
                }
            }
            .onAppear{ loadTeamData() }
            .navigationBarHidden(true)
            
            if !self.isShowed{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        
                        TB(color1: Color.secondary, color2: Color("Shadow2"), color3: Color.secondary, color4: Color.secondary, color5: Color.secondary)
                            .frame(width: geometry.size.width - 20, height: 90)
                            .cornerRadius(32)
                            .padding(.horizontal, 10)
                            .shadow(color: Color("Color").opacity(0.15), radius: 5, x: 0, y: 5)
                    }
                }
            }
        }.navigationBarHidden(true)
    }
    
    
    
    
    func loadTeamData() {
        var arrayTeam: [Team] = []
        
        guard let url = URL(string: "https://apiv2.apifootball.com/?action=get_standings&league_id=468&APIkey=6889a1b1a4a965232ebfc8495e336096345bc538625f78e34e6c321467ad1d40")
        else { return }
        
        URLSession.shared.dataTask(with: url){(data , response , error)  in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode([Team].self, from: data)
                DispatchQueue.main.async {
                    self.isShowed = false
                    for i in decodedData {
                        arrayTeam.append(Team(TN: i.TN, S: i.S, MP: i.MP, W: i.W, D: i.D, L: i.L, PTS: i.PTS, TB: i.TB))
                        teams = arrayTeam
                        
                    }
                }
            }
            catch {
                print("XXXXXX \(error)")
            }
        }.resume()
    }
    
}


struct Standings_Previews: PreviewProvider {
    static var previews: some View {
        Standings()
            .preferredColorScheme(.dark)
    }
}

