//
//  KCMultiDictionary.swift
//  HackerBooks
//
//  Created by Jorge Miguel Lucena Pino on 7/12/15.
//  Copyright © 2015 Jorge Miguel Lucena Pino. All rights reserved.
//

import Foundation



public struct KCMultiDictionary<KeyType: Hashable, ValueType: Hashable> {
    
    //MARK: - Alias
    typealias MultiDictionaryType = [KeyType: Set<ValueType>]
    
    private var dict = MultiDictionaryType()
    
    //MARK: - Accesors
    
    public mutating func addObject(object: ValueType, forKey key: KeyType) {
        var objs = dict[key] ?? Set<ValueType>()
        
        objs.insert(object)
       
        dict[key] = objs
    }
    
    
    public func objectsForKey(key: KeyType) -> Set<ValueType> {
//        if let objs = dict[key] {
//            return objs
//        }
//        return []
        return dict[key] ?? []
    }
    
    public mutating func removeObject(object: ValueType, forKey key: KeyType) {
        if dict[key] != nil {
            dict[key]?.remove(object)
            if ((dict[key]?.isEmpty) == true) {
                dict[key]?.removeAll()
            }else{
                dict.removeValueForKey(key)
            }
        }

    }
    
    public var count : Int{
        get{
            let total = Set<ValueType>()
            for bucket in dict.values {
                total.union(bucket)
            }
            return total.count
        }
    }
    
    public var allKeys : LazyMapCollection<Dictionary<KeyType, Set<ValueType>>, KeyType>{
        get{
//            var keys = [KeyType]()
//            for each in 0...dict.count {
//                keys[each] = each.hashValue
//            }
            return dict.keys
        }
    }
    
//    public subscript(key: KeyType) -> Set<ValueType> {
//        return objectsForKey(key)
//    }
    
//    subscript(key: KeyType) -> ValueType? {
//       
//        get {
//           
//            return self.dict[key]
//        }
//     
//        set {
//         
//            if let index = find(self.array, key) {
//            } else {
//                self.array.append(key)
//            }
//            
//            // 5
//            self.dict[key] = newValue
//        }
//    }
}


//class KCMultidictionary : NSObject {
//    
//    
//    //MARK: - Properties
//    var dict : [NSObject : AnyObject]
//    
//    //MARK: - Init
//    override init() {
//        dict = [NSObject : AnyObject]()
//        super.init()
//    }
//    
//    //MARK: - Accessors
//    func addObject(object: AnyObject, forKey key: NSObject){
//        
//        var objs : Set = dict[key]
//        if objs {
//            objs = Dictionary()
//        }
//        
//        objs.addObject(object)
//        dict.setObject(objs, forKey: key)
//        
//    }
//    
//    func objectsForKey(key: protocol<NSCopying>) -> Set{
//        
//        var objs : Set = dict.objectForKey(key)
//    }
//}