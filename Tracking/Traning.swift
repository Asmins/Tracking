//
//  Traning.swift
//  Tracking
//
//  Created by admin on 31.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import CoreData


class Traning: NSManagedObject {
   
    
    @NSManaged var averageSpeed: NSNumber?
    @NSManaged var distance: NSNumber?
    @NSManaged var image: NSData?
    @NSManaged var time: NSNumber?
    @NSManaged var sumDistance: NSNumber?
    
    
}
