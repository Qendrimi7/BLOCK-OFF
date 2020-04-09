//
//  UIImageView.swift
//  FoursquareApp
//
//  Created by Qendrim Mjeku on 11/27/19.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.height / 2) 
        self.layer.masksToBounds = true
    }
}

