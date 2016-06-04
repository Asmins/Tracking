//
//  Goals.swift
//  Tracking
//
//  Created by admin on 04.06.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import CoreData


class Goals: NSManagedObject {

    
    @NSManaged var sumDistance: NSNumber?
    @NSManaged var sumTime: NSNumber?
    @NSManaged var distance: NSNumber?
    @NSManaged var time: NSNumber?
    
    
}
