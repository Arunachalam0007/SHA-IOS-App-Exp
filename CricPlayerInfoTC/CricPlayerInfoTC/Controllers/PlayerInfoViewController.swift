//
//  PlayerInfoViewController.swift
//  CricPlayerInfoTC
//
//  Created by ArunSha on 22/03/21.
//

import UIKit

class PlayerInfoViewController: UIViewController {

    @IBOutlet weak var playerProfileInfoPic: UIImageView!
    
    @IBOutlet weak var playerProfileInfoName: UILabel!

    var playerName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerProfileInfoPic.image = UIImage(named: playerName)
        playerProfileInfoName.text = playerName
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
