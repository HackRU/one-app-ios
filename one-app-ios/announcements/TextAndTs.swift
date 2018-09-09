//
//  TextAndTs.swift
//  one-app
//
//  Created by Sunny Feng on 9/6/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class TextAndTs {
    
    var text : String
    var ts : String
    var date : Date
    
    init(text : String, ts : String) {
        self.text = text
        self.ts = ts
        
        let tsDouble = Double(ts)
        let date = Date(timeIntervalSince1970: TimeInterval(tsDouble!))
        self.date = date
    }
    
    func toString () -> String {
        return stringDate(date: date) + ": " + text
    }
    
    func stringDate (date : Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MM-dd-yyyy") // set template after setting locale
        return dateFormatter.string(from: date as Date)
    }

}
