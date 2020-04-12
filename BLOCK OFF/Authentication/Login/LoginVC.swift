//
//  LoginVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import UIKit
import RxSwift
import RxCocoa
import GoogleSignIn

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let disposeBag = DisposeBag()
    var coordinator: AuthenticationCoordinator!
    var viewModel: LoginViewModel!
    
    private var emailObservable: Observable<String> {
        return usernameTextField.rx.text
            .throttle(0.3, scheduler : MainScheduler.instance).map(){ text in
                return text ?? ""
        }
    }
    
    private var passwordObservable: Observable<String> {
        return passwordTextField.rx.text
            .throttle(0.3, scheduler : MainScheduler.instance).map(){ text in
                return text ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    func setupViewDidLoad() {
        guard let navigationController = navigationController else { return }
        coordinator = AuthenticationCoordinator(presenter: navigationController)
        enableLogin(enable: false)
        setupViewModel()
        setupBackButton(title: "back")
    }
    
    // MARK: - setup view model
    private func setupViewModel() {
        
        viewModel = LoginViewModel(input: (email: self.emailObservable, password: self.passwordObservable))
        
        viewModel.loginEnabled.bind { valid  in
            self.enableLogin(enable: valid)
        }.disposed(by: disposeBag)
    }
    
    //MARK: Views
    func enableLogin(enable: Bool) {
        loginButton.isEnabled = enable
        loginButton.alpha = enable ? 1 : 0.5
    }
    
    func loading(show: Bool) {
        self.view.viewWithTag(999)?.isHidden = show
        self.view.viewWithTag(998)?.isHidden = show
        self.view.viewWithTag(997)?.isHidden = show
        if show {
            self.view.activityStartAnimating()
        } else {
            self.view.activityStopAnimating()
        }
    }
    
    @IBAction func showPasswordAction(_ sender: Any) {
        passwordTextField.isSecureTextEntry  = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        coordinator.goToForgotPasswordVC()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.showProgress()
        viewModel.login(with: usernameTextField.text!, password: passwordTextField.text!)
            .retry(2)
            .subscribe(onNext: { (authenticationStatus) in
                switch authenticationStatus {
                case .successLogin( _):
                    AppCoordinator().setupAppNavigation()
                case .error(let error):
                    self.showErrorHUD(message: error)
                default: break
                }
            })
            .disposed(by: disposeBag)
    }
    
    
    @IBAction func createNewAccountAction(_ sender: Any) {
        coordinator.goToRegisterVC()
    }
    
}
