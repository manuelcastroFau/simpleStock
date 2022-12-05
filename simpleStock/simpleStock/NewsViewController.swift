//
//  NewsViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 12/3/22.
//

import UIKit
import Parse
import AlamofireImage

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var stock: PFObject!
    
    //var stocks = [PFObject]()
    
    let x = YahooAPI()
    var y:NewsJSON!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return stocks.count
        //return stocks.count
        //return 8
        
        return y.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let stock = stocks[indexPath.row]
        
        // let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as! StockTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        
        //let stock = stocks[indexPath.row]
        
        
        cell.newsTitleLabel.text = y.data[indexPath.row].title as String?
        let date = NSDate(timeIntervalSince1970: TimeInterval(y.data[indexPath.row].providerPublishTime) )
        
        let formatter = DateFormatter()
        let myString = (String(describing: date))
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let yourDate: Date? = formatter.date(from: myString)
//        formatter.dateFormat = "dd-MMM-yyyy"
        print(myString)
        
        let end = myString.firstIndex(of: " ")!
        let newsDate = myString[...end]
        cell.newsDateLabel.text = "Date: " + newsDate
        
        
//        cell.newsLinkLabel.text = y.data[indexPath.row].link as String?
//
        
        cell.HyperLinkNews.text=y.data[indexPath.row].link as String?
        
        cell.newsPubliserLabel.text = "Publisher: " + y.data[indexPath.row].publisher as String?

        
        
//        let newsThumbnailURl:String = String(y!.data.logo_url)
        
        let temporary = (y!.data[indexPath.row].thumbnail?.resolutions[0].url)
        
        if  (temporary != nil){
            print("Yes the value is not nil")
            let newsThumbnailURl:String = String(temporary!)
            let url = URL(string: newsThumbnailURl)!
            
            cell.newsImageView.af.setImage(withURL: url)
        }else{
            print("No thumbnail for this news")
        }
        
//        if let newsThumbnailURl:String = String((y!.data[indexPath.row].thumbnail?.resolutions[1].url)!) {
//
//        }
        
        // let newsThumbnailURl:String = String((y!.data[indexPath.row].thumbnail?.resolutions[1].url)!)
        //let url = URL(string: newsThumbnailURl)!
        
        //cell.newsImageView.af.setImage(withURL: url)
        
        
        
        
        
        return cell
        
    }
    
    
    @objc func linkLabelTapped(_ sender: UITapGestureRecognizer) {
        print("linkLabelTapped")
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let ticker = stock["ticker"] as! String
        print("ticker:   \(ticker)")
        let test = x.GetNews(stock:ticker)
                do{
                     y = try! JSONDecoder().decode(NewsJSON.self, from: test)
                }
                catch{
                    print("error")
                }
        
        print(y.data[0].publisher)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         
        //self.tableView.reloadData()
       

//
//        let query =  PFQuery(className: "Stock")
//
//        query.includeKeys(["ticker", "stockName"])
//
//        query.findObjectsInBackground { [self] (stocks,error) in
//            if  stocks != nil {
//                        self.stocks = stocks!
//                        self.tableView.reloadData()
//                    }
//                    else{
//                        print("Here is the error")
//                    }
//                }
         
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // find the selected stock
        
        
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//
//        let stock = stocks[indexPath.row]
//
//        // Pass the selected stock to details stock controllers
//        let stockDetailViewController = segue.destination as! NewsViewController
//
//        newsViewController.stock = stock
    }
     */
    

}
