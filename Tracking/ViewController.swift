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
    
   // var traning = [NSManagedObject]()
    var arrayFloat = [Float]()
    var sum:Float = 0
    @IBOutlet weak var distanceView: DistanceView!
    @IBOutlet weak var timeView: TimeView!
    @IBOutlet weak var distanceLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
     }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getDistance()
        
        distanceView.counter = sum
        
        distanceLabel.text = "\(distanceView.counter)"
    }
    
    
    func getDistance(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest  = NSFetchRequest(entityName: "Traning")
        
        
        do{
            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let result = fetchedResult{
                for value in result{
                    sum = value.valueForKey("sumDistance") as! Float
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

