//
//  HistoryTableViewController.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HistoryTableViewController:UITableViewController {
   
    var statistics = Statistics()
    
    
    var array = [Statistics]()
    
    var dis = [Float]()
    
    var time = [Float]()
    var avrspeed = [Float]()
    
    @IBOutlet var historyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        getStatistics()
        historyTableView.reloadData()
    }
  
    
    func getStatistics(){
        array.append(statistics)
        dis.append(statistics.getDistance())
        time.append(statistics.getTime())
        avrspeed.append(statistics.getAverageSpeed())
        
        print("Distance: \(dis)")
        print("Time: \(time)")
        print("Average Speed: \(avrspeed)")
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
            cell.labelForDistance?.text = "\(dis[indexPath.row])"
            cell.labelForTime?.text = "\(time[indexPath.row])"
            cell.labelForAvarageSpeed?.text = String.localizedStringWithFormat("%.2f", (avrspeed[indexPath.row]))
        
        return cell
    }
    
}
