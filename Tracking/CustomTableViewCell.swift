//
//  CustomTableViewCell.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelForAvarageSpeed: UILabel!
    @IBOutlet weak var labelForTime: UILabel!
    @IBOutlet weak var labelForDistance: UILabel!
    
    @IBOutlet weak var progressViewForDistance: UIProgressView!
    @IBOutlet weak var progressViewForTime: UIProgressView!
    @IBOutlet weak var progressVIewForSpeed: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
