//
//  TextAndtimestamp.swift
//  one-app
//
//  Created by Sunny Feng on 9/6/18.
//  Copyright © 2018 HackRU. All rightimestamp reserved.
//

import UIKit

class TextAndTs {

    var text: String
    var timestamp: String
    var date: Date

    init(text: String, timestamp: String) {
        self.text = text
        self.timestamp = timestamp
        print(timestamp)
//        let timestampDouble = Double(text)
        let date = Date(timeIntervalSinceNow: Double(timestamp)!)
        self.date = date
    }

    func toString () -> String {
        return stringDate(date: date) + ": " + text
    }

    func stringDate (date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("hh:mm a") // set template after setting locale
        return dateFormatter.string(from: date as Date)
    }

}
