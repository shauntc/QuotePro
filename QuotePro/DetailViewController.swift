//
//  DetailViewController.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet var quoteView: QuoteView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            quoteView.setUp(quote: detail.quote, photo: detail.photo)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    var detailItem: (quote:Quote, photo:Photo)? {
        didSet {
            // Update the view.
//            self.configureView()
        }
    }


}

