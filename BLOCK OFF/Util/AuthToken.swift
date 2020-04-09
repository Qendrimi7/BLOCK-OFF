//
//  AuthToken.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2019 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import GoogleSignIn

struct AuthToken {
    /**
     * @brief Logout
     */
    static func logOut() {
        GIDSignIn.sharedInstance().signOut()
        AppCoordinator().setupAppNavigation()
    }
}
