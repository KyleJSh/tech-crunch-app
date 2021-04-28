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
        
        articleToDisplay = article
        
        // set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // download and display the image
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
