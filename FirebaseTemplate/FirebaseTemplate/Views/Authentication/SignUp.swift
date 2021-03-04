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
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State var selectedTeam = ""
    var body: some View {
        Form{
            VStack(alignment: .leading) {
                Picker("chose your favorite club", selection: $selectedTeam) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                HStack {
                    Text("Your favorite club is:")
                        .foregroundColor(Color("card4"))
                    Text(selectedTeam)
                        .foregroundColor(Color("card3"))
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
