//
//  JSONProcessing.swift
//  HackerBooks
//
//  Created by Jorge Miguel Lucena Pino on 6/12/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

//MARK: - Claves

/*
{
    "authors": "Scott Chacon, Ben Straub",
    "image_url": "http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg",
    "pdf_url": "https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf",
    "tags": "version control, git",
    "title": "Pro Git"
}
*/

enum JSONKeys: String{
    case authors = "authors"
    case image_url = "image_url"
    case pdf_url = "pdf_url"
    case tags = "tags"
    case title = "title"
}

//MARK: - Aliases
typealias JSONObject        = AnyObject
typealias JSONDictionary    = [String:JSONObject]
typealias JSONArray         = [JSONDictionary]

//MARK: - Errors
enum JSONProcessingError : ErrorType{
    case WrongURLFormatForJSONResource
    case ResourcePointedByURLNotReachable
    case JSONParsingError
    case WrongJSONFormat
}

//MARK - Structs
struct StrictBook{
    let title   : String
    let authors : [String]?
    let tags    : [String]?
    let image   : NSURL
    let pdf     : NSURL
}

//MARK: - Decoding

func decode(book json: JSONDictionary) throws -> StrictBook{
    
    guard let title = json[JSONKeys.title.rawValue] as? String else {
        throw JSONProcessingError.WrongJSONFormat
    }
    
    guard let authors = json[JSONKeys.authors.rawValue] as? String else {
        throw JSONProcessingError.WrongJSONFormat
    }
    
    guard let tags = json[JSONKeys.tags.rawValue] as? String else {
        throw JSONProcessingError.WrongJSONFormat
    }
    
    guard let imageUrl = json[JSONKeys.image_url.rawValue] as? String,
        image = NSURL(string: imageUrl) else{
            throw JSONProcessingError.ResourcePointedByURLNotReachable
    }
    
    guard let pdfUrl = json[JSONKeys.image_url.rawValue] as? String,
        pdf = NSURL(string: pdfUrl) else{
            throw JSONProcessingError.ResourcePointedByURLNotReachable
    }

    let authorsArr = authors.characters.split{$0 == ","}.map(String.init)
    let tagsArr = tags.characters.split{$0 == ","}.map(String.init)
    
    return StrictBook(title: title,
        authors: authorsArr,
        tags: tagsArr,
        image: image,
        pdf: pdf)
}