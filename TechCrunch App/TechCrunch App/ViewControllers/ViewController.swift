//
//  ViewController.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Variables and Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticlesModel()
    var articles = [Article]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.getArticles()
        
    }


}

// MARK: - Articles Model Protocol Extension

extension ViewController: ArticlesModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        
        self.articles = articles
        
    }
    
  
}

// MARK: - TableView Datasource/Delegate Extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ARTICLE_CELL, for: indexPath)
        
        // TODO: configure cell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
