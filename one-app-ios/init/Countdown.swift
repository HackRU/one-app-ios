//
//  Countdown.swift
//  one-app
//
//  Created by Qasim Abbas on 9/28/18.
//  Copyright © 2018 HackRU. All rights reserved.
//

import UIKit

class Countdown: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepare()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        prepare()
        
    }
    
    func prepare() {
//        Bundle.main.loadNibNamed("Countdown", owner: self, options: nil)
        addSubview(instanceFromNib())
    }
    
    func instanceFromNib() -> UIView {
        
        let view = UINib(nibName: "Countdown", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView
        return view!
    }

}
