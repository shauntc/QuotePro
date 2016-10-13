//
//  FloatingButton.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class FloatingButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //doesnt seem to change
        self.bounds.size = CGSize(width: 100, height: 50)
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 3        
    }

}
