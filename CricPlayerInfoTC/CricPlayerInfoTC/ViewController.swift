//
//  ViewController.swift
//  CricPlayerInfoTC
//
//  Created by ArunSha on 22/03/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var playerInfoTableView: UITableView!
    
    var playerProfile : [String] = [ "Raina Four", "Raina Six", "Raina 100", "Raina Catch", "Raina Wicket", "Raina Out"]
    
    var playerProfileTabCellIdentifier: String = "playerProfileTabCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profile =  tableView.dequeueReusableCell(withIdentifier: playerProfileTabCellIdentifier, for: indexPath) as! PlayerProfileTableViewCell
        
        profile.playerProfileName.text = playerProfile[indexPath.item]
        profile.playerProfilePic.image = UIImage(named: playerProfile[indexPath.item])
        profile.playerProfilePic.layer.cornerRadius = profile.playerProfilePic.frame.height/5
        profile.playerProfilePic.layer.borderWidth = 3.0
        profile.playerProfilePic.layer.backgroundColor = UIColor.black.cgColor

        return profile
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerInfoTableView.dataSource = self
        playerInfoTableView.delegate = self
    }


}

