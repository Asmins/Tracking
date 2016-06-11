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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        getDistance()
        
        distanceView.counter = sumDistance
        timeView.counter = sumTime
        
        distanceLabel.text = String.localizedStringWithFormat("%.2f", distanceView.counter)
        timeLabel.text = "\(timeView.counter)"
        distanceView.reloadInputViews()
       
        
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

