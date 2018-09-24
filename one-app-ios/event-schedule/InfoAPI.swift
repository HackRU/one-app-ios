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

    //This is creating a completion handler that will return once the thread is done
    static func apiCall(completion: @escaping ([TextAndTs]) -> Void) {

        var textTsList = [TextAndTs]()

        // Url with the data
        let url = URL(string: "\(api_endpoint)dayof-events")

        // Creating new thread to handle getting data
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, _, _) in

            // If data exists, print
            if let data = data {
               // print("Data: \(data)")

                // Dictionary with String key and any object as value
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any?] else {
                    // If didn't work, return
                    return
                }

                guard let statusCode = json!["statusCode"] as? Int else {
                    return
                }

                // check for status code
                if statusCode != 200 {
                    //error
                }

                guard let body = json!["body"] as? NSArray else {
                    return
                }
                //print("Body: \(body)")

                for item in body {
                    //print("Item: \(item)")
                    guard let dict = item as? [String: Any] else {
                        return
                    }
                    //print("Dict: \(dict)")
                    guard let summary = dict["summary"] as? String else {
                        return
                    }

                    print("Text: \(summary)")
                    guard let timestamp = dict["created"] as? String else {
                        print("TIME STAMP FAILE")
                        return
                    }

                    //let tsDouble = Double(timestamp)
                    //let date = NSDate(timeIntervalSince1970: TimeInterval(tsDouble!))

                    //print("Timestamp: \(timestamp)")

                    let textTs = TextAndTs(text: summary, timestamp: timestamp)
                    textTsList.append(textTs)
                    print(textTs.text)

                    //This is using the completion handle.
                    completion(textTsList)

                }
            }
        }

        // Run the thread
        dataTask.resume()

    }

}
