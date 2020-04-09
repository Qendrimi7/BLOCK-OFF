//
//  Date.swift
//  FoursquareApp
//
//  Created by Qendrim Mjeku on 11/30/19.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import Foundation

extension Date {
    func convertDateToString(date: Date) -> String{
        let dateNow = DateFormatter()
        let islamicCalendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        dateNow.calendar = islamicCalendar
        dateNow.dateFormat = "EEE, MMM d"
        
        return dateNow.string(from: date)
    }
}
