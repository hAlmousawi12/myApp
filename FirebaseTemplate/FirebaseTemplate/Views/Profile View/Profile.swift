//
//  Profile.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/3/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var env: FirebaseEnv
    @State var isAlertPresented = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Form {
                    
                    NavigationLink(
                        destination: ChangeFC(),
                        label: {
                            Text("Change Favorite Team")
                        })
                    
                    Button("Signout") {
                        env.signOut()
                    }
                    .foregroundColor(.red)
                    
                    Button("Reset Password") {
                        Networking.forgetPassword(email: env.user.email)
                        print(env.user.email)
                        isAlertPresented.toggle()
                    }
                    .foregroundColor(.red)
                    .alert(isPresented: $isAlertPresented, content: {
                        Alert(title: Text("Email Sent!"), message: Text("We Have Sent You An Email To Reset Your Password"), dismissButton: .default(Text("Okay!")))
                    })
                }
                VStack {
                    Spacer()
                    
                    TB(color1: Color("Primary3ks"), color2: Color("Primary3ks"), color3: Color("Primary3ks"), color4: Color("Primary3ks"), color5: Color("Primary"))
                        .frame(width: geometry.size.width - 20, height: 90)
                        .cornerRadius(32)
                        .padding(.horizontal, 10)
                        .shadow(color: Color("Color").opacity(0.15), radius: 5, x: 0, y: 5)
                }
            }
        }.navigationBarHidden(true)
        .onAppear {
            env.getUser()
        }
    }
}

