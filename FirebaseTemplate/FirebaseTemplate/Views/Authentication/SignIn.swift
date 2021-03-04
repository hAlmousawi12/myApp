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
                Spacer()
                
                VStack(alignment: .leading) {
                    if isEmailTyped(text: userCredentials.email) {
                        Text("Email")
                            .foregroundColor(Color("lightText"))
                    }
                    
                    TextField(isEmailTyped(text: userCredentials.email) ? "" : "Email", text: $userCredentials.email)
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
                    if isEmailTyped(text: userCredentials.password) {
                        Text("Password")
                            .foregroundColor(Color("lightText"))
                    }
                    SecureField(isEmailTyped(text: userCredentials.password) ? "" : "password", text: $userCredentials.password)
                        .frame(height: 35)
                        .padding(5)
                        .background(Color("Primary"))
                        .foregroundColor(Color("lightText"))
                        .cornerRadius(5)
                }
                .frame(height: 75)
                .animation(.easeInOut(duration: 0.2))
                
                Spacer()
                Button("Sign in"){
                    env.signIn(user: userCredentials) { (uid) in
                        print("Signed in!")
                    } fail: { (error) in
                        alertError = error.debugDescription
                        alertShown = true
                    }
                }
                .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
                .frame(height: 35)
                .padding(5)
                .background(Color("Primary"))
                .foregroundColor(Color("lightText"))
                .cornerRadius(5)
                
                NavigationLink("Don't have an account?", destination: SignUp())
                    .foregroundColor(Color("lightText"))
            }
            .alert(isPresented: $alertShown, content: {
                Alert(title: Text("Error!"), message: Text(alertError), dismissButton: .cancel())
            })
            .padding()
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
