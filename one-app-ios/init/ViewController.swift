//
//  ViewController.swift
//  one-app-ios
//
//  Created by Qasim Abbas on 7/29/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let secretString = "Testing for travis"
    
    var message : String?
    
    @IBOutlet var desc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       desc.text = message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
