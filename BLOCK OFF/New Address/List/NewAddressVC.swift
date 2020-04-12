//
//  NewAddressVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/11/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlacesSearchController

class NewAddressVC: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var fromLocationTextField: UITextField!
    @IBOutlet weak var toLocationTextField: UITextField!
    
    var place: PlaceDetails!
    var london: GMSMarker?
    var londonView: UIImageView?
    let interactor = Interactor()
    var coordinator: HomeCoordinatorProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        title = "Let's block off"
        setupMapView()
        guard let navigationController = navigationController else { return }
        coordinator = HomeCoordinator(presenter: navigationController)
    }
    
    private func setupMapView() {
        
        if let place = place,
            let coordinate = place.coordinate {
            
            let camera = GMSCameraPosition.camera(
                withLatitude: coordinate.latitude,
                longitude: coordinate.longitude,
                zoom: 14
            )
            
            mapView.camera = camera
            mapView.delegate = self
            
        } else {
            let camera = GMSCameraPosition.camera(
                withLatitude: 51.5,
                longitude: -0.127,
                zoom: 14
            )
            
            mapView.camera = camera
            mapView.delegate = self
            
            let barricade = UIImage(named: "app_icon")!
            let markerView = UIImageView(image: barricade)
            londonView = markerView
            
            let positionA = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.127)
            let markerA = GMSMarker(position: positionA)
            markerA.title = "Area A"
            markerA.iconView = markerView
            markerA.tracksViewChanges = true
            markerA.map = mapView
            london = markerA
            
            let positionB = CLLocationCoordinate2D(latitude: 51.4, longitude: -0.187)
            let markerB = GMSMarker(position: positionB)
            markerB.title = "Area B"
            markerB.iconView = markerView
            markerB.tracksViewChanges = true
            markerB.map = mapView
            london = markerB
        }
        
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        coordinator.goToConfirmBlockOffVC(interactor: interactor, presenting: self)
    }
    
    @IBAction func addMoreAction(_ sender: Any) {
    }
    
}

extension NewAddressVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
      UIView.animate(withDuration: 5.0, animations: { () -> Void in
        self.londonView?.tintColor = .blue
        }, completion: {(finished) in
          // Stop tracking view changes to allow CPU to idle.
          self.london?.tracksViewChanges = false
      })
    }
}

