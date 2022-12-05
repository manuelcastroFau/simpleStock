//
//  NewsTableViewCell.swift
//  simpleStock
//
//  Created by manuel  castro  on 12/3/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsLinkLabel: UILabel!
    @IBOutlet weak var newsPubliserLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var HyperLinkNews: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
