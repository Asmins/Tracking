//
//  AddActivityViewController.swift
//  Tracking
//
//  Created by admin on 12.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import CoreData


class AddActivityViewController: UIViewController {

    @IBOutlet weak var labelForSpeed: UILabel!
    
    @IBOutlet weak var imageViewForPhoto: UIImageView!
    
    @IBOutlet weak var sliderDistance: UISlider!
    @IBOutlet weak var sliderTime: UISlider!
    
    @IBOutlet weak var labelCarrentForTime: UILabel!
    @IBOutlet weak var labelCarrentForDistance: UILabel!
    
    
    let statistics = Statistics()
    
    let manager = Manager()
    
    var traning: Traning!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addPhotoButtom(sender: AnyObject) {
        
    }
    
    @IBAction func sliderActionDistance(sender: UISlider) {
        let currentValue = Float(sender.value)
        let correctvalue = String.localizedStringWithFormat("%.2f", currentValue)
        let allDistance = 21
        let distance:Float = Float(correctvalue)!
        
        labelCarrentForDistance.text = "\(statistics.getDistance())/\(allDistance) Km"
        
        statistics.saveDistance(distance)
        
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
       
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            traning = NSEntityDescription.insertNewObjectForEntityForName("Traning", inManagedObjectContext: managedObjectContext) as! Traning
            traning.distance = statistics.getDistance()
            traning.time = statistics.getTime()
            traning.averageSpeed = statistics.getAverageSpeed()
            
            do{
            try managedObjectContext.save()
            }
            catch{
                print(error)
                return
            }
            
            print(traning.distance)
            print(traning.time)
            print(traning.averageSpeed)
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

}
