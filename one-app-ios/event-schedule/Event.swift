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
        self.startDate = stringToDate(str: start)
    }

    func setStartDate(startDate: Date) {
        self.startDate = startDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        self.start = dateFormatter.string(from: (startDate as Date?)!)
    }

    func setDates () {
        self.startDate = stringToDate(str: start)
        self.endDate = stringToDate(str: end)
    }

    func stringToDate(str: String) -> Date {
        if str == "" {
            return Date()
        }
        print("STR: \(str)")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let date = dateFormatter.date (from: str)
        return date!

        //let timestampDouble = Double(str)
        //let date = Date(timeIntervalSince1970: TimeInterval(timestampDouble!))
        //return date
    }

    func toString () -> String {
        var str: String
        str = "Start Time: " + dateToString(date: startDate) + "\n"
        str += "End Time: " + dateToString(date: endDate) + "\n"
        str += "Description: " + description + "\n"
        str += "Location: " + location
        return str
    }

    func dateToString (date: Date) -> String {
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEE hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: (date as Date?)!)
        return dateString

        //let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        //dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a") // set template after setting locale
        //return dateFormatter.string(from: date as Date)
    }

    /*
    func shortStringDate (date: Date) -> String {

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"
        let dateString = dayTimePeriodFormatter.string(from: (date as Date?)!)
        return dateString

        //let dateFormatter = DateFormatter()
        //dateFormatter.locale = Locale(identifier: "en_US")
        //dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a") // set template after setting locale
        //return dateFormatter.string(from: date as Date)
    } */

}
