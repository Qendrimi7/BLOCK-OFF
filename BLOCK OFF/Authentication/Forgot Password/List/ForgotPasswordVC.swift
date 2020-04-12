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
    
    @IBOutlet weak var forgotPasswordTextField: UITextField!
    
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
        viewModel = ForgotPasswordViewModel()
    }
    
    @IBAction func sendResetPassword(_ sender: Any) {
        self.showProgress()
        viewModel.forgotPassword(
            email: forgotPasswordTextField.text!
        ).retry(2)
        .subscribe(onNext: { (authenticationStatus) in
            switch authenticationStatus {
            case .successSendPasswordReset(let message):
                self.hideProgress()
                self.showSuccessHUD(message: message)
                self.forgotPasswordTextField.text = ""
            case .error(let error):
                self.hideProgress()
                self.showErrorHUD(message: error)
            default: break
            }
        })
        .disposed(by: disposeBag)
    }
}
