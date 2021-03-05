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
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Picker("select your favorite club", selection: $selectedTeam) {
                        ForEach(teams, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(height: 35)
                    .padding(5)
                    .background(Color("Primary"))
                    .foregroundColor(Color("lightText"))
                    .cornerRadius(5)
                    .pickerStyle(MenuPickerStyle())
                    .padding(.leading, 2)
                    Spacer()
                }
                
                HStack {
                    Text("Your favorite club is:")
                        .foregroundColor(Color("lightText"))
                    Text(selectedTeam)
                        .foregroundColor(Color("lightText"))
                        .bold()
                }
            }
            
            VStack(alignment: .leading) {
                if isEmailTyped(text: user.email) {
                    Text("Email")
                        .foregroundColor(Color("lightText"))
                }
                
                TextField(isEmailTyped(text: user.email) ? "" : "Email", text: $user.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(height: 35)
                    .padding(5)
                    .background(Color("Primary"))
                    .foregroundColor(Color("lightText"))
                    .cornerRadius(5)
            }
            .frame(height: 75)
            .animation(.easeInOut(duration: 0.2))
            
            
            VStack(alignment: .leading) {
                if isEmailTyped(text: password) {
                    Text("Password")
                        .foregroundColor(Color("lightText"))
                }
                SecureField(isEmailTyped(text: password) ? "" : "password", text: $password)
                    .frame(height: 35)
                    .padding(5)
                    .background(Color("Primary"))
                    .foregroundColor(Color("lightText"))
                    .cornerRadius(5)
            }
            .frame(height: 75)
            .animation(.easeInOut(duration: 0.2))
            
            Spacer()
            Button("Sign up"){
                user.favoriteClub = selectedTeam
                env.signUp(user: user, password: password)
            }
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
            .frame(height: 35)
            .padding(5)
            .background(Color("Primary"))
            .foregroundColor(Color("lightText"))
            .cornerRadius(5)
        }
    }
    func isEmailTyped(text: String) -> Bool {
        text != ""
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
