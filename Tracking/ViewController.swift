//
//  ViewController.swift
//  Tracking
//
//  Created by admin on 11.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import CoreData
import Charts

class ViewController: UIViewController,NSFetchedResultsControllerDelegate,ChartViewDelegate{
    
  
    var sumDistance:Float = 0
    var sumTime:Float = 0
    var arrayTime = [Float]()
    var arraySpeed = [Float]()
    var check = 0
    @IBOutlet weak var distanceView: DistanceView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeView: TimeView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var viewForGraph: LineChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewForGraph.delegate = self
        self.viewForGraph.descriptionText = " "
        self.viewForGraph.backgroundColor = UIColor.yellowColor()
        self.viewForGraph.noDataText = " Please add you activity"
        

    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getDistance()
        getDataFromTraning()
        chartData(arrayTime)
        
        distanceView.counter = sumDistance
        timeView.counter = sumTime
        
        distanceLabel.text = String.localizedStringWithFormat("%.2f", distanceView.counter)
        timeLabel.text = "\(timeView.counter)"
        distanceView.setNeedsDisplay()
        timeView.setNeedsDisplay()
    }
    
    

    func chartData(time: [Float]){
        
        var yValue: [ChartDataEntry] = [ChartDataEntry]()
     
        for i in 0..<time.count{
            yValue.append(ChartDataEntry(value: Double(arraySpeed[i]), xIndex:i))
        }
        
        let set: LineChartDataSet = LineChartDataSet(yVals: yValue, label: "Speed")
        set.setColor(UIColor.blackColor())
        set.circleRadius = 0
        set.lineWidth = 2
        var dataSet:[LineChartDataSet] = [LineChartDataSet]()
        dataSet.append(set)
        
        let data:LineChartData = LineChartData(xVals: time, dataSets:dataSet)
        data.setValueTextColor(UIColor.yellowColor())
        self.viewForGraph.data = data
        arraySpeed.removeAll()
        arrayTime.removeAll()
    }
    
    
    
    func getDistance(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest  = NSFetchRequest(entityName: "Calculation")
        
        
        do{
            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let result = fetchedResult{
                for value in result{
                    sumDistance = value.valueForKey("sumDistance") as! Float
                    sumTime = value.valueForKey("sumTime") as! Float
                }
                
            }else{
                print("Error")
            }
        
            
        }
        catch{
            print("Error")
        }
        
    }
 
    func getDataFromTraning(){
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest =  NSFetchRequest(entityName: "Traning")
        
        do{
            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let result = fetchedResult{
                
                for value in result{
                    arraySpeed.append(value.valueForKey("averageSpeed") as! Float)
                    
                    arrayTime.append(value.valueForKey("time") as! Float)
                }
            }
        }
        catch{
            print("Error")
        }
        
    }
}

