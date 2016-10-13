//
//  Photo.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class Photo: NSObject {
    
    static let randomImageURL = URL(string:"https://unsplash.it/200/300?random")!
    
    let image:UIImage?
    let url:URL?
    
    init(image:UIImage) {
        self.url = Photo.randomImageURL
        self.image = image
    }
    
    init(internalURL:URL){
        self.url = internalURL
        do{
            let data = try Data(contentsOf: internalURL)
            self.image = UIImage(data: data)
        }catch{self.image = nil}
    }
    
    class func randomImage(closure:@escaping(Photo) -> (Void)){
        
        let session = URLSession(configuration: .default)
        
        let task = session.downloadTask(with: Photo.randomImageURL) { (url, respons, error) in
            if error != nil {
                return
            }
            if let url = url {
                closure(Photo(internalURL: url))
            }
            
            
        }
        
        task.resume()
    }

}
