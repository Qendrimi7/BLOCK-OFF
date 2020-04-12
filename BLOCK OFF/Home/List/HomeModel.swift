//
//  HomeModel.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/11/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

struct CordinateArea {
    var areaA: (latitude: Double, longitude: Double)
    var areaB: (latitude: Double, longitude: Double)
    var areaC: (latitude: Double, longitude: Double)
    var areaD: (latitude: Double, longitude: Double)
}

class HomeModel {
    let image: UIImage!
    let title: String!
    let startTime: String!
    let endTime: String!
    let cordinateArea: CordinateArea!
    
    init(
        image: UIImage,
        title: String,
        startTime: String,
        endTime: String,
        cordinateArea: CordinateArea!
    ) {
        self.image = image
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.cordinateArea = cordinateArea
    }
}
