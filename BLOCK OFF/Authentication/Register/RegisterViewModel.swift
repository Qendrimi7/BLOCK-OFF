//
//  RegisterViewModel.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct RegisterViewModel {
    
    let validatedName: Observable<Bool>
    let validatedCompany: Observable<Bool>
    let validatedEmail: Observable<Bool>
    let validatedPassword: Observable<Bool>
    let registerEnabled: Observable<Bool>
    
    init(
        input: (name: Observable<String>,
        company: Observable<String>,
        email: Observable<String>,
        password: Observable<String>)
    ) {
        
        self.validatedName = input.name
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.validatedCompany = input.company
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.validatedEmail = input.email
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.validatedPassword = input.password
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.registerEnabled = Observable.combineLatest(
            validatedName,
            validatedCompany,
            validatedEmail,
            validatedPassword
        ) {
            $0 && $1 && $2 && $3
        }
    }
    
    func register(
        with name: String,
        company: String,
        email: String,
        password: String
    ) -> Observable<AutenticationStatus> {
        let model = AuthenticationRegisterData(name: name,
                                               company: company,
                                               email: email,
                                               password: password)
        
        return AuthService.register(userData: model)
    }
    
}

