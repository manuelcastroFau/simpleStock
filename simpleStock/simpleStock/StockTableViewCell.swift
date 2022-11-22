//
//  StockTableViewCell.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/21/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var StockTicker: UILabel!
    
    @IBOutlet weak var Stockname: UILabel!
    @IBOutlet weak var StockPrice: UILabel!
    
    @IBAction func StockDetail(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
