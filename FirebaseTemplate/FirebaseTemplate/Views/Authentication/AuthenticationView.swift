//
//  AuthenticationView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI
//import GoogleSignIn
//import FBSDKLoginKit
struct AuthenticationView: View {
//    @AppStorage("logged") var logged = false
//    @AppStorage("email") var email = ""
//    @State var manager = LoginManager()
    @EnvironmentObject var env: FirebaseEnv
    var body: some View {
        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            VStack {
                Image("LogoNo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                    .cornerRadius(15)
                    .padding(.top, 50)
                
                Spacer()
                NavigationLink(
                    destination: SignIn(),
                    label: {
                        Text("Login")
                            .foregroundColor(Color("lightText"))
                            .modifier(SignInModifier())
                        
                        
                    }
                )
                NavigationLink(
                    destination: SignUp(),
                    label: {
                        Text("Register")
                            .foregroundColor(Color("lightText"))
                            .modifier(SignInModifier())
                        
                    }
                )
                Spacer()
                //                Button(action: {
                //                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                //
                //                    GIDSignIn.sharedInstance()?.signIn()
                //
                //                    env.signedIn = true
                //                }, label: {
                //                    Text("LOG IN WITH GOOGLE")
                //                        .font(.system(size: 12.5, weight: .light))
                //
                //                        })
                //
                //                Button(action: {
                //                    manager.logIn(permissions: ["public_profile", "email"], from: nil) { result, err in
                //                        if err != nil {
                //                            print("❌❌❌❌❌\n")
                //                            print(err!.localizedDescription)
                //                        } else {
                //                        if !result!.isCancelled {
                //                            logged = true
                //
                //                            let request = GraphRequest(graphPath: "me", parameters: ["fields" : "email"])
                //
                //                            request.start { _, res, _ in
                //
                //                                guard let profileData = res as? [String : Any] else { return }
                //
                //                                email = profileData["email"] as! String
                //                                print(email)
                //                            }
                //                        }
                //                    }
                //                        if email != "" {
                //                            env.signedIn = true
                //                        }
                //                    }
                //
                //                }, label: {
                //                    Text("LOG IN WITH Facebook")
                //                        .font(.system(size: 12.5, weight: .light))
                //
                //                        })
                //
                //                Button(action: {
                //                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                //
                //                    GIDSignIn.sharedInstance()?.signIn()
                //
                //                }, label: {
                //                    Text("LOG IN WITH Twitter")
                //                        .font(.system(size: 12.5, weight: .light))
                //
                //                        })
                //                Button(action: {
                //                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                //
                //                    GIDSignIn.sharedInstance()?.signIn()
                //
                //                }, label: {
                //                    Text("LOG IN WITH Github")
                //                        .font(.system(size: 12.5, weight: .light))
                //
                //                        })
            }
        }
    }
}

struct SignInModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
            .background(Color("Primary"))
            .cornerRadius(10)
            .padding(.horizontal)
            
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .preferredColorScheme(.light)
    }
}
