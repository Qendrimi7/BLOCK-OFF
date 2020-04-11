//
//  UIView.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2019 Qëndrim Mjeku. All rights reserved.
//

import UIKit

extension UIView {
    
    func activityStartAnimating(activityColor: UIColor = UIColor.gray, backgroundColor: UIColor = UIColor.clear) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: -70, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    
    func setCardView(view : UIView){
        view.layer.cornerRadius = 7.0
        view.layer.borderColor  =  UIColor.clear.cgColor
        view.layer.borderWidth = 7.0
        view.layer.shadowOpacity = 0.23
        view.layer.shadowColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.26).cgColor
        view.layer.shadowRadius = 7.0
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.masksToBounds = false
    }
}
