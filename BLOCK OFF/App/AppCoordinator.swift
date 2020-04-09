//
//  AppCoordinator.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import RxSwift
import RxCocoa
import GoogleSignIn

class AppCoordinator {
    
    private var window: UIWindow?
    let disposeBag = DisposeBag()
    
    func setupAppNavigation(window: UIWindow? = UIApplication.shared.keyWindow) {
        
        self.window = window
        customizeNavigation()
        
        //Check if user is logged in
        if let hasPreviousSignIn = GIDSignIn.sharedInstance()?.hasPreviousSignIn {
            if hasPreviousSignIn(){
                presentApp()
                UIApplication.shared.statusBarStyle = .default
            }else{
                self.presentLoginVC()
                UIApplication.shared.statusBarStyle = .default
            }
        } else {
            
            UIApplication.shared.statusBarStyle = .default
        }
    }
    
    fileprivate func presentLoginVC() {
        let loginVC: LoginVC = LoginVC.instantiate(appStoryboard: .authentication)
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    fileprivate func presentApp() {
        if let mainVC = UIStoryboard(name: AppStoryboard.home.rawValue, bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
            let nvc: UINavigationController = UINavigationController(rootViewController: mainVC)
            window?.rootViewController = nvc
            window?.makeKeyAndVisible()
        }
    }
    
    func customizeNavigation() {
        UIApplication.shared.statusBarStyle = .lightContent
        // Sets background to a blank/empty image
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        // Remove seperator view
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = false
        //Tint color
        UINavigationBar.appearance().tintColor = UIColor.darkText
        //Text title color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.darkText]
    }
}

