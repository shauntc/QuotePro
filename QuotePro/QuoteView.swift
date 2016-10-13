//
//  QuoteView.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setUp(quote:Quote, photo:Photo){
        quoteLabel.text = quote.text
        authorLabel.text = quote.author
        imageView.image = photo.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)?.last as! UIView
        self.addSubview(view)
    }
}
