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
        Form {
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
        }.onAppear {
            env.getUser()
        }
    }
}

