//
//  ForgotPasswordViewModel.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/12/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ForgotPasswordViewModel {
    
    let validatedEmail: Observable<Bool>
    var resetPasswordEnabled: Observable<Bool>
    
    init(
        email: (Observable<String>)
    ) {
        
        self.validatedEmail = email
            .map { $0.count > 3 }
            .share(replay: 1)
        
        self.resetPasswordEnabled = Observable.asObservable(validatedEmail)()
    }
    
    func forgotPassword(
        email: String
    ) -> Observable<AutenticationStatus> {
        return AuthService.sendPasswordReset(email: email)
    }
}
