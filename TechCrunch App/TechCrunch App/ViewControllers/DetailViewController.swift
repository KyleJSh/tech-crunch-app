//
//  DetailViewController.swift
//  TechCrunch App
//
//  Created by Kyle Sherrington on 2021-04-27.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl:String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // webkit navigation delegate
        webView.navigationDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // check there's url loaded in webview
        if articleUrl != nil {
            
            // create url object
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                return
            }
            
            // create url request object
            let request = URLRequest(url: url!)
            
            spinner.alpha = 1
            // show activity spinner
            spinner.startAnimating()
            
            // load into webview
            webView.load(request)
            
        }
        
    }

}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // stop spinner
        spinner.stopAnimating()
        spinner.alpha = 0
        
    }
    
}
