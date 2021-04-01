//
//  NewsPageViewController.swift
//  ShaNewsApp
//
//  Created by ArunSha on 02/04/21.
//

import UIKit
import WebKit

class NewsPageViewController: UIViewController {

    @IBOutlet weak var newsWebView: WKWebView!
    
    var newsWebUrl:String = ""
    
//    func showNewsWebView(newsWebURL: String) {
//        guard let url = URL(string: newsWebURL) else { return }
//        newsWebView.load(URLRequest(url: url))
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: newsWebUrl) else { return }
        newsWebView.load(URLRequest(url: url))
        
       // showNewsWebView(newsWebURL: newsWebUrl)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
