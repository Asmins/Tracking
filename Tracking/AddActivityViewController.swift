//
//  AddActivityViewController.swift
//  Tracking
//
//  Created by admin on 12.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {

    @IBOutlet weak var imageViewForPhoto: UIImageView!
    
    @IBOutlet weak var sliderDistance: UISlider!
    @IBOutlet weak var sliderTime: UISlider!
    
    @IBOutlet weak var labelCarrentForTime: UILabel!
    @IBOutlet weak var labelCarrentForDistance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPhotoButtom(sender: AnyObject) {
        
    }
    
    @IBAction func sliderActionDistance(sender: UISlider) {
        let currentValue = Float(sender.value)
        labelCarrentForDistance.text = "\(currentValue)" + "/21 km"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
