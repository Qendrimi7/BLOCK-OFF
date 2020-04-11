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
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "123 Wilmington rd DE 20203",
            startTime: "2020/01/18 8:00 AM",
            endTime: "2020/01/19 9:00 AM")
        )
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "243 Bowie rd MD",
            startTime: "2020/02/22 11:00 AM",
            endTime: "2020/02/23 9:00 AM")
        )
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "Steward cat NC 2302",
            startTime: "2020/03/15 7:00 AM",
            endTime: "2020/03/17 9:00 AM")
        )
        
        items.append(HomeModel(
            image: UIImage(named: "app_icon")!,
            title: "1235 Apple place way",
            startTime: "2020/04/03 8:00 AM",
            endTime: "2020/04/08 10:00 AM")
        )
        
        return items
    }
}
