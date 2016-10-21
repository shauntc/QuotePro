//
//  QuoteAndPhotoCell.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class QuoteAndPhotoCell: UITableViewCell {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var quoteAndPhoto:(quote:Quote, photo:Photo)? {
        didSet{
            self.quoteLabel.text = quoteAndPhoto?.quote.text
            self.quoteLabel.textColor = .lightText
            self.authorLabel.text = quoteAndPhoto?.quote.author
            self.authorLabel.textColor = .lightText
            self.photoImageView.image = quoteAndPhoto?.photo.image
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
