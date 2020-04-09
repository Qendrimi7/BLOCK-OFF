//
//  UIViewController.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/8/20.
//  Copyright © 2019 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import SVProgressHUD

enum AppStoryboard: String {
    case home = "Home"
    case authentication = "Authentication"
    case countryCode = "CountryCode"
}

extension UIViewController {
    
    func showProgress(show: Bool = true) {
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func hideProgress() {
        SVProgressHUD.dismiss()
    }
    
    func showSuccessHUD(message: String) {
        if message.isEmpty { return }
        SVProgressHUD.showSuccess(withStatus: message)
        SVProgressHUD.dismiss(withDelay: 1.5)
    }
    
    func showErrorHUD(message: String) {
        if message.isEmpty { return }
        SVProgressHUD.showError(withStatus: message)
        SVProgressHUD.dismiss(withDelay: 1.5)
    }
    
    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }

    func setupBackButton() {
        let customBackButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = customBackButton
    }
    
    func attributedText(withString string: String,
                        firstText: String,
                        secoundText: String,
                        font: UIFont) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: string)
        let firstRange = (string as NSString).range(of: " " + firstText)
        let secoundRange = (string as NSString).range(of: " " + secoundText)
        
        attributedString.setAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.red], range: firstRange)
        
        attributedString.setAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.red], range: secoundRange)
    
        return attributedString
    }

}
