//
//  HistoryActivityViewController.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HistoryActivityViewController: UIViewController {

    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var averageSpeedLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
   
    var distance:Float = 0
    var time:Float = 0
    var averageSpeed:Float = 0
    
    
    @IBAction func showHistoryView(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
   
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distanceLabel.text = "\(distance)"
        timeLabel.text = "\(time)"
        averageSpeedLabel.text = String.localizedStringWithFormat("%.2f", averageSpeed)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
