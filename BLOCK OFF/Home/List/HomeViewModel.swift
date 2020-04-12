//
//  HomeViewModel.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/11/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

struct HomeViewModel {
    

    func getData() -> [HomeModel] {
        var items: [HomeModel] = []
        
        let firstItem = CordinateArea(areaA: (latitude: 41.235566, longitude: -103.648742),
                                  areaB: (latitude: 41.235296, longitude: -103.648851),
                                  areaC: (latitude: 41.235346, longitude: -103.650726),
                                  areaD: (latitude: 41.235566, longitude: -103.650718))
    
        let secoundItem = CordinateArea(areaA: (latitude: 43.836565, longitude: -101.741683),
                                  areaB: (latitude: 43.850243, longitude: -101.741254),
                                  areaC: (latitude: 43.850240, longitude: -101.721447),
                                  areaD: (latitude: 43.835557, longitude: -101.721389))
        

        let thirdItem = CordinateArea(areaA: (latitude: 44.362094, longitude: -100.328664),
                                  areaB: (latitude: 44.363057, longitude: -100.328664),
                                  areaC: (latitude: 44.363024, longitude: -100.327240),
                                  areaD: (latitude: 44.362050, longitude: -100.327224))
        
        let forthItem = CordinateArea(areaA: (latitude: 39.751081, longitude: -104.944302),
                                  areaB: (latitude: 39.751000, longitude: -104.944242),
                                  areaC: (latitude: 39.750908, longitude: -104.942813),
                                  areaD: (latitude: 39.751046, longitude: -104.942565))
        
     
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "Address: Kimball, NE 69145, USA",
            startTime: "2020/01/18 8:00 AM",
            endTime: "2020/01/19 9:00 AM",
            cordinateArea: firstItem)
        )
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "Address: Kadoka, SD 57543, USA",
            startTime: "2020/02/22 11:00 AM",
            endTime: "2020/02/23 9:00 AM",
            cordinateArea: secoundItem)
        )
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "Address: Pierre, SD 57501, USA",
            startTime: "2020/03/15 7:00 AM",
            endTime: "2020/03/17 9:00 AM",
            cordinateArea: thirdItem)
        )
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "Address: Colorado 80205, USA",
            startTime: "2020/04/03 8:00 AM",
            endTime: "2020/04/08 10:00 AM",
            cordinateArea: forthItem)
        )
        
        return items
    }
}
