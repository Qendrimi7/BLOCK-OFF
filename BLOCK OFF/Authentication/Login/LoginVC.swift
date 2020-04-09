//
//  LoginVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    var coordinator: AuthenticationCoordinator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    func setupViewDidLoad() {
        guard let navigationController = navigationController else { return }
        coordinator = AuthenticationCoordinator(presenter: navigationController)
    }
    

    @IBAction func forgotPasswordAction(_ sender: Any) {
        coordinator.goToForgotPasswordVC()
    }
    
    @IBAction func createNewAccountAction(_ sender: Any) {
        coordinator.goToRegisterVC()
    }
    
}
