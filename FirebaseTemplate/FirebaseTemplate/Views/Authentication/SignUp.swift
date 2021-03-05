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
        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Image("LogoNo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Sign up")
                        .font(.largeTitle)
                        .foregroundColor(Color("lightText"))
                    
                }
                Spacer()
                VStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        HStack {
                            Picker("select your favorite club", selection: $selectedTeam) {
                                ForEach(teams, id: \.self) {
                                    Text($0)
                                }
                            }
                            .foregroundColor(Color("lightText"))
                            .pickerStyle(MenuPickerStyle())
                            .padding(.leading, 5)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Your favorite club is:")
                                .foregroundColor(Color("lightText"))
                            Text(selectedTeam)
                                .foregroundColor(Color("lightText"))
                                .bold()
                        }.padding(.leading, 5)
                        Divider()
                            .background(Color("Placeholder"))
                    }
                    
                    VStack(alignment: .leading) {
                        if isEmailTyped(text: user.email) {
                            Text("Email")
                                .foregroundColor(Color("lightText"))
                        }
                        
                        ZStack {
                            HStack {
                                Text(isEmailTyped(text: user.email) ? "" : "Email")
                                    .foregroundColor(Color("Placeholder"))
                                Spacer()
                            }
                            TextField("", text: $user.email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .frame(height: 35)
                                .padding(5)
                                .foregroundColor(Color("lightText"))
                        }
                        Divider()
                            .background(Color("Placeholder"))
                    }
                    .frame(height: 75)
                    .animation(.easeInOut(duration: 0.2))
                    
                    
                    
                    VStack(alignment: .leading) {
                        if isEmailTyped(text: password) {
                            Text("Password")
                                .foregroundColor(Color("lightText"))
                        }
                        ZStack {
                            HStack {
                                Text(isEmailTyped(text: password) ? "" : "password")
                                    .foregroundColor(Color("Placeholder"))
                                Spacer()
                            }
                            SecureField("", text: $password)
                                .frame(height: 35)
                                .padding(5)
                                .foregroundColor(Color("lightText"))
                        }
                        Divider()
                            .background(Color("Placeholder"))
                    }
                    .frame(height: 75)
                    .animation(.easeInOut(duration: 0.2))
                    
                    Spacer()
                    
                    Button("Sign up"){
                        user.favoriteClub = selectedTeam
                        env.signUp(user: user, password: password)
                    }
                    .foregroundColor(Color("lightText"))
                    .modifier(SignInModifier())
                    
                    VStack {
                        Text("Already have an account?")
                            .font(.caption)
                            .foregroundColor(Color("Placeholder"))
                        
                        NavigationLink(
                            destination: SignIn(),
                            label: {
                                Text("Sign in  >")
                                    .font(.caption)
                                    .foregroundColor(Color("Placeholder"))
                            })
                        
                        
                    }.padding(.bottom)
                }
            }
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
