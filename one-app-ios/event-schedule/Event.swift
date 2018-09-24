//
//  Event.swift
//  one-app
//
//  Created by Sunny Feng on 9/23/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import Foundation

class Event {
    
    var description: String
    var start: String
    var startDate: Date
    var end: String
    var endDate: Date
    var location: String
    
    init(description: String, start: String, end: String, location: String) {
        self.description = description
        self.start = start
        self.end = end
        self.location = location
        self.startDate = Date()
        self.endDate = Date()
        self.setDates()
    }
    
    func setStart(start: String) {
        self.start = start
        self.startDate = stringToDate(str: start);
    }
    
    func setDates (){
        self.startDate = stringToDate(str: start)
        self.endDate = stringToDate(str: end)
    }
    
    func stringToDate(str: String) -> Date {
        if (str == "") {
            return Date();
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date (from: str)
        return date!
        
        //let timestampDouble = Double(str)
        //let date = Date(timeIntervalSince1970: TimeInterval(timestampDouble!))
        //return date
    }
    
    func toString () -> String {
        return stringDate(date: startDate) +  "-" + shortStringDate(date: endDate) + ": " + description + " at " + location
    }
    
    func stringDate (date: Date) -> String {
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEE hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: (date as Date?)!)
        return dateString;
        
        //let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        //dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a") // set template after setting locale
        //return dateFormatter.string(from: date as Date)
    }
    
    func shortStringDate (date: Date) -> String {
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: (date as Date?)!)
        return dateString;
        
        //let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        //dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a") // set template after setting locale
        //return dateFormatter.string(from: date as Date)
    }

}

