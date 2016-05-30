//
//  HistoryTableViewController.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewController:UITableViewController,NSFetchedResultsControllerDelegate {
   
    var traning = [NSManagedObject]()
    
    @IBOutlet var historyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
        self.historyTableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return traning.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
            let valueTraning = traning[indexPath.row]
        
        
            cell.labelForDistance?.text = "\(valueTraning.valueForKey("distance") as! Float)"
            cell.labelForTime?.text = "\(valueTraning.valueForKey("time") as! Float)"
            cell.labelForAvarageSpeed?.text = String.localizedStringWithFormat("%.2f", (valueTraning.valueForKey("averageSpeed") as! Float))
        
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showNavController"{
             if let indexPath = tableView.indexPathForSelectedRow{
                    let destinationController = segue.destinationViewController as! UINavigationController
                        let targetController = destinationController.topViewController as! HistoryActivityViewController
                        targetController.distance = traning[indexPath.row].valueForKey("distance") as! Float
                        targetController.time = traning[indexPath.row].valueForKey("time") as! Float
                        targetController.averageSpeed = traning[indexPath.row].valueForKey("averageSpeed") as! Float
                        targetController.image = traning[indexPath.row].valueForKey("image") as! NSData
                }
            }
        }
}
