//
//  FirebaseEnv.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI
import FirebaseAuth

class FirebaseEnv: ObservableObject{
    @Published var signedIn: Bool = (FirebaseAuth.Auth.auth().currentUser != nil)
    @Published var user = User()
    
    func signIn(user: SignInCredentials, success: @escaping (String) -> Void,  fail: ((Error?) -> Void)?){
        Networking.signIn(user: user, success: { uid in
            self.signedIn = true
            success(uid)
        }, fail: fail)
    }
    
    func signOut(){
        Networking.signOut()
        self.signedIn = false
    }
    
    func signUp(user: User, password: String){
        Networking.signUp(user: user, password: password) { (uid) in
            self.signedIn = true
        }
    }
    
    func forgotPass(email: String, success: @escaping () -> Void, fail: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) {error in
            
            if error == nil {
                success()
            } else {
                fail(error)
            }
        }
    }
    
    func getUser() {
        let userId = Networking.getUserId()
        
        Networking.getSingleDocument("users/\(userId!)") { (user: User) in
            self.user = user
            
        }
    }
}
