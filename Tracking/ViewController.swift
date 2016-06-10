//
//  ViewController.swift
//  Tracking
//
//  Created by admin on 11.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,NSFetchedResultsControllerDelegate {
    
    var arrayFloat = [Float]()
    var sumDistance:Float = 0
    var sumTime:Float = 0
    
    @IBOutlet weak var distanceView: DistanceView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeView: TimeView!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getDistance()
        
        distanceView.counter = sumDistance
        timeView.counter = sumTime
        
        if distanceView.counter == 0 && timeView.counter == 0 {
            distanceView.counter = 0.1
            timeView.counter = 0.1
            timeLabel.text = "\(0)"
            distanceLabel.text = "\(0)"
         }else{
            timeLabel.text = "\(timeView.counter)"
            distanceLabel.text = "\(distanceView.counter)"
        }
    }
    
    
    func getDistance(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest  = NSFetchRequest(entityName: "Goals")
        
        
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
}

