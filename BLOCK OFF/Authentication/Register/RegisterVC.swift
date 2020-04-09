//
//  RegisterVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private var nameObservable: Observable<String> {
        return nameTextField.rx.text
            .throttle(0.3, scheduler : MainScheduler.instance).map(){ text in
                return text ?? ""
        }
    }
    
    private var companyObservable: Observable<String> {
        return companyTextField.rx.text
            .throttle(0.3, scheduler : MainScheduler.instance).map(){ text in
                return text ?? ""
        }
    }
    
    private var emailObservable: Observable<String> {
        return emailTextField.rx.text
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
    
    let disposeBag = DisposeBag()
    var viewModel: RegisterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    func setupViewDidLoad() {
        enableLogin(enable: false)
        setupViewModel()
    }
    
    // MARK: - setup view model
    private func setupViewModel() {
        
        viewModel = RegisterViewModel(
            input: (name: self.nameObservable,
                    company: self.companyObservable,
                    email: self.emailObservable,
                    password: self.passwordObservable)
        )
        
        viewModel.registerEnabled.bind { valid  in
            self.enableLogin(enable: valid)
        }.disposed(by: disposeBag)
    }
    
    //MARK: Views
    func enableLogin(enable: Bool) {
        registerButton.isEnabled = enable
        registerButton.alpha = enable ? 1 : 0.5
    }
    
    @IBAction func registerAction(_ sender: Any) {
        viewModel.register(
            with: nameTextField.text!,
            company: companyTextField.text!,
            email: emailTextField.text!,
            password: passwordTextField.text!
        ).retry(2)
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
    
    
}
