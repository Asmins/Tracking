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
    let arrayDistance = [50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300]
    let arrayTime = [6,12,18,24,30,36,40,46,52,58,64,70,76,82,88,94,100]
    var distance = 0
    var time = 0
    var goals: Goals!
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveInDataBase(){
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            goals = NSEntityDescription.insertNewObjectForEntityForName("Goals", inManagedObjectContext: managedObjectContext) as! Goals
            goals.distance = self.distance
            goals.time = self.time
            do{
                try managedObjectContext.save()
            }catch{
                print("ERROR")
                return
            }
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == pickerViewDistance){
            self.distance = arrayDistance[row]
        }else{
            self.time = arrayTime[row]
        }
       saveInDataBase()
    }
    @IBAction func segmentActionController(sender: AnyObject) {
      
        switch segmentControler.selectedSegmentIndex {
        case 0:
            pickerViewDistance.selectRow(3, inComponent: 0, animated: true)
            self.distance = arrayDistance[3]
            pickervViewTime.selectRow(3, inComponent: 0, animated: true)
            self.time = arrayTime[3]
            saveInDataBase()
        case 1:
            pickerViewDistance.selectRow(11, inComponent: 0, animated: true)
            self.distance = arrayDistance[11]
            pickervViewTime.selectRow(6, inComponent: 0, animated: true)
            self.time = arrayTime[6]
            saveInDataBase()
        case 2:
            pickerViewDistance.selectRow(16, inComponent: 0, animated: true)
            pickervViewTime.selectRow(9, inComponent: 0, animated: true)
            self.distance = arrayDistance[16]
            self.time = arrayTime[9]
            saveInDataBase()
        default:
            print("Error")
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