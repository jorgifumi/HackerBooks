//
//  Book.swift
//  HackerBooks
//
//  Created by Jorge Miguel Lucena Pino on 21/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

class KCBook {
    
    //MARK - Properties
    let title   : String
    let authors : [String]
    let tags    : [String]
    let image   : NSURL
    let pdf     : NSURL
    
    //Mark - Init
    init(title: String,
        authors: [String],
        tags: [String],
        imageUrl: NSURL,
        pdfUrl: NSURL){
            
            self.title = title
            self.authors = authors
            self.tags = tags
            self.image = imageUrl
            self.pdf = pdfUrl
    }
}