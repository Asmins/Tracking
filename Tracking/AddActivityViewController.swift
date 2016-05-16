//
//  AddActivityViewController.swift
//  Tracking
//
//  Created by admin on 12.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {

    @IBOutlet weak var labelForSpeed: UILabel!
    
    @IBOutlet weak var imageViewForPhoto: UIImageView!
    
    @IBOutlet weak var sliderDistance: UISlider!
    @IBOutlet weak var sliderTime: UISlider!
    
    @IBOutlet weak var labelCarrentForTime: UILabel!
    @IBOutlet weak var labelCarrentForDistance: UILabel!
    
    let speed = Speed()
    
    
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
        speed.saveDistance(distance)
        
        labelCarrentForDistance.text = "\(speed.getDistance())/\(allDistance) Km"
        if speed.getTime() == 0 {
            labelForSpeed.text = "Please set TIME "
        }
        else{
            labelForSpeed.text = String.localizedStringWithFormat("%.2f %@", speed.calculateSpeed(),"Km/H")
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
        speed.saveTime(time)
        
        labelCarrentForTime.text = "\(speed.getTime())/\(maxTime) Hour"
        if speed.getDistance() == 0 {
            labelForSpeed.text = "Please set Distance"
        }
        else{
            labelForSpeed.text = String.localizedStringWithFormat("%.2f %@", speed.calculateSpeed(),"Km/H")
        }
    }
    func calculateSpeed(){
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    

}
