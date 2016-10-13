//
//  Quote.swift
//  QuotePro
//
//  Created by Shaun Campbell on 2016-10-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    static let randomQuoteURL = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
    
    let text:String
    let author:String
    let link:String
    
    init(forismaticDictionary:Dictionary<String, String>) {
        if let text = forismaticDictionary["quoteText"] {
            self.text = text
        }else{self.text = ""}
        if let author = forismaticDictionary["quoteAuthor"] {
            self.author = author
        }else{self.author = ""}
        if let link = forismaticDictionary["quoteLink"] {
            self.link = link
        }else{self.link = ""}
    }
    
    init(text:String, author:String, link:String){
        self.text = text
        self.author = author
        self.link = link
    }
    
    class func randomQuote(closure:@escaping(Quote) -> (Void)){
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: Quote.randomQuoteURL) { (data, response, error) in
            if error != nil {
                print(error)
            }
            
            do{
            let serializedData = try JSONSerialization.jsonObject(with: data!, options: [])
                
                guard let dictionary = serializedData as? Dictionary<String, String> else{
                    return;
                }
                
                let newQuote = Quote(forismaticDictionary: dictionary)
                
                closure(newQuote)
                
            }catch{
                return;
            }
        }
        task.resume()
    }
    
}
