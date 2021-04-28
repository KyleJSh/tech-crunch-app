//
//  ArticleTableViewCell.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        
        articleImageView.image = nil
        headlineLabel.text = ""
        
        articleToDisplay = article
        
        // set the headline
        headlineLabel.text = articleToDisplay!.title! + "..."
        
        // download and display the image
        let urlString = articleToDisplay!.urlToImage!
        
        // check cache to see if image is already downloaded and saved
        if let imageData = CacheManager.retrieveImage(urlString) {
            
            articleImageView.image = UIImage(data: imageData)
            return
            
        }
        
        // create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        // create session
        let session = URLSession.shared
        
        // create datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check there is data and there's no errors
            if data != nil && error == nil {
                
                // save image data to cache
                CacheManager.saveImage(urlString, data!)
                
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    // run on main thread
                    DispatchQueue.main.async {
                        
                        // set image data
                        self.articleImageView.image = UIImage(data: data!)
                        
                    }
                    
                }
            }
        }
        // kick off datatask
        dataTask.resume()
        
    }
    
    // MARK: - Boilerplate Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
