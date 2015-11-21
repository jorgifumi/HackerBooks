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
    var books   : NSMutableArray
    
    //Array de tags con todas las distintas temáticas en orden alfabético. No puede haber repetidas
    var tags    : NSMutableArray
    
    //Número total de libros
    var booksCount  : Int{
        get{
            let count: Int = self.books.count
            return  count
        }
    }
    
    //MARK: - Init
    init(books: NSMutableArray,
        tags: NSMutableArray){
            
            self.books = books
            self.tags = tags
    }
    
    //Número de libros de una temática concreta, si no existe devuelve 0
    func bookCountForTag (tag: String?) -> Int{
        
    }
    
    //Array de los libros que hay en una temática. Un libro puede pertenecer a varias temáticas. Si no hay libros para una temática, devuelve nil
    func booksForTag (tag: String?) -> [KCBook]?{
        
    }
    
    //Un KCBook para el libro que está en la posición "index" de aquellos bajo un cierto tag. Si el índice o el tag no existe, devuelve nil
    
    func bookAtIndex(index: Int) -> KCBook?{
        
    }
}