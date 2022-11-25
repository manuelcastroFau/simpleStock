//
//  StockDetailViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/24/22.
//

import UIKit
import Parse

class StockDetailViewController: UIViewController {
    
    var stock: PFObject!
    @IBOutlet weak var StockName: UILabel!
    @IBOutlet weak var stockHighValue: UILabel!
    @IBOutlet weak var stockLowValue: UILabel!
    @IBOutlet weak var stockDividendsValue: UILabel!
    @IBOutlet weak var stockVolumeValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(stock["ticker"]as? String)

        // Do any additional setup after loading the view.
        StockName.text = stock["stockName"] as! String
        
        
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
