//
//  Statistics.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation


class Statistics {
    
    var distance:Float = 0
    var time:Float = 0
    
    var calculateAverageSpeed:Float{
        return self.distance / time
    }
    
    func saveDistance(dis:Float){
        self.distance = dis
    }
    
    func getDistance() -> Float {
        return distance
    }
    
    func saveTime(time:Float){
        self.time = time
    }
    func getTime() -> Float{
        return time
    }
    
    func getAverageSpeed() -> Float {
       return calculateAverageSpeed
    }

}