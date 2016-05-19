//
//  Traning.swift
//  Tracking
//
//  Created by admin on 19.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import CoreData


class Traning: NSManagedObject {

    
    @NSManaged var distance: NSNumber
    @NSManaged var time: NSNumber
    @NSManaged var averageSpeed: NSNumber 
    @NSManaged var image: NSData?
    
    
    
}
