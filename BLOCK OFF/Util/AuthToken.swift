//
//  AuthToken.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import FirebaseAuth

struct AuthToken {
    /**
     * @brief Logout
     */
    static func logOut() {
       let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
          AppCoordinator().setupAppNavigation()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
}
