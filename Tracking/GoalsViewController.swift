//
//  GoalsViewController.swift
//  Tracking
//
//  Created by admin on 14.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var segmentControler: UISegmentedControl!
    @IBOutlet weak var pickerViewDistance: UIPickerView!
    @IBOutlet weak var pickervViewTime: UIPickerView!
    let arrayDistance = [50,60,70,180,90,100,110,120,130,140,150]
    let arrayTime = [6,12,18,24,30,36,40,46,52,58,64]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == pickerViewDistance){
        
        }else{
            
        }
    }
    
    @IBAction func segmentActionController(sender: AnyObject) {
        switch segmentControler.selectedSegmentIndex {
        case 0:
            print("Total")
        case 1:
            print("Week")
        case 2:
            print("Month")
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