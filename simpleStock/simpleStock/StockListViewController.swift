//
//  StockListViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 11/21/22.
//

import UIKit
import Parse


class StockListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var stocks = [PFObject]()
    let x = YahooAPI()
    //ssss
    //var stockPrice = [] as? String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    //Logout function
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        let loginViewController = main.instantiateViewController(withIdentifier: "StockListViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
    }

   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as! StockTableViewCell
        let stock = stocks[indexPath.row]
        
        
        let ticker = stock["ticker"] as! String
        cell.StockTicker.text = ticker
        cell.Stockname.text = stock["stockName"] as! String
        
        //let x = loadData(ticker: ticker)
        //let y:String  = x as String
       
        
        
//        print(ticker)
//        print("-->  "+x)
//        cell.StockPrice.text = x
//
//
        
        // Curenct call to the api passing ticker(Stock code) as input
        let stockCurrentPrice:String
       
        // Since we are poor students I'm paying only for 5 call perseconds in the api
        // so we will slepp for 1/5 of second to do it
        usleep(200000)
       
        let test = x.GetStockInfo(stock:ticker)
                do{
                    let y = try? JSONDecoder().decode(StockInfo.self, from: test)
                    print(y!.data.currentPrice)
                    stockCurrentPrice = String(y!.data.currentPrice)
                }
                catch{
                    print("error")
                }
        
        cell.StockPrice.text = stockCurrentPrice
        
        
        
        return cell
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         
        let query =  PFQuery(className: "Stock")
        
        query.includeKeys(["ticker", "stockName"])
        
        query.findObjectsInBackground { [self] (stocks,error) in
            if  stocks != nil {
                        self.stocks = stocks!
                        self.tableView.reloadData()
                    }
                    else{
                        print("Here is the error")
                    }
                }
         
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // find the selected stock
        
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let stock = stocks[indexPath.row]
        
        // Pass the selected stock to details stock controllers
        let stockDetailViewController = segue.destination as! StockDetailViewController
        
        stockDetailViewController.stock = stock
        
        
    }
  
    
    
    
    
    ////////////////////////2@@######################
    
    var price:String=""
    func loadData(ticker: String) -> String {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": "bd48fac225msh942df97a253a250p1c5cd8jsna7f3db3ff35f",
            "X-RapidAPI-Host": "yahoo-finance97.p.rapidapi.com"
        ]
        //var priceval: NSString = ""
        let queryticker = "symbol=" + ticker
        let postData = NSMutableData(data: queryticker.data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: "https://yahoo-finance97.p.rapidapi.com/stock-info")! as URL,
                                                      cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        //var ourdata = [NSDictionary]()
        
        //let priceVal as? NSString
        
        
        
        let url = request as URLRequest
        let task = URLSession.shared.dataTask(with:url) { (serviceData, serviceResponse, error) in
            if error == nil{
                let httpResponse = serviceResponse as! HTTPURLResponse
                if(httpResponse.statusCode == 200){
                    // data parse
                    let jsonData = try? JSONSerialization.jsonObject(with: serviceData!, options: .mutableContainers)
                    //this returns the JSON
                    let result = jsonData as! Dictionary<String, Any>
                    //print(result)
                    //remove the metadata and only keep main json as string,value dictonary
                    let check = result["data"] as! Dictionary<String, Any>
                    //print(check)
                    //print(check["currentPrice"])
                    //priceval = check["currentPrice"] as? NSString ?? "none"
                    let priceVal = check["currentPrice"]
                    //price = String(priceVal)
                    
                    //print(\priceVal)
                    //price = priceVal! as? String ?? "sss"
                    let zzz = check.mapValues {String(describing: $0)}
                    
                    
                    //price = String(describing: priceVal)
                    let manny = zzz["currentPrice"]
                    self.price =  manny!
                    
                    print(self.price)
                    //price = "\(priceVal)"

                }
            }
        }
        
        
        task.resume()
        
        return price
    }

}
