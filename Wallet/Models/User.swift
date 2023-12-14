//
//  User.swift
//  Wallet
//
//  Created by Тагай Абдылдаев on 2023/12/14.
//

import Foundation
import Firebase
import FirebaseAuth

struct UserModel {
    let uid: String
    let email: String?
    
    init(firebaseUser: User) {
        self.uid = firebaseUser.uid
        self.email = firebaseUser.email
    }
}
