//
//  LoginViewModel.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct LoginViewModel {
    
    let validatedEmail: Observable<Bool>
    let validatedPassword: Observable<Bool>
    let loginEnabled: Observable<Bool>
    
    init(input: (email: Observable<String>, password: Observable<String>)) {
        
        self.validatedEmail = input.email
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.validatedPassword = input.password
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.loginEnabled = Observable.combineLatest(validatedEmail, validatedPassword ) { $0 && $1 }
        
    }
    
    func login(with email: String, password: String) -> Observable<AutenticationStatus> {
        return AuthService.login(email: email, password: password)
    }
    
}

