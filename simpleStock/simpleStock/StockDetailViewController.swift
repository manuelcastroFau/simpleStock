//
//  StockDetailViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/24/22.
//

import UIKit
import Parse
import AlamofireImage

class StockDetailViewController: UIViewController {
    
    var stock: PFObject!
    @IBOutlet weak var StockName: UILabel!
    @IBOutlet weak var stockHighValue: UILabel!
    @IBOutlet weak var stockLowValue: UILabel!
    @IBOutlet weak var stockIncomeValue: UILabel!
    @IBOutlet weak var stockVolumeValue: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var marketCapValue: UILabel!
    @IBOutlet weak var stockRecomendationValue: UILabel!
    @IBOutlet weak var stockCurrenPriceValue: UILabel!
    @IBOutlet weak var stock52HighValue: UILabel!
    @IBOutlet weak var stock52LowValue: UILabel!
    @IBOutlet weak var stockOpenValue: UILabel!
    @IBOutlet weak var stockWebsiteValue: UILabel!
    @IBOutlet weak var stockLogoImageView: UIImageView!
    
    @IBAction func chartButtonClick(_ sender: Any) {
        
//        performSegue(withIdentifier: "charts", sender: self)
//        print("hereeeeeeee")
    }

    @IBAction func newsButtonClick(_ sender: Any) {
//        performSegue(withIdentifier: "news", sender: self)
//        print("TTTTTThereeeeeeee")
    }
    
    let x = YahooAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(stock["ticker"]as? String)

        // Do any additional setup after loading the view.
        StockName.text = stock["stockName"] as! String
        
        let ticker = stock["ticker"]as? String
        
        let test = x.GetStockInfo(stock:ticker!)
                do{
                    
                    let y = try? JSONDecoder().decode(StockInfo.self, from: test)
                    print(y!.data.currentPrice)
                    StockName.text = String(y!.data.longName)
                    stockHighValue.text = String(y!.data.dayHigh)
                    stockLowValue.text = String(y!.data.dayLow)
                    //stockDividendsValue.text = String(y!.data.dividendYield)
                    stockIncomeValue.text = String(format: "%.1fM",y!.data.netIncomeToCommon/10000000) //big number
                    stockVolumeValue.text = String(format: "%.1fM", y!.data.averageVolume/1000000.0) //big number
                    addressLabel.text = String(y!.data.address1)
                    marketCapValue.text = String(format: "%.1fB",y!.data.marketCap/1000000000.0)   //big number
                    //format: "a float number: %.2f", 1.0321)
                    stockCurrenPriceValue.text = String(format: "%.2f",y!.data.currentPrice)
                    stock52HighValue.text = String(format: "%.2f",y!.data.fiftyTwoWeekHigh)
                    stock52LowValue.text = String(format: "%.2f",y!.data.fiftyTwoWeekLow)
                    stockOpenValue.text = String(format: "%.2f",y!.data.open)
                    stockWebsiteValue.text = String(y!.data.website)
                    
                    let temp:String = String(y!.data.recommendationKey).uppercased()
                    stockRecomendationValue.text = temp
                    if(temp.elementsEqual("BUY")){
                        self.stockRecomendationValue.textColor=UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00)
                    } else {
                        self.stockRecomendationValue.textColor=UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
                        stockRecomendationValue.text = "SELL"
                    }
                    
                    let logoUrl:String = String(y!.data.logo_url)
                    let url = URL(string: logoUrl)!
                    
                    stockLogoImageView.af.setImage(withURL: url)
                    
                }
                catch{
                    print("error")
                }
        
        
    }
    

    
    //performSegue(withIdentifier: "category", sender: sender)
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
                //let cell = sender as! UITableViewCell
//                let indexPath = tableView.indexPath(for: cell)!
//
//                let stock = stocks[indexPath.row]
        
                
        
                // Pass the selected stock to details stock controllers
        
        //print("Sgeue:    \(segue.identifier)")
        //super.prepare(for: segue, sender: sender)
        if segue.identifier == "news" {
        
            let NewsViewController = segue.destination as! NewsViewController
            NewsViewController.stock = stock
            print("Second NEWS")
        } else {
            let ChartViewController  = segue.destination as! ChartsViewController
            ChartViewController.stock = stock
            print("Second Charts")
        }
//        } else {
//            print("Error we fucked")
//        }

        
//
//                let NewsViewController = segue.destination as! NewsViewController
//                NewsViewController.stock = stock

//                let ChartViewController  = segue.destination as! ChartsViewController
//                ChartViewController.stock = stock
        
        
    }
    

}
