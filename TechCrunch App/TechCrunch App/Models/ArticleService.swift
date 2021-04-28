//
//  ArticleService.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import Foundation

struct ArticleService:Decodable {
    
    var totalResults:Int?
    var articles:[Article]?
    
}
