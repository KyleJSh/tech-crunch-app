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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            return
        }
        
        // get row user selected
        let article = articles[indexPath!.row]
        
        let detailVC = segue.destination as! DetailViewController
        
        // pass article url to detailVC
        detailVC.articleUrl = article.url!
        
    }

}

// MARK: - Articles Model Protocol Extension

extension ViewController: ArticlesModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        
        // var articles at the top is the same as the articles being passed into this func
        self.articles = articles
        
        tableView.reloadData()
        
    }
    
  
}

// MARK: - TableView Datasource/Delegate Extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ARTICLE_CELL, for: indexPath) as! ArticleTableViewCell
        
        // TODO: configure cell
        let article = articles[indexPath.row]
        
        cell.displayArticle(article)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
