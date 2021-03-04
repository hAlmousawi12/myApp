//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @State var user = User()
    @State var password = ""
    @EnvironmentObject var env: FirebaseEnv
    var teams = ["Atl. Madrid", "Barcelona", "Real Madrid", "Sevilla", "Real Sociedad", "Betis", "Villarreal", "Granada CF", "Levante", "Ath Bilbao", "Celta Vigo", "Osasuna", "Getafe", "Valencia", "Cadiz CF", "Eibar", "Valladolid", "Alaves", "Elchi", "Huesca"]
    @State var selectedTeam = ""
    var body: some View {
        Form{
            VStack(alignment: .leading) {
                Picker("select your favorite club", selection: $selectedTeam) {
                    ForEach(teams, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                HStack {
                    Text("Your favorite club is:")
                        .foregroundColor(Color("Primary"))
                    Text(selectedTeam)
                        .foregroundColor(Color("Primary"))
                        .bold()
                }
            }
            
            TextField("email", text: $user.email).keyboardType(.emailAddress)
            SecureField("password", text: $password)
            Button("Sign up"){
                user.favoriteClub = selectedTeam
                env.signUp(user: user, password: password)
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUp()
                .environmentObject(FirebaseEnv())
        }
    }
}
