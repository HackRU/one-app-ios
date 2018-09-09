//
//  InfoAPI.swift
//  one-app
//
//  Created by Sunny Feng on 8/23/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class InfoAPI: NSObject {
    
    //oAuth ID: key name = calendar-key, 
    override init() {
       
    }
    
    static func apiCall() -> [TextAndTs] {
        
        var textTsList = [TextAndTs]()
        
        // Url with the data
        let url = URL(string: "https://7c5l6v7ip3.execute-api.us-west-2.amazonaws.com/lcs-test/dayof-events")
        
        // Creating new thread to handle getting data
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            // If data exists, print
            if let data = data {
               // print("Data: \(data)")
                
                // Dictionary with String key and any object as value
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any?] else {
                    // If didn't work, return
                    return
                }
                
                guard let statusCode = json["statusCode"] as? Int else {
                    return
                }
                
                // check for status code
                if (statusCode != 200) {
                    //error
                }
                
                guard let body = json["body"] as? NSArray else {
                    return
                }
                print("Body: \(body)")
                
                for item in body {
                    print("Item: \(item)")
                    let dict = item as! [String: Any?]
                    print("Dict: \(dict)")
                    guard let summary = dict["summary"] as? String else {
                        return
                    }
                    
                    print("Text: \(summary)")
                    guard let ts = dict["ts"] as? String else {
                        return
                    }
                    
                    let tsDouble = Double(ts)
                    let date = NSDate(timeIntervalSince1970: TimeInterval(tsDouble!))
                
                    print("Timestamp: \(ts)")
                    
                    let textTs = TextAndTs(text : summary, ts : ts)
                    textTsList.append(textTs)
                }
            }
        }
        
        // Run the thread
        dataTask.resume()
        
        return textTsList
    }
    
}
