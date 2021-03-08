//
//  UserEnv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 3/5/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI
import FirebaseAuth

class UserEnv: ObservableObject{
    @Published var user = User()
    @Published var userFC: String = ""
    var uid = Networking.getUserId() ?? ""
    let collectionName = "users"
    func getUser() {
        Networking.getSingleDocument("users/\(uid)") { (user: User) in
            self.user = user
        }
    }
    
    func getUserFC() {
        Networking.getSingleDocument("users/\(uid)") { (FC: User) in
            self.userFC = FC.favoriteClub
            
        }
    }
    
    func updateUser(updatedUser: User, succes: @escaping ()->Void, fail: @escaping (Error?)->Void) {
        Networking.createItem(updatedUser, inCollection: collectionName, withDocumentId: uid) {
            succes()
        } fail: { err in
            fail(err)
        }

    }
}
