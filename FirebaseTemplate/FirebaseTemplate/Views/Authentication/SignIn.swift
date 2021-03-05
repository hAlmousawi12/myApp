//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignIn: View {
    @State var userCredentials = SignInCredentials(email: "", password: "")
    @EnvironmentObject var env: FirebaseEnv
    @State var alertShown: Bool = false
    @State var alertError: String = ""
    
    var body: some View {
        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            VStack{
                
                Image("LogoNo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text("Sign in")
                    .font(.largeTitle)
                    .foregroundColor(Color("lightText"))
                Spacer()
                
                VStack(alignment: .leading) {
                    if isEmailTyped(text: userCredentials.email) {
                        Text("E-mail")
                            .foregroundColor(Color("lightText"))
                    }
                    
                    TextField(isEmailTyped(text: userCredentials.email) ? "" : "E-mail", text: $userCredentials.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(5)
                        .foregroundColor(Color("lightText"))
                }
                .frame(height: 75)
                .animation(.easeInOut(duration: 0.2))
                Divider()
                
                VStack(alignment: .leading) {
                    if isEmailTyped(text: userCredentials.password) {
                        Text("Password")
                            .foregroundColor(Color("lightText"))
                    }
                    SecureField(isEmailTyped(text: userCredentials.password) ? "" : "password", text: $userCredentials.password)
                        .frame(height: 35)
                        .padding(5)
                        .foregroundColor(Color("lightText"))
                }
                .frame(height: 75)
                .animation(.easeInOut(duration: 0.2))
                Divider()
                Spacer()
                Button("Sign in"){
                    env.signIn(user: userCredentials) { (uid) in
                        print("Signed in!")
                    } fail: { (error) in
                        alertError = error.debugDescription
                        alertShown = true
                    }
                }
                .foregroundColor(Color("lightText"))
                .modifier(SignInModifier())
                VStack(alignment: .leading) {
                    Text("Don't have an account?")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    NavigationLink(
                        destination: SignUp(),
                        label: {
                            Text("Sign up  >")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        })

                    
                }.padding(.bottom)
            }
        }
    }
    func isEmailTyped(text: String) -> Bool {
        text != ""
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .preferredColorScheme(.dark)
            .environmentObject(FirebaseEnv())
    }
}
