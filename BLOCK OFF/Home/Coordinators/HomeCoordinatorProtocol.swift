//
//  HomeCoordinatorProtocol.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import GooglePlacesSearchController

protocol HomeCoordinatorProtocol {
    func goToNewAddressVC(didAutocompleteWith place: PlaceDetails?, model: HomeModel?)
    func goToConfirmBlockOffVC(interactor: Interactor, presenting: UIViewController)
}

