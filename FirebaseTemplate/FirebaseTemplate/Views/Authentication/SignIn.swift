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
                        
                        Text("Sign in")
                            .foregroundColor(Color("lightText"))
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 40) {
                        VStack(alignment: .leading) {
                            if !userCredentials.email.isEmpty {
                            Text("E-Mail")
                                .foregroundColor(Color("lightText"))
                                .font(.system(size: 15.5, weight: .semibold))
                            }
                            ZStack {
                                if userCredentials.email.isEmpty {
                                    HStack {
                                        Text("E-Mail")
                                            .foregroundColor(Color("Placeholder"))
                                        Spacer()
                                    }
                                }
                                VStack {
                                    TextField("", text: $userCredentials.email)
                                        .disableAutocorrection(true)
                                        .keyboardType(.emailAddress)
                                        .foregroundColor(Color("lightText"))
                                    Divider()
                                        .background(Color("Placeholder"))
                                }
                                
                            }
                        }
                        VStack(alignment: .leading) {
                            if !userCredentials.password.isEmpty {
                            Text("Password")
                                .foregroundColor(Color("lightText"))
                                .font(.system(size: 15.5, weight: .semibold))
                            }
                            ZStack {
                                if userCredentials.password.isEmpty {
                                    HStack {
                                        Text("Password")
                                            .foregroundColor(Color("Placeholder"))
                                        Spacer()
                                    }
                                }
                                VStack {
                                    SecureField("", text: $userCredentials.password)
                                        .foregroundColor(Color("lightText"))
                                    Divider()
                                        .background(Color("Placeholder"))
                                    
                                }
                            }
                            VStack {
                                HStack {
                                    Text("Forgot your password? ")
                                        .foregroundColor(Color("Placeholder"))
                                    Button(action: {
                                        env.forgotPass(email: userCredentials.email) {
                                            alertShown = true
                                            alertError = "Email has been sent to your email"
                                        } fail: { err in
                                            alertShown = true
                                            alertError = err?.localizedDescription ?? ""
                                        }
                                        
                                    }, label: {
                                        Text("Click here")
                                            .foregroundColor(Color("lightText"))
                                    })
                                }
                            }.padding(.top, 20)
                        }
                    }
                    .frame(width: geometry.size.width - 50)
                    .animation(.easeInOut(duration: 0.2))
                    
                    Spacer()
                    
                    Button(action: {
                        env.signIn(user: userCredentials) { (uid) in

                            print("Signed in!")
                        } fail: { (error) in
                            alertError = error.debugDescription
                            alertShown = true
                        }
                    }, label: {
                        Text("Sign in")
                            .font(.title2)
                            .foregroundColor(Color("lightText"))
                    })
                    .frame(width: geometry.size.width - 120, height: 60)
                    .background(Color("Primary"))
                    .cornerRadius(10)
                    .shadow(color: Color("Primary"), radius: 10, x: 0, y: 10)
                    
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Don't have an account?")
                            NavigationLink(
                                destination: SignUp(),
                                label: {
                                    Text("Sign up  >")
                                })
                        }
                        Spacer()
                    }
                    .font(.system(size: 12.5))
                    .foregroundColor(Color("Placeholder"))
                    .padding(.leading, 30)
                    Spacer()
                    Spacer()
                }
            }
        }.alert(isPresented: $alertShown, content: {
            Alert(title: Text("Error!"), message: Text(alertError), dismissButton: .cancel())
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .preferredColorScheme(.dark)
            .environmentObject(FirebaseEnv())
    }
}
