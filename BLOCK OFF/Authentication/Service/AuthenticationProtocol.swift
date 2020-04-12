//
//  AuthenticationProtocol.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/8/20.
//  Copyright © 2019 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthenticationProtocol {
    static func login(email: String, password: String) -> Observable<AutenticationStatus>
    static func register(userData: AuthenticationRegisterData) -> Observable<AutenticationStatus>
    static func sendPasswordReset(email: String) -> Observable<AutenticationStatus>
}

enum AutenticationStatus {
    case none
    case error(String)
    case success(String)
    case successLogin(LoginResponse)
    case successRegister(LoginResponse)
    case successSendPasswordReset(String)
}
