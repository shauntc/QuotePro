//
//  DetailViewController.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailItem: (quote:Quote, photo:Photo)?

    @IBOutlet weak var shareButton: FloatingButton!
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
        self.view.bringSubview(toFront: shareButton)
        self.configureView()
    }
    @IBAction func shareButtonPressed(_ sender: AnyObject) {
        let image = self.captureImage()
        
        guard let imageSafe = image else {
            return;
        }
        
        let shareMenu = UIActivityViewController(activityItems: [imageSafe], applicationActivities: [])
        
        navigationController?.present(shareMenu, animated: true, completion: nil)
    }

    func captureImage() -> (UIImage?) {
        shareButton.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        UIGraphicsBeginImageContext(quoteView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        if let context = context {
            self.view.layer.render(in: context)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        shareButton.isHidden = false
        navigationController?.navigationBar.isHidden = false
        if let image = image {
                return image
        }else{
            return nil
        }
    }
}

