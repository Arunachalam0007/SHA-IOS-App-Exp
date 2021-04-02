//
//  ViewController.swift
//  ShaNewsApp
//
//  Created by ArunSha on 01/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    
    var arrNewsUrlToImage = [String]()
    var arrNewsTitle = [String]()
    var arrNewsDescription = [String]()
    var arrNewsUrl = [String]()
    var arrPublishedAt = [String]()
    var arrNewsPageName = [String]()
    var newsURL = "https://newsapi.org/v2/top-headlines?country=in&from=2021-04-01&apiKey=8127a083c42b477e899dc3634a8a2204"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newsTable.dataSource = self
        newsTable.delegate = self
        updateNewsData()
    }
    
    func updateNewsData()  {
        guard let url = URL(string: newsURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //            guard let e != error else {
            //                print("NEWS API ERROR: ",error)
            //                return
            //            }
            
            print("Called")
            if let newsData = data {
                do {
                    let parseNewsData = try JSONDecoder().decode(NewsData.self, from: newsData)
                    if let articles = parseNewsData.articles {
                        for article in articles {
                            if let newsTitle = article.title, let newsDescription = article.description, let newsPublishedAt = article.publishedAt, let newsUrlToImage = article.urlToImage, let newsUrl = article.url    {
                                self.arrPublishedAt.append(newsPublishedAt)
                                self.arrNewsTitle.append(newsTitle)
                                self.arrNewsDescription.append(newsDescription)
                                self.arrNewsUrlToImage.append(newsUrlToImage)
                                self.arrNewsUrl.append(newsUrl)
                                if let source = article.source, let name = source.name {
                                    self.arrNewsPageName.append(name)
                                }
                            }
                        }
                    }
                    
                    // reload table so that new changes will store
                    DispatchQueue.main.async {
                        self.newsTable.reloadData()
                    }
                    
                } catch  {
                    print(error)
                }
                
            }
        }
        task.resume()
    }
    
    func getDateFormat( date: String) -> String {
        
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "MMM d, h:mm a"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrNewsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        newsCell.newsTitleLabel.text = arrNewsTitle[indexPath.item]
        newsCell.newsContent.text = arrNewsDescription[indexPath.item]
        
        //DateFormat
        newsCell.newsDateLabel.text = getDateFormat(date: arrPublishedAt[indexPath.item])
        
        // get Network Image
        if let newsURLImage = arrNewsUrlToImage[indexPath.item] as? String, let urlImage = URL(string: newsURLImage) {
            
            if let imageData = try? Data(contentsOf: urlImage) {
                newsCell.newsImage.image = UIImage(data: imageData)
            } else {
                newsCell.newsImage.image = UIImage(named: "News")
            }
            
        } else {
            newsCell.newsImage.image = UIImage(named: "News")
        }
        return newsCell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "NewsPage", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let newsViewController = segue.destination as? NewsPageViewController, let selectedNews = self.newsTable.indexPathForSelectedRow?.item {
            newsViewController.newsWebUrl =  arrNewsUrl[selectedNews]
        }
        
    }
}
