//
//  LoginResponse.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import FirebaseAuth

class LoginResponse {
    
    var displayName: String!
    var email: String!

    init(model: User) {
        displayName = model.displayName
        email = model.email
    }
}
