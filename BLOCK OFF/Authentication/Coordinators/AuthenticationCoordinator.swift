//
//  AuthenticationCoordinator.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

class AuthenticationCoordinator: AuthenticationCoordinatorProtocol {
    
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func goToForgotPasswordVC() {
        let nextVC: ForgotPasswordVC = ForgotPasswordVC.instantiate(appStoryboard: .authentication)
        presenter.pushViewController(nextVC, animated: true)
    }
    
    func goToRegisterVC() {
        let nextVC: RegisterVC = RegisterVC.instantiate(appStoryboard: .authentication)
        presenter.pushViewController(nextVC, animated: true)
    }

}
