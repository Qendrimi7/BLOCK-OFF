//
//  HomeModel.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/11/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

class HomeModel {
    let image: UIImage!
    let title: String!
    let startTime: String!
    let endTime: String!
    
    init(
        image: UIImage,
        title: String,
        startTime: String,
        endTime: String
    ) {
        self.image = image
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
    }
}
