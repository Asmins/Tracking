//
//  AddActivityViewController.swift
//  Tracking
//
//  Created by admin on 12.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import CoreData


class AddActivityViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var labelForSpeed: UILabel!
    @IBOutlet weak var imageViewForPhoto: UIImageView!
    @IBOutlet weak var sliderForDistance: UISlider!
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var labelCarrentForTime: UILabel!
    @IBOutlet weak var labelCarrentForDistance: UILabel!
    
    
    let statistics = Statistics()
    var traningValueFromBD = [NSManagedObject]()
    var distanceValueFromGoals = [NSManagedObject]()
    var goalsDistance = [Int]()
    var arrayForDistance = [Float]()
    var arrayForTime = [Float]()
    let image = UIImagePickerController()
    
    var traning: Traning!
    var calculate: Calculation!
    
    var sum:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhotoButtom(sender: AnyObject) {
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(image, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let info:NSDictionary = info as NSDictionary
        let image:UIImage = info.objectForKey(UIImagePickerControllerOriginalImage) as! UIImage
        
        imageViewForPhoto.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func sliderActionDistance(sender: UISlider) {
        let allDistance = 21
        let currentValue = Float(sender.value)
        let formattedFloat = String.localizedStringWithFormat("%.2f", currentValue)
        
        statistics.saveDistance(currentValue)
        
        labelCarrentForDistance.text = "\(formattedFloat)/\(allDistance) Km"
        
        if statistics.getTime() == 0 {
            labelForSpeed.text = "Please set TIME "
        }
        else{
            labelForSpeed.text = String.localizedStringWithFormat("%.2f %@", statistics.getAverageSpeed(),"Km/H")
        }

    }
    
    @IBAction func sliderActionForTime(sender: UISlider) {
        let maxTime = 6
        let currentValue = Int(sender.value)
        let hour = 60
        let calculate = currentValue / hour
        let drop = currentValue % hour
        let dropFloat = Float(drop) * 0.01
        let calculateFloat = Float(calculate)
        let time:Float = dropFloat + calculateFloat
        
        labelCarrentForTime.text = "\(statistics.getTime())/\(maxTime) Hour"
        
        statistics.saveTime(time)
        
        if statistics.getDistance() == 0 {
            labelForSpeed.text = "Please set Distance"
        }
        else{
            labelForSpeed.text = String.localizedStringWithFormat("%.2f %@",statistics.getAverageSpeed(),"Km/H")
        }
        
        
        
        
    }
    @IBAction func showStatisticsView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveActivity(sender: AnyObject) {
        
        getDistance()
        
        getDistanceFromGoals()
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            
            traning = NSEntityDescription.insertNewObjectForEntityForName("Traning", inManagedObjectContext: managedObjectContext) as! Traning
            
            calculate = NSEntityDescription.insertNewObjectForEntityForName("Calculation", inManagedObjectContext: managedObjectContext) as! Calculation
            
            traning.distance = statistics.getDistance()
            traning.time = statistics.getTime()
            traning.averageSpeed = statistics.getAverageSpeed()
            traning.image = UIImagePNGRepresentation(self.imageViewForPhoto.image!)!
            
            arrayForDistance.append(statistics.getDistance())
            arrayForTime.append(statistics.getTime())
            
            for i in 0..<arrayForDistance.count{
                sum = sum + arrayForDistance[i]
            }
            
//            let wholeDistance = arrayForDistance.reduce(0, combine: +)
        
            
            calculate.sumDistance = sum
           
            sum = 0
            
            for i in 0..<arrayForTime.count{
                sum = sum + arrayForTime[i]
            }
            calculate.sumTime = sum
            
            
            do{
                try managedObjectContext.save()
            }
            catch{
                print(error)
                return
            }
            
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func getDistance(){
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest  = NSFetchRequest(entityName: "Traning")
        
        //let fetchRequestForGoals = NSFetchRequest(entityName: "Goals")
        
        do{
            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let result = fetchedResult{
                traningValueFromBD = result
            }else{
                print("Error")
            }
            
        }
        catch{
            print("Error")
        }
        
        for value in traningValueFromBD{
            arrayForDistance.append(value.valueForKey("distance") as! Float)
            arrayForTime.append(value.valueForKey("time") as! Float)
        }
    }
    
    func getDistanceFromGoals(){
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest  = NSFetchRequest(entityName: "Goals")
        do{
            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let result = fetchedResult{
                distanceValueFromGoals = result
            }else{
                print("Error")
            }
            
        }
        catch{
            print("Error")
        }

        for value in distanceValueFromGoals{
            goalsDistance.append(value.valueForKey("distance") as! Int)
            print(goalsDistance)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
