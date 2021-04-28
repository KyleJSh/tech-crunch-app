//
//  ViewController.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import UIKit

class ViewController: UIViewController {

    var model = ArticlesModel()
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        
        model.getArticles()
        
    }


}

extension ViewController: ArticlesModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        
        print("Articles retrieved")
        
    }
    
  
}
