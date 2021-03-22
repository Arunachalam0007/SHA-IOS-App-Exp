//
//  ViewController.swift
//  CricPlayerInfoTC
//
//  Created by ArunSha on 22/03/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var playerInfoTableView: UITableView!
    
    var playerInfo : [String] = [ "Raina Four", "Raina Six", "Raina 100", "Raina Catch", "Raina Wicket", "Raina Out"]
    
    var playerProfileTabCellIdentifier: String = "playerProfileTabCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let playerProfile =  tableView.dequeueReusableCell(withIdentifier: playerProfileTabCellIdentifier, for: indexPath) as! PlayerProfileTableViewCell
        
        playerProfile.playerProfileName.text = playerInfo[indexPath.item]
        playerProfile.playerProfilePic.image = UIImage(named: playerInfo[indexPath.item])
        playerProfile.playerProfilePic.layer.cornerRadius = playerProfile.playerProfilePic.frame.height/5
        playerProfile.playerProfilePic.layer.borderWidth = 3.0
        playerProfile.playerProfilePic.layer.backgroundColor = UIColor.black.cgColor
        
        return playerProfile
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerProfile = tableView.cellForRow(at: indexPath) as! PlayerProfileTableViewCell
        let playerName = playerProfile.playerProfileName.text
        if let name = playerName {
            onSelectedProfile(profileName: name)
        }
        
    }
    
    func onSelectedProfile(profileName: String) {
        
        let profileAlert = UIAlertController(title: "Info!", message: profileName, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        profileAlert.addAction(UIAlertAction(title: "Get Info", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            print(UIAlertAction.title)
        }))
        
        // show the alert
        self.present(profileAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerInfoTableView.dataSource = self
        playerInfoTableView.delegate = self
    }
    
    
}

