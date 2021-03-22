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
        
        var profilePicXOrigin = 0.0
        var profilePicYOrigin = 0.0
        let profile =  tableView.dequeueReusableCell(withIdentifier: playerProfileTabCellIdentifier, for: indexPath) as! PlayerProfileTableViewCell
        
        profile.playerProfileName.text = playerProfile[indexPath.item]
        profile.playerProfilePic.image = UIImage(named: playerProfile[indexPath.item])
        profilePicXOrigin =  Double(profile.playerProfilePic.frame.origin.x)
        profilePicYOrigin =  Double(profile.playerProfilePic.frame.origin.y)
        profile.playerProfilePic.frame = CGRect(x: profilePicXOrigin, y: profilePicYOrigin, width: 200, height: 200)
        profile.playerProfilePic.layer.cornerRadius = profile.playerProfilePic.frame.height/3
        profile.clipsToBounds = true
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

