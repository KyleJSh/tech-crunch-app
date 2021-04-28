//
//  CacheManager.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import Foundation

class CacheManager {
    
    static var dictionary = [String:Data]()
    
   static func saveImage(_ url:String, _ imageData:Data) {
        
        dictionary[url] = imageData
        
    }
    
    static func retrieveImage(_ url:String) -> Data? {
        
        return dictionary[url]
        
    }
}
