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
   
   
    
    @IBAction func showHistoryView(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
   
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
