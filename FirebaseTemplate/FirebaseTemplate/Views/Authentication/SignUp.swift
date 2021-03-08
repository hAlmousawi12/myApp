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
        GeometryReader { geometry in
            ZStack {
                Image("BG")
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .padding(.top, 87)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Group {
                    Image("LogoNo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Sign up")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("lightText"))
                    }
                    
                    VStack(alignment: .leading, spacing: 40) {
                        
                        VStack(alignment: .leading) {
                            if !user.email.isEmpty {
                                Text("E-Mail")
                                    .foregroundColor(Color("lightText"))
                                    .font(.system(size: 15.5, weight: .semibold))
                            }
                            ZStack {
                                if user.email.isEmpty {
                                    HStack {
                                        Text("E-Mail")
                                            .foregroundColor(Color("Placeholder"))
                                        Spacer()
                                    }
                                }
                                VStack {
                                    TextField("", text: $user.email)
                                        .disableAutocorrection(true)
                                        .keyboardType(.emailAddress)
                                        .foregroundColor(Color("lightText"))
                                    Divider()
                                        .background(Color("Placeholder"))
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            if selectedTeam != "" {
                                HStack {
                                    
                                    Text("Your favorite club is:")
                                        .foregroundColor(Color("lightText"))
                                    
                                    Text(selectedTeam)
                                        .foregroundColor(Color("lightText"))
                                        .bold()
                                }
                            }
                            HStack {
                                Picker("Select your favorite club", selection: $selectedTeam) {
                                    ForEach(teams, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .foregroundColor(Color("Placeholder"))
                                .pickerStyle(MenuPickerStyle())
                                
                                Spacer()
                            }
                            Divider()
                                .background(Color("Placeholder"))
                        }
                        
                        VStack(alignment: .leading) {
                            if !password.isEmpty {
                                Text("Password")
                                    .foregroundColor(Color("lightText"))
                                    .font(.system(size: 15.5, weight: .semibold))
                            }
                            ZStack {
                                if password.isEmpty {
                                    HStack {
                                        Text("Password")
                                            .foregroundColor(Color("Placeholder"))
                                        Spacer()
                                    }
                                }
                                VStack {
                                    SecureField("", text: $password)
                                        .foregroundColor(Color("lightText"))
                                    Divider()
                                        .background(Color("Placeholder"))
                                }
                            }
                        }
                        
                    }
                    .frame(width: geometry.size.width - 50)
                    .animation(.easeInOut(duration: 0.2))
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            user.favoriteClub = selectedTeam
                            env.signUp(user: user, password: password)
                        }, label : {
                            Text("Sign up")
                                .font(.title2)
                                .foregroundColor(Color("lightText"))
                        })
                        .frame(width: geometry.size.width - 120, height: 60)
                        .background(Color("Primary"))
                        .cornerRadius(10)
                        .shadow(color: Color("Primary"), radius: 10, x: 0, y: 10)
                    }
                    
                    Spacer()
                    
                    HStack  {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Already have an account?")
                            NavigationLink(
                                destination: SignIn(),
                                label: {
                                    Text("Sign in  >")
                                })
                        }
                        Spacer()
                    }
                    .foregroundColor(Color("Placeholder"))
                    .padding(.leading, 30)
                    .font(.system(size: 12.5))
                    
                    Spacer()
                    Spacer()
                }
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
