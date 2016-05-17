//
//  HistoryTableViewController.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
   
    var statistics = Statistics()
    
    var manager = Manager()
    
    @IBOutlet var historyTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        getStatistics()
    }
  
    
    func getStatistics(){
        statistics.getDistance()
        statistics.getTime()
        statistics.getAverageSpeed()
        manager.appendArray(statistics)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.traning.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        cell.labelForDistance?.text = "\(manager.traning[indexPath.row].getDistance())"
        cell.labelForTime?.text = "\(manager.traning[indexPath.row].getTime())"
        cell.labelForAvarageSpeed?.text = String.localizedStringWithFormat("%.2f", (manager.traning[indexPath.row].getAverageSpeed()))
        return cell
    }
    
}
