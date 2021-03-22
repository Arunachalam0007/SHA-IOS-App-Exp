//
//  PlayerInfoGridViewController.swift
//  CricPlayerInfoTC
//
//  Created by ArunSha on 22/03/21.
//

import UIKit

class PlayerInfoGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var playerInfoCollectionView: UICollectionView!
    
    var playerInfo : [String] = [ "Raina Four", "Raina Six", "Raina 100", "Raina Catch", "Raina Wicket", "Raina Out"]
    
    var playerProfileCollectionCellIdentifier: String = "playerProfileCollectionCell"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let playerProfile = collectionView.dequeueReusableCell(withReuseIdentifier: playerProfileCollectionCellIdentifier, for: indexPath) as! PlayerProfileCollectionViewCell
        playerProfile.playerGridProfileName.text = playerInfo[indexPath.item]
        playerProfile.playerGridProfilePic.image = UIImage(named: playerInfo[indexPath.item])
        return playerProfile
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let playerProfile = collectionView.cellForItem(at: indexPath) as! PlayerProfileCollectionViewCell
        let playerName = playerProfile.playerGridProfileName.text
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
        playerInfoCollectionView.dataSource = self
        playerInfoCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

}
