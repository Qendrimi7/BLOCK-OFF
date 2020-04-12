//
//  HomeCoordinator.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import GooglePlacesSearchController

class HomeCoordinator: HomeCoordinatorProtocol {

    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func goToNewAddressVC(didAutocompleteWith place: PlaceDetails?) {
        let nextVC: NewAddressVC = NewAddressVC.instantiate(appStoryboard: .home)
        nextVC.place = place
        presenter.pushViewController(nextVC, animated: true)
    }
    
    func goToConfirmBlockOffVC(interactor: Interactor, presenting: UIViewController) {
        let nextVC: ConfirmBolckOffVC = ConfirmBolckOffVC.instantiate(appStoryboard: .home)
        let modalVC = CustomPresentationController(presentedViewController: nextVC, presenting: presenting, interactor: interactor)
        nextVC.transitioningDelegate = modalVC
        nextVC.modalPresentationStyle = .custom
        presenter.present(nextVC, animated: true, completion: nil)
    }
}
