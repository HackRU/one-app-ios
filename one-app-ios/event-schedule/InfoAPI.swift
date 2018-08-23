//
//  InfoAPI.swift
//  one-app
//
//  Created by Sunny Feng on 8/23/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class InfoAPI: NSObject {
    override init() {
       
    }
    
    static func apiCall() {
        // TODO: get a Google Calendar information and load it in as practice
        // Create auth token from Google Calendar API and do it from there
        // Once LCS is working, load it in with that
        
        // Url with the data
        let url = URL(string: "https://api.iextrading.com/1.0/stock/aapl/book")
        
        // Creating new thread to handle getting data
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            // If data exists, print
            if let data = data {
                print("Data: \(data)")
                
                // Dictionary with String key and any object as value
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any?] else {
                    // If didn't work, return
                    return
                }
                guard let quote = json["quote"] as? [String: Any?] else {
                    return
                }
                guard let ytdChange = quote["ytdChange"] as? Double else {
                    return
                }
                print("ytdChange = \(ytdChange)")
                print("Quote: \(quote)")
            }
            // If response code/http info exists, print
            if response != nil {
                // print("Response: \(response)")
            }
            
            // If error, print error
            if let error = error {
                print("Error: \(error)")
            }
        }
        
        // Run the thread
        dataTask.resume()
    }
    
}
