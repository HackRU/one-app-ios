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
    
    static func apiCall() -> [TextAndTs] {
        
        // Url with the data
        let url = URL(string: "https://7c5l6v7ip3.execute-api.us-west-2.amazonaws.com/lcs-test/dayof-slack")
        
        var list = [TextAndTs]()
        
        // not going into here, not working
        DispatchQueue.main.async {
            getData(url: url!) { (textTsList) in
                list = textTsList
                print("HELLO")
            }
        }
        
        print(list)
        
        return list
    }
    
    static func getData(url: URL, completionBlock: @escaping (([TextAndTs]) -> ())) {
        // Creating new thread to handle getting data
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // If data exists, print
            if let data = data {
                var textTsList = [TextAndTs]()
                
                //TEST - take out later
                let textTs = TextAndTs(text : "Test", ts : "12342323423")
                textTsList.insert(textTs, at: 0)
                
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
                    // error
                    return
                }
                
                guard let body = json["body"] as? NSArray else {
                    return
                }
                
                print("AT BODY")
                
                for item in body {
                    print("AT ITEM")
                    
                    let dict = item as! [String: Any?]
                    
                    // print("Dict: \(dict)")
                    
                    guard let text = dict["text"] as? String else {
                        return
                    }
                    
                    //print("Text: \(text)")
                    guard let ts = dict["ts"] as? String else {
                        return
                    }
                    
                    //print("Timestamp: \(ts)")
                    let textTs = TextAndTs(text : text, ts : ts)
                    
                    textTsList.append(textTs)
                }
                
                print("TextListCount: \(textTsList.count)")
                completionBlock(textTsList)
            }
        }
        dataTask.resume()
        
    }

}
