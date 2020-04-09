//
//  AuthService.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/8/20.
//  Copyright © 2019 Qëndrim Mjeku. All rights reserved.
//

import Foundation
import FirebaseAuth
import RxSwift
import RxCocoa

class AuthService: AuthenticationProtocol {
    
    /**
     * @brief Login with email and password
     */
    static func login(
        email: String,
        password: String
    ) -> Observable<AutenticationStatus> {
        
        return Observable.create { observer in
            
            if !Connectivity.isConnectedToInternet() {
                observer.onNext(.error("No Internet Connection"))
                observer.onCompleted()
            }
            
            Auth.auth().signIn(
                withEmail: email,
                password: password
            ) { authResult, error in
                
                if error != nil {
                    guard let errorDescription = error?.localizedDescription else { return }
                    observer.onNext(.error(errorDescription))
                } else {
                    guard let model = authResult?.user else { return observer.onNext(.error("Somthing went wrong")) }
                    observer.onNext(.successLogin(LoginResponse(model: model)))
                }
            }
            return Disposables.create()
        }
    }
    
    static func register(userData: AuthenticationRegisterData) -> Observable<AutenticationStatus> {
        
        return Observable.create { observer in
            
            if !Connectivity.isConnectedToInternet() {
                observer.onNext(.error("No Internet Connection"))
                observer.onCompleted()
            }
            
            Auth.auth().createUser(
                withEmail: userData.email,
                password: userData.password
            ) { authResult, error in
                
                if error != nil {
                    guard let errorDescription = error?.localizedDescription else { return }
                    observer.onNext(.error(errorDescription))
                } else {
                    guard let model = authResult?.user else { return observer.onNext(.error("Somthing went wrong")) }
                    observer.onNext(.successRegister(LoginResponse(model: model)))
                }
            }
            
            return Disposables.create()
        }
    }
}
