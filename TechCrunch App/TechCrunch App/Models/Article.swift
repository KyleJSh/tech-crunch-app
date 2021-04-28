//
//  Article.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import Foundation

struct Article:Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
