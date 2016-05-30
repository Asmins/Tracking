//
//  HistoryActivityViewController.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import Social

class HistoryActivityViewController: UIViewController {

    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var averageSpeedLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
   
    var distance:Float = 0
    var time:Float = 0
    var averageSpeed:Float = 0
    var image = NSData()
    
    @IBAction func showHistoryView(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
   
    }
    @IBAction func shareAction(sender: AnyObject) {
        let shareMenu  = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
       
        let shareInFacebook = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default , handler: { (action)-> Void in
            guard SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)else{
                let alertMessage = UIAlertController(title: "Login ERROR ", message: "Please check your login", preferredStyle: .Alert)
                alertMessage.addAction(UIAlertAction(title: "Okey", style: .Default, handler: nil))
                self.presentViewController(alertMessage, animated: true, completion: nil)
                return
            }
            
            let facebookComposer = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookComposer.setInitialText("I ran \(self.distance) kilometers in \(self.time) hours" + "\n" + "And my average speed \(self.averageSpeed) km/h" + "\n" +   "I use application 'Tracking' ")
            facebookComposer.addImage(self.userImage.image)
            
            self.presentViewController(facebookComposer, animated: true, completion: nil)
            
        })
        
        let shareInTwitter = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: {(action)-> Void in
            guard SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter)else{
                let alertMessage = UIAlertController(title: "Login ERROR", message: "Please check you login", preferredStyle:.Alert)
                alertMessage.addAction(UIAlertAction(title: "Okey", style: .Default, handler: nil))
                self.presentViewController(alertMessage, animated: true, completion:nil)
                return
            }
            
                let twitterCompose = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                twitterCompose.setInitialText("I ran \(self.distance) kilometers in \(self.time) hours" + "\n" + "And my average speed \(self.averageSpeed) km/h" + "\n" +   "I use application 'Tracking'")
                twitterCompose.addImage(self.userImage.image)
            self.presentViewController(twitterCompose, animated: true, completion: nil)
            
        })
        
        
        let cancel = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel , handler:nil)
        
        shareMenu.addAction(shareInFacebook)
        shareMenu.addAction(shareInTwitter)
        shareMenu.addAction(cancel)
        
        self.presentViewController(shareMenu, animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distanceLabel.text = "\(distance)"
        timeLabel.text = "\(time)"
        averageSpeedLabel.text = String.localizedStringWithFormat("%.2f", averageSpeed)
        userImage.image = UIImage(data: image)
      }


    

  

}
