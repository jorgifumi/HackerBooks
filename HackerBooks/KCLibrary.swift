//
//  KCLibrary.swift
//  HackerBooks
//
//  Created by Jorge Miguel Lucena Pino on 21/11/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation

class KCLibrary {
    
    //MARK: - Properties
    //Array de libros
    var books   : [KCBook]
    
    //Array de tags con todas las distintas temáticas en orden alfabético. No puede haber repetidas
    var tags    : [String]
    
    
    //MARK: - Computed Variables
    //Número total de libros
    var booksCount  : Int{
        get{
            let count: Int = self.books.count
            return  count
        }
    }
    
    //MARK: - Init
    init(books: [KCBook],
        tags: [String]){
            
            self.books = books
            self.tags = tags
    }
    
    //Número de libros de una temática concreta, si no existe devuelve 0
    func bookCountForTag (tag: String?) -> Int{
        
        guard let tagValue = tag else{
            return 0
        }
        
        var num = 0
        
        for i in 0..<self.booksCount{
            if self.books[i].tags.contains(tagValue) {
                num++
            }
        }
        
        return num
    }
    
    //Array de los libros que hay en una temática. Un libro puede pertenecer a varias temáticas. Si no hay libros para una temática, devuelve nil
    func booksForTag (tag: String?) -> [KCBook]?{
        
        guard let tagValue = tag else{
            return nil
        }
        
        if bookCountForTag(tagValue) == 0 {
            return nil
        }
        
        var books4Tag : [KCBook] = []
        
        for i in 0..<self.bookCountForTag(tagValue) {
            if self.books[i].tags.contains(tagValue) {
                books4Tag.append(self.books[i])
            }
        }
        return books4Tag
    }
    
    //Un KCBook para el libro que está en la posición "index" de aquellos bajo un cierto tag. Si el índice o el tag no existe, devuelve nil
    
    func bookAtIndex(index: Int, tag: String?) -> KCBook?{
        
        guard let tagValue = tag,
        let books4Tag = booksForTag(tagValue) else{
            return nil
        }
        
        if books4Tag.count <= index {
            return books4Tag[index]
        }
        
        return nil
    }
    
}