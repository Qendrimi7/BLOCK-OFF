//
//  ConfirmBolckOffVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/11/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import DeviceKit

class ConfirmBolckOffVC: UIViewController {

    @IBOutlet weak var submitButtonHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        let groupOfAllowedDevices: [Device] = [
            .iPhoneX,
            .iPhoneXR,
            .iPhoneXS,
            .iPhoneXSMax,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax,
            .simulator(.iPhoneX),
            .simulator(.iPhoneXR),
            .simulator(.iPhoneXS),
            .simulator(.iPhoneXSMax),
            .simulator(.iPhone11),
            .simulator(.iPhone11Pro),
            .simulator(.iPhone11ProMax)]
        
        let device = Device.current
        
        if device.isOneOf(groupOfAllowedDevices) {
            submitButtonHeightConstraint.constant = 65
        } else {
            submitButtonHeightConstraint.constant = 43
        }
    }
}
