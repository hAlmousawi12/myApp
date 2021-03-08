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
    @EnvironmentObject var envv: UserEnv
    @EnvironmentObject var item: ItemsEnv
    var teams = ["Atl. Madrid", "Barcelona", "Real Madrid", "Sevilla", "Real Sociedad", "Betis", "Villarreal", "Granada CF", "Levante", "Ath Bilbao", "Celta Vigo", "Osasuna", "Getafe", "Valencia", "Cadiz CF", "Eibar", "Valladolid", "Alaves", "Elchi", "Huesca"]
    @State var selectedTeam = ""
    @State var isAlertPresented = false
    @State var alertContent = ""
    @State var alertTitle = ""
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
            Button {
                    envv.updateUser(updatedUser: User(favoriteClub: selectedTeam, email: envv.user.email), succes: {
                        isAlertPresented = true
                        alertTitle = "Succeed!"
                        alertContent = "Your favorite team has been changed successfully"
                    }) { err in
                        isAlertPresented = true
                        alertTitle = "Error!"
                        alertContent = err?.localizedDescription ?? ""
                    }
                } label: {
                    Text("Submit")
                        .foregroundColor(Color("lightText"))
                        .modifier(SignInModifier())
                }.alert(isPresented: $isAlertPresented, content: {
                    Alert(title: Text(alertTitle), message: Text(alertContent), dismissButton: .default(Text("Okay!")))
                })
                
        }
        .onAppear {
            envv.getUser()
        }
    }
    
}

struct ChangeFC_Previews: PreviewProvider {
    static var previews: some View {
        ChangeFC()
            .environmentObject(FirebaseEnv())
    }
}
