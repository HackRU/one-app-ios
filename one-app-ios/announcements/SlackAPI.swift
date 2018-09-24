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

    static func apiCall(completion: @escaping ([TextAndTs]) -> Void) {
        let url = URL(string: "\(apiEndpoint)dayof-slack")
        var textTsList = [TextAndTs]()

        // Creating new thread to handle getting data
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, _, _) in
            // If data exists, print
            if let data = data {

                // Dictionary with String key and any object as value
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    // If didn't work, return
                    return
                }

                guard let statusCode = json!["statusCode"] as? Int else {
                    return
                }

                // check for status code
                if statusCode != 200 {
                    // error
                    return
                }

                guard let body = json!["body"] as? NSArray else {
                    return
                }

                for item in body {

                    guard let dict = item as? [String: Any] else {
                        return
                    }

                    // print("Dict: \(dict)")

                    guard let text = dict["text"] as? String else {
                        return
                    }

<<<<<<< HEAD
                    //print("Text: \(text)")
                    guard let timestamp = dict["ts"] as? String else {
                        return
                    }
                    //print("Timestamp: \(timestamp)")
=======
                    print("Text: \(text)")
                    guard let timestamp = dict["ts"] as? String else {
                        return
                    }

                    //print("Timestamp: \(ts)")
>>>>>>> event-schedule
                    let textTs = TextAndTs(text: text, timestamp: timestamp)

                    textTsList.append(textTs)
                    completion(textTsList)
                }

<<<<<<< HEAD
                //print("TextListCount: \(textTsList.count)")
=======
                print("TextListCount: \(textTsList.count)")
>>>>>>> event-schedule
            }
        }
        dataTask.resume()
    }
}
