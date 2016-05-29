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
    
    var traning = [NSManagedObject]()
    var arrayFloat = [Float]()
    var sum:Float = 0
    @IBOutlet weak var distanceView: DistanceView!
    @IBOutlet weak var timeView: TimeView!
    @IBOutlet weak var distanceLabel: UILabel!
    
/*
    @IBAction func showActivityView(sender: AnyObject) {
        let show = self.storyboard?.instantiateViewControllerWithIdentifier("IdActivity") as! AddActivityViewController
        self.navigationController?.pushViewController(show, animated: true)
    }
  */  
    override func viewDidLoad() {
        super.viewDidLoad()
        getDistance()
        
     }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        calculateSumInArray()
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
                traning = result
            }else{
                print("Error")
            }
            
        }
        catch{
            print("Error")
        }
        
        for value in traning{
            
            arrayFloat.append(value.valueForKey("distance") as! Float)
        }

    }
    
    func calculateSumInArray(){
        for i in 0 ..< arrayFloat.count {
            sum = sum + arrayFloat[i]
            print(sum)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

