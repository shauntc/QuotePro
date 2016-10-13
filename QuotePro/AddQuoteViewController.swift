//
//  AddQuoteViewController.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class AddQuoteViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var newQuoteButton: UIButton!
    @IBOutlet weak var newPhotoButton: UIButton!
    @IBOutlet var quoteView: QuoteView!
    
    //MARK: Properties
    var quote:Quote? {
        didSet{
            if let quote:Quote = self.quote {
                quoteView.quoteLabel.text = quote.text
                quoteView.authorLabel.text = quote.author
            }
        }
    }
    
    var photo:Photo?{
        didSet{
            if let photo:Photo = self.photo {
                quoteView.imageView.image = photo.image
            }
        }
    }

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubview(toFront: saveButton)
        view.bringSubview(toFront: newQuoteButton)
        view.bringSubview(toFront: newPhotoButton)
        
        
        Photo.randomImage(closure: { (photo) -> (Void) in
            
            
            DispatchQueue.main.async {
                self.photo = photo
            }
            
            
        })
        Quote.randomQuote { (quote) -> (Void) in
            DispatchQueue.main.async {
                self.quote = quote
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Storyboard Actions

    @IBAction func newPhotoButtonPressed(_ sender: AnyObject) {
        newPhotoButton.isEnabled = false
        Photo.randomImage { (photo) -> (Void) in
            DispatchQueue.main.async {
                self.photo = photo
                self.newPhotoButton.isEnabled = true
            }
        }
    }
    
    @IBAction func newQuoteButtonPressed(_ sender: AnyObject) {
        newQuoteButton.isEnabled = false
        Quote.randomQuote { (quote) -> (Void) in
            DispatchQueue.main.async {
                self.quote = quote
                self.newQuoteButton.isEnabled = true
            }

        }
    }
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
        let mvc = self.navigationController?.viewControllers[0] as! MasterViewController
        if let photo = photo, let quote = quote {
            mvc.addObject(quote: quote, photo: photo)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
