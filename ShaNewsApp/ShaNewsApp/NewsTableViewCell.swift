//
//  NewsTableViewCell.swift
//  ShaNewsApp
//
//  Created by ArunSha on 01/04/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
