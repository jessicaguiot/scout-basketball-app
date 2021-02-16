//
//  DataHandler.swift
//  scout-basketball-app
//
//  Created by Jéssica Araujo on 16/02/21.
//

import Foundation
import UIKit

class DateHandler {
    func currentDate() -> Date {
        
        return Date()
    }
}

extension Date {
    
    func tomorrow(inDirection direction: Calendar.SearchDirection = .forward,
                  using calendar: Calendar = .current) -> Date {
        
        let components = calendar.dateComponents([.hour, .minute, .second, .nanosecond], from: self)
        
        return calendar.nextDate(after: self, matching: components, matchingPolicy: .nextTime, direction: direction)!
    }
}
