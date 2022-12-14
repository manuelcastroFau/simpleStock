//
//  ChartsViewController.swift
//  simpleStock
//
//  Created by manuel  castro  on 12/12/22.
//

import UIKit
import Parse
import Charts
import TinyConstraints

let x = YahooAPI()
var y:PastPrices!

class ChartsViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var stockNameLabel: UILabel!
    
    @IBOutlet weak var todayDateLabel: UILabel!
    
    
    var stock: PFObject!
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemGray6
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 13)
        yAxis.setLabelCount(4, force: false)
        yAxis.labelTextColor = .lightGray
        yAxis.axisLineColor = .lightGray
        yAxis.labelPosition = .outsideChart
        
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 13)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .lightGray
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(yAxisDuration: 2.5)
        
        
        return chartView
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Grab Todays Calender
        let calendar = Calendar.current
        //Get Date 14 days ago
        let todayMinus14 = calendar.date(byAdding: DateComponents(day: -14), to: Date())
        let today = calendar.date(byAdding: DateComponents(day: -0), to: Date())
        //Format it the way API Want
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd"
        //DateString Has 14 day ago date
        let endDate = dformatter.string(from: today!) // create the date string
        let startdate = dformatter.string(from: todayMinus14!)
        print(startdate)
        
        todayDateLabel.text = "Today: \(endDate)"
        
        
        //call appi
        
        let ticker = stock["ticker"] as! String
        
        let test = x.GetValuesLastSevenDays(ticker: ticker, startDate: startdate, endDate: endDate)
                do{
                     y = try! JSONDecoder().decode(PastPrices.self, from: test)
                    print("WE are fucking here")
                    print("message: \(y.message)")
                    print("status: \(y.status)")
                    print(y.data[0])
                }
                catch{
                    print("error")
                }
        
        print(y.data.count)
        print("capacity: \(y.data.capacity)")
        
        let myDate = epochToDateFromated(epoch: String(y.data[y.data.count-1].date))
        print("Hope it works: \(myDate)")
        
        print(getDay(mydate: myDate))
        
        print("Close val: \(y!.data[0].close)")
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        stockNameLabel.text  = stock["stockName"] as! String
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
        
        // chart to the view
        view.addSubview(lineChartView)
        //center chart
        lineChartView.centerInSuperview()
        // setting width and height
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        
        setData()
    
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    
    
    func setData() {
        var yValues: [ChartDataEntry]
        if(stock["ticker"] as! String=="AAPL"){
            yValues = yAppleValues
        } else if(stock["ticker"] as! String=="MSFR"){
            yValues = yMicrosoftValues
        }
        else if(stock["ticker"] as! String=="AMZN"){
            yValues = yAmazonValues
        }
        else if(stock["ticker"] as! String=="GOOGL"){
            yValues = ygoogleValues
        }
        else if(stock["ticker"] as! String=="TSLA"){
            yValues = yTeslaValues
        }
        else if(stock["ticker"] as! String=="NVDA"){
            yValues = yNvidiaValues
        }
        else if(stock["ticker"] as! String=="SHOP"){
            yValues = yShopifyValues
        }
        else if(stock["ticker"] as! String=="AMD"){
            yValues = yAMDValues
        }
        else if(stock["ticker"] as! String=="META"){
            yValues = yMetaValues
        }
        else {
            yValues = yGamestopValues
        }
        let set1 = LineChartDataSet(entries: yValues, label: "Stock Price History")
        
        
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 4
        set1.setColor(.systemTeal)
        set1.fill = ColorFill(color: .systemGreen)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemBlue
       
        let data = LineChartData(dataSet: set1)
        data.setValueTextColor(.black)
        data.setValueFont(NSUIFont.systemFont(ofSize: 13.0))
        data.setDrawValues(true)
        
        lineChartView.data = data
    }

    
    
    
    //var myYvalues=[ChartDataEntry]()
    
    func populateMyYvalues() {
        var i = 0
        while(i < 8) {
            // convert epco to date
            
            // convert date to day
            
            // convert day to int
            
            //let myTempDate
            
            //myYvalues.append( ChartDataEntry(x:1.0, y:15.0))
            //i = i + 1
        }
    }
    
    //Double(String(format: "%.2f",y!.data[0].close))!
    
    let yAppleValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:147.80),
        ChartDataEntry(x:2, y:146.63),
        ChartDataEntry(x:3, y:142.91),
        ChartDataEntry(x:4, y:140.94),
        ChartDataEntry(x:5, y:142.64),
        ChartDataEntry(x:6, y:142.16),
        ChartDataEntry(x:7, y:144.49),
        
    ]
    
    
    let yMicrosoftValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:255.02),
        ChartDataEntry(x:2, y:250.20),
        ChartDataEntry(x:3, y:245.12),
        ChartDataEntry(x:4, y:244.37),
        ChartDataEntry(x:5, y:247.40),
        ChartDataEntry(x:6, y:245.42),
        ChartDataEntry(x:7, y:252.51),
        
    ]
    
    let yAmazonValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:95.50),
        ChartDataEntry(x:2, y:94.12),
        ChartDataEntry(x:3, y:91.01),
        ChartDataEntry(x:4, y:88.25),
        ChartDataEntry(x:5, y:88.45),
        ChartDataEntry(x:6, y:90.34),
        ChartDataEntry(x:7, y:89.08),
        
    ]
    
    let ygoogleValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:100.98),
        ChartDataEntry(x:2, y:100.44),
        ChartDataEntry(x:3, y:99.48),
        ChartDataEntry(x:4, y:96.98),
        ChartDataEntry(x:5, y:94.94),
        ChartDataEntry(x:6, y:93.70),
        ChartDataEntry(x:7, y:92.83),
        
    ]
    
    let yTeslaValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:194.69),
        ChartDataEntry(x:2, y:194.86),
        ChartDataEntry(x:3, y:182.44),
        ChartDataEntry(x:4, y:179.82),
        ChartDataEntry(x:5, y:174.04),
        ChartDataEntry(x:6, y:179.05),
        ChartDataEntry(x:7, y:167.82),
        
    ]
    
    let yNvidiaValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:171.35),
        ChartDataEntry(x:2, y:168.75),
        ChartDataEntry(x:3, y:166.10),
        ChartDataEntry(x:4, y:159.86),
        ChartDataEntry(x:5, y:161.19),
        ChartDataEntry(x:6, y:171.69),
        ChartDataEntry(x:7, y:170.01),
        
    ]
    
    let yShopifyValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:43.40),
        ChartDataEntry(x:2, y:43.06),
        ChartDataEntry(x:3, y:40.79),
        ChartDataEntry(x:4, y:38.97),
        ChartDataEntry(x:5, y:38.49),
        ChartDataEntry(x:6, y:38.64),
        ChartDataEntry(x:7, y:38.38),
        
    ]
    
    let yAMDValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:74.98),
        ChartDataEntry(x:2, y:73.62),
        ChartDataEntry(x:3, y:70.27),
        ChartDataEntry(x:4, y:70.14),
        ChartDataEntry(x:5, y:70.47),
        ChartDataEntry(x:6, y:68.59),
        ChartDataEntry(x:7, y:70.67),
        
    ]
    
    let yMetaValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:123.49),
        ChartDataEntry(x:2, y:122.43),
        ChartDataEntry(x:3, y:114.12),
        ChartDataEntry(x:4, y:113.93),
        ChartDataEntry(x:5, y:115.33),
        ChartDataEntry(x:6, y:115.90),
        ChartDataEntry(x:7, y:114.71),
        
    ]
    let yGamestopValues: [ChartDataEntry] = [
        ChartDataEntry(x:1, y:27.52),
        ChartDataEntry(x:2, y:25.56),
        ChartDataEntry(x:3, y:23.39),
        ChartDataEntry(x:4, y:22.26),
        ChartDataEntry(x:5, y:24.79),
        ChartDataEntry(x:6, y:22.63),
        ChartDataEntry(x:7, y:22.67),
        
    ]
    
    
    
    
    
    
    
//    if let timeResult = (jsonResult["dt"] as? Double) {
//        let date = Date(timeIntervalSince1970: timeResult)
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
//        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
//        dateFormatter.timeZone = .current
//        let localDate = dateFormatter.string(from: date)
//    }
    
    func epochToDateFromated(epoch:String) ->  String{
        let date = NSDate(timeIntervalSince1970: Double(epoch)!/1000 )
        
        let formatter = DateFormatter()
        formatter.timeStyle = DateFormatter.Style.medium //Set time style
        formatter.dateStyle = DateFormatter.Style.medium //Set date style
        
        formatter.timeZone = .init(secondsFromGMT: 180000)
        
        
        let localDate = formatter.string(from: date as Date)      
        
        let myString = (String(describing: date))
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let yourDate: Date? = formatter.date(from: myString)
//        formatter.dateFormat = "dd-MMM-yyyy"
        print(myString)
        
        let end = myString.firstIndex(of: " ")!
        let newsDate = myString[...end]
        return String(newsDate)
    }
    
    func getDay(mydate:String) -> String {
        
        let day = mydate.suffix(3)
        print(day)
        return String(day)
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
