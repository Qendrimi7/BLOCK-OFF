//
//  AuthenticationRegisterData.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

struct AuthenticationRegisterData {
    
    var name = ""
    var company = ""
    var email = ""
    var password = ""
    
    init(
        name: String = "",
         company: String = "",
         email: String = "",
         password: String = ""
    ) {
        self.name = name
        self.company = company
        self.email = email
        self.password = password
    }
    
    func generateRaw() -> [String: Any] {
        return [
            "name": name,
            "company": company,
            "email": email,
            "password": password
        ]
    }
    
}
