//
//  ViewController.swift
//  chartAPI
//
//  Created by anhxa100 on 5/3/19.
//  Copyright © 2019 anhxa100. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var barChartline: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChartValues()
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func random(_ sender: UIButton) {
        let count = Int(arc4random_uniform(20) + 3)
        setChartValues(count)
    }
    func setChartValues(_ count : Int = 20) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let set1 = LineChartDataSet(entries: values, label: "DataSet 1")
        let data = LineChartData(dataSet: set1)
        
        self.barChartline.data = data
        
   
    }
    
}
