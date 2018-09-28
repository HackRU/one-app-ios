//
//  InfoAPI.swift
//  one-app
//
//  Created by Sunny Feng on 8/23/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class EventsAPI: NSObject {

    //oAuth ID: key name = calendar-key, 
    override init() {

    }

    //This is creating a completion handler that will return once the thread is done
    static func apiCall(completion: @escaping ([Event]) -> Void) {

        var eventList = [Event]()

        // Url with the data
        let url = URL(string: "https://7c5l6v7ip3.execute-api.us-west-2.amazonaws.com/lcs-test/dayof-events")

        // Creating new thread to handle getting data
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, _, _) in

            // If data exists, print
            if let data = data {
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
                print(body.count)

                for item in body {
                    //print("Item: \(item)")
                    guard let dict = item as? [String: Any] else {
                        return
                    }
                    //Getting Summary
                    guard let summary = dict["summary"] as? String else {
                        return
                    }
                    //Getting event end time
                    guard let endTimeDict = dict["end"] as? [String: Any] else {
                        print("IT NO WORK")
                        return
                    }

                    guard let end = endTimeDict["dateTime"] as? String else {
                        print("START STAMP FAILED")
                        return
                    }

                    guard let location = dict["location"] as? String else {
                        print("LOCATION FAILED")
                        return
                    }

                    eventList.append(EventsAPI.createEventFromItem(dict: dict, summary: summary, end: end, location: location))

                }

                //This is using the completion handle.
                completion(eventList)
            }
        }

        // Run the thread
        dataTask.resume()
    }

    static func cleanString (str: String) -> String {
        var res = ""
        var openBracColon = false

        for char in str {
            if openBracColon {
                if char == ">" || char == ":" {
                    openBracColon = false
                }
            } else {
                if char == "<" || char == ":" {
                    openBracColon = true
                } else {
                    res.append(char)
                }
            }

        }

        print(res)
        return res
    }

    static func createEventFromItem(dict: [String: Any], summary: String, end: String, location: String) -> Event {

        let text = EventsAPI.cleanString(str: summary)
        let event = Event(description: text, start: "", end: end, location: location)

        var start = ""
        let startTimeDict = dict["originalStartTime"] as? [String: Any]
        if let startDict = startTimeDict {
            start = (startDict["dateTime"] as? String)!
        }

        let startTimeWithStartDict = dict["start"] as? [String: Any]
        if let startDict = startTimeWithStartDict {
            start = (startDict["dateTime"] as? String)!
        }
        //if no start time, set default an huor before the end time
        if start == "" {
            event.setStartDate(startDate: event.endDate.addingTimeInterval(-60*60))
            print("NO START TIME for \(summary): making it \(start) - \(end)")
        } else {
            event.setStart(start: start)
        }

        return event
    }

}
