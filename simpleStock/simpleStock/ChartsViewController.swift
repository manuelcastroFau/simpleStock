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

class ChartsViewController: UIViewController, ChartViewDelegate {
    
    var stock: PFObject!
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemGreen
        
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 13)
        yAxis.setLabelCount(4, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 13)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(yAxisDuration: 2.5)
        
        
        return chartView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        let set1 = LineChartDataSet(entries: yValues, label: "Stock Price History")
        
        
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 4
        set1.setColor(.white)
        set1.fill = ColorFill(color: .white)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemBlue
       
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        
        lineChartView.data = data
    }
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x:1.0, y:15.0),
        ChartDataEntry(x:2.0, y:8.0),
        ChartDataEntry(x:3.0, y:9.0),
        ChartDataEntry(x:4.0, y:6.0),
        ChartDataEntry(x:5.0, y:7.0),
        ChartDataEntry(x:6.0, y:21.0),
        ChartDataEntry(x:7.0, y:12.0),
        
    ]
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
