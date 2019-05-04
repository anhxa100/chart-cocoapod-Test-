//
//  ViewController.swift
//  chartAPI
//
//  Created by anhxa100 on 5/3/19.
//  Copyright © 2019 anhxa100. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var barChartline: BarChartView!
    @IBOutlet weak var tfValue: UITextField!
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        axisFormatDelegate = self
        updateChartWithData()
        //        setChartValues()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func random(_ sender: AnyObject) {
        if let value = tfValue.text, value != "" {
            let visitorCount = VisitorCount()
            visitorCount.count = (NumberFormatter().number(from: value)?.intValue)!
            visitorCount.save()
            tfValue.text = ""
            
        }
        
        updateChartWithData()
        
        //        let count = Int(arc4random_uniform(20) + 3)
        //        setChartValues(count)
    }
    
    
    
    //    func setChartValues(_ count : Int = 20) {
    //        let values = (0..<count).map { (i) -> ChartDataEntry in
    //            let val = Double(arc4random_uniform(UInt32(count)) + 3)
    //            return ChartDataEntry(x: Double(i), y: val)
    //        }
    //
    //        let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
    //        let data = LineChartData(dataSet: set1)
    //
    //        self.barChartline.data = data
    //        print("TEST COUNT \(count)")
    //
    //    }
    
    func updateChartWithData() {
        var dataEntries: [BarChartDataEntry] = []
        let visitorCounts = getVisitorCountsFromeDatabase()
        for i in 0..<visitorCounts.count {
            let timeIntervalForDate: TimeInterval = visitorCounts[i].date.timeIntervalSince1970
            let dataEntry = BarChartDataEntry(x: Double(timeIntervalForDate), y: Double(visitorCounts[i].count))
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Visitor Count")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartline.data = chartData
        
        // thiet lap che do xem bang
        let xaxis = barChartline.xAxis
        xaxis.valueFormatter = axisFormatDelegate
    }
    
    
    
    func getVisitorCountsFromeDatabase() -> Results<VisitorCount> {
        do {
            let realm = try Realm()
            return realm.objects(VisitorCount.self)
        }catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    
}


extension ViewController: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm.ss"
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
    
}
