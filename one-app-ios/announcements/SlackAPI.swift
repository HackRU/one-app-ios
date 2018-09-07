//
//  SlackAPI.swift
//  one-app
//
//  Created by Sunny Feng on 9/6/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class SlackAPI: NSObject {
    
    override init() {
        
    }
    
    static func apiCall() {
        // TODO: get a Google Calendar information and load it in as practice
        // Create auth token from Google Calendar API and do it from there
        // Once LCS is working, load it in with that
        
        // Url with the data
        let url = URL(string: "https://7c5l6v7ip3.execute-api.us-west-2.amazonaws.com/lcs-test/dayof-slack")
        
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
                    guard let text = dict["text"] as? String else {
                        return
                    }
                    
                    print("Text: \(text)")
                    guard let ts = dict["ts"] as? String else {
                        return
                    }
                    
                    let tsDouble = Double(ts)
                    let date = NSDate(timeIntervalSince1970: TimeInterval(tsDouble!))
                    
                    print("Timestamp: \(ts)")
                    
                    // add TextandTs to array and return that array
                }
            }
        }
        
        // Run the thread
        dataTask.resume()
        
    }

}
