//
//  ViewController.swift
//  ios-charts-crash
//
//  Created by Turken, Hasan on 5/2/15.
//  Copyright (c) 2015 Turken, Hasan. All rights reserved.
//

import UIKit
import Charts



class ViewController: UIViewController, ChartViewDelegate {
    var chartView: LineChartView!
    // CHANGE THIS WITH A BIG FLOAT, i.e. 657711616.0
    // Works well with smaller numbers...Or even, there is another small number with it
    var yValue:Float = 657711616.0 // CHANGE THIS WITH A BIG FLOAT, i.e. 657711616.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        chartView = LineChartView(frame: CGRect(x:0,y:0,width:500,height:500))
        view.addSubview(chartView)
        
        chartSetup()
        chartSetDataForChartView()
        
        chartView.animate(xAxisDuration: 1.0, easingOption: ChartEasingOption.EaseInOutQuart)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func chartSetup(){
        chartView.noDataText = "loading"
        
        chartView.legend.position = ChartLegend.ChartLegendPosition.RightOfChart
        chartView.delegate = self
        
        chartView.highlightEnabled = true
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.form = ChartLegend.ChartLegendForm.Line
        
        // chartViewSetup
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        chartView.gridBackgroundColor = UIColor.whiteColor()
        
        var leftAxis:ChartYAxis = chartView.leftAxis
        leftAxis.startAtZeroEnabled = false
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        chartView.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.rightAxis.enabled = false
    }
    func chartSetDataForChartView(){
        var xVals:[String] = [""]
        xVals.append("Some Text")
        xVals.append("") // To center datapoint
        
        var dataSets:[LineChartDataSet] = []
        
        var yVals:[ChartDataEntry] = []
        yVals.append(ChartDataEntry(value: yValue, xIndex: 1))
        
        var set:LineChartDataSet = LineChartDataSet(yVals: yVals, label: "Some data")
        
        set.setColor(UIColor.redColor())
        set.setCircleColor(UIColor.redColor())
        set.lineWidth = 1.5
        set.circleRadius = 2.0
        set.drawCircleHoleEnabled = false
        set.valueFont = UIFont.systemFontOfSize(0.9)
        set.fillAlpha = 65/255
        set.fillColor = UIColor.redColor()
        
        dataSets.append(set)
        
        var data:LineChartData = LineChartData(xVals: xVals, dataSets: dataSets)
        chartView.data = data
    }
}

