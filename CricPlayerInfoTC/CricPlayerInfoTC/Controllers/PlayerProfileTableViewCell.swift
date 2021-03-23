//
//  PlayerProfileTableViewCell.swift
//  CricPlayerInfoTC
//
//  Created by ArunSha on 22/03/21.
//

import UIKit

class PlayerProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var playerProfilePic: UIImageView!
    
    @IBOutlet weak var playerProfileName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
