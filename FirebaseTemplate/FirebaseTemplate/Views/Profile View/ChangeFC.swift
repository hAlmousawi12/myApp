//
//  ChangeFC.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/4/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct ChangeFC: View {
    @EnvironmentObject var env: FirebaseEnv
    @EnvironmentObject var item: ItemsEnv
    var teams = ["Atl. Madrid", "Barcelona", "Real Madrid", "Sevilla", "Real Sociedad", "Betis", "Villarreal", "Granada CF", "Levante", "Ath Bilbao", "Celta Vigo", "Osasuna", "Getafe", "Valencia", "Cadiz CF", "Eibar", "Valladolid", "Alaves", "Elchi", "Huesca"]
    @State var selectedTeam = ""
    var body: some View {
        VStack {
            Text("Select Your Favorite Team")
                .font(.title)
                .foregroundColor(Color("lightText"))
            Form {
                Picker("select your favorite club", selection: $selectedTeam) {
                    ForEach(teams, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Button(action: {
                
                
                Networking.createItem(User(favoriteClub: selectedTeam, email: env.user.email), inCollection: "users/\(env.user)") {
                    
                }
            }, label: {
                Text("Submit")
                    .foregroundColor(Color("lightText"))
                    .modifier(SignInModifier())
            })
        }.onAppear {
            env.getUser()
        }
    }
}

struct ChangeFC_Previews: PreviewProvider {
    static var previews: some View {
        ChangeFC()
            .environmentObject(FirebaseEnv())
    }
}
