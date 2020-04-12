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
    
    func forgotPassword(
        email: String
    ) -> Observable<AutenticationStatus> {
        return AuthService.sendPasswordReset(email: email)
    }
}
