//
//  ForgotPasswordVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPasswordVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendResetPasswordButton: UIButton!
    
    private var emailObservable: Observable<String> {
        return emailTextField.rx.text
            .throttle(0.3, scheduler : MainScheduler.instance).map(){ text in
                return text ?? ""
        }
    }
    
    let disposeBag = DisposeBag()
    var viewModel: ForgotPasswordViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        setupViewModel()
    }
    
    // MARK: - setup view model
    private func setupViewModel() {
        enableResetPassword(enable: false)
        viewModel = ForgotPasswordViewModel(email: emailObservable)
        
        viewModel.resetPasswordEnabled.bind { valid  in
            self.enableResetPassword(enable: valid)
        }.disposed(by: disposeBag)
    }
    
    private func enableResetPassword(enable: Bool) {
        sendResetPasswordButton.isEnabled = enable
        sendResetPasswordButton.alpha = enable ? 1 : 0.5
    }
    
    @IBAction func sendResetPassword(_ sender: Any) {
        self.showProgress()
        viewModel.forgotPassword(
            email: emailTextField.text!
        ).retry(2)
        .subscribe(onNext: { (authenticationStatus) in
            switch authenticationStatus {
            case .successSendPasswordReset(let message):
                self.hideProgress()
                self.showSuccessHUD(message: message)
                self.emailTextField.text = ""
            case .error(let error):
                self.hideProgress()
                self.showErrorHUD(message: error)
            default: break
            }
        })
        .disposed(by: disposeBag)
    }
}
