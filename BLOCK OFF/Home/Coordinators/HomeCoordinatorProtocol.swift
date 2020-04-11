//
//  HomeCoordinatorProtocol.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

protocol HomeCoordinatorProtocol {
    func goToNewAddressVC()
    func goToConfirmBlockOffVC(interactor: Interactor, presenting: UIViewController)
}

