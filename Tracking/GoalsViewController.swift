//
//  GoalsViewController.swift
//  Tracking
//
//  Created by admin on 14.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import CoreData

class GoalsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var segmentControler: UISegmentedControl!
    @IBOutlet weak var pickerViewDistance: UIPickerView!
    @IBOutlet weak var pickervViewTime: UIPickerView!
    let arrayDistance = [50,60,70,80,90,100,110,120,130,140,150]
    let arrayTime = [6,12,18,24,30,36,40,46,52,58,64]
    var distance = 0
    var time = 0
    var goals: Goals!
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == pickerViewDistance){
        self.distance = arrayDistance[row]
            print(self.distance)
        }else{
            self.time = arrayTime[row]
            print(self.time)
        }
    }
    
    @IBAction func segmentActionController(sender: AnyObject) {
      
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            goals = NSEntityDescription.insertNewObjectForEntityForName("Goals", inManagedObjectContext: managedObjectContext) as! Goals
            
        switch segmentControler.selectedSegmentIndex {
            
        case 0:
            goals.distance = self.distance
            goals.time = self.time
            goals.numberOfSelector = 1
            print("Week")
        case 1:
            goals.distance = self.distance
            goals.time = self.time
            print("Month")
            goals.numberOfSelector = 2
        case 2:
            goals.distance = self.distance
            goals.time = self.time
            print("Year")
            goals.numberOfSelector = 3 
            
        default:
            print("Error")
        }
            do{
                try managedObjectContext.save()
            
            }catch{
                print("ERROR")
                return
            }
    }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == pickerViewDistance){
            return arrayDistance.count
        }else{
            return arrayTime.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == pickerViewDistance){
            return "\(arrayDistance[row])"
        }else{
            return "\(arrayTime[row])"
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
}