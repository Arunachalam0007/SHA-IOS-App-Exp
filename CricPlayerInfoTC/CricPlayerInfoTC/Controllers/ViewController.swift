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
    
    // datasource - numberOfRowssInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerInfo.count
    }
    
    // datasource - cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let playerProfile =  tableView.dequeueReusableCell(withIdentifier: playerProfileTabCellIdentifier, for: indexPath) as! PlayerProfileTableViewCell
        
        playerProfile.playerProfileName.text = playerInfo[indexPath.item]
        playerProfile.playerProfilePic.image = UIImage(named: playerInfo[indexPath.item])
        
        playerProfile.playerProfilePic.layer.cornerRadius = 20
        playerProfile.playerProfilePic.layer.borderWidth = 3
        playerProfile.playerProfilePic.layer.borderColor = UIColor.black.cgColor
        playerProfile.playerProfilePic.contentMode = .scaleAspectFill
        
        return playerProfile
    }
    
    // delegate - fix heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    // delegate - profile got selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerProfile = tableView.cellForRow(at: indexPath) as! PlayerProfileTableViewCell
        let playerName = playerProfile.playerProfileName.text
        if let name = playerName {
            onSelectedProfile(profileName: name)
        }
        
    }
    
    // alert for profileInfo
    func onSelectedProfile(profileName: String) {
        
        let profileAlert = UIAlertController(title: "Info!", message: profileName, preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        profileAlert.addAction(UIAlertAction(title: "Get Info", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            // Navigation to next ViewController (Segue)
            self.performSegue(withIdentifier: "playerInfoIdentifier", sender: profileName)
        }))
        
        // show the alert
        self.present(profileAlert, animated: true, completion: nil)
        
    }
    
    // Navigation Segue with value passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segue destination - destination viewcontroller
        let playerInfoVC = segue.destination as! PlayerInfoViewController
        let profileName = sender as! String
        print(profileName)
        
        playerInfoVC.playerName = profileName
        // playerInfoVC.playerProfileInfoName.text = "Test"
        // playerInfoVC.playerProfileInfoName.text = "Raina Four"
        // playerInfoVC.playerProfileInfoPic.image = UIImage(named: "Raina Four")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerInfoTableView.dataSource = self
        playerInfoTableView.delegate = self
    }
    
    
}

