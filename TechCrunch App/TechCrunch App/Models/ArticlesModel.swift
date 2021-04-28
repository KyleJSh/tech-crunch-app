//
//  ArticlesModel.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import Foundation

protocol ArticlesModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
    
}

class ArticlesModel {
    
    var delegate:ArticlesModelProtocol?
    
    func getArticles() {
        
        let stringUrl = Constants.URL
        
        // create url object from string
        let url = URL(string: stringUrl)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    let articles = articleService.articles!
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.articlesRetrieved(articles)
                        
                    }
                    
                }
                catch {
                    print("error getting JSON")
                }
                
            }
            
        }
        dataTask.resume()
        
    }
    
}
