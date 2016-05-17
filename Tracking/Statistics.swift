//
//  Statistics.swift
//  Tracking
//
//  Created by admin on 16.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation


class Statistics {
    
    var distance = NSUserDefaults.standardUserDefaults()
    var time = NSUserDefaults.standardUserDefaults()
    var averageSpeed = NSUserDefaults.standardUserDefaults()
    
    var calculateAverageSpeed:Float{
       return self.getDistance() / self.getTime()
    }
    
    
    func saveDistance(dis:Float){
        self.distance.setFloat(dis, forKey:"distance")
    }
    
    func getDistance() -> Float {
        return distance.floatForKey("distance")
    }
    
    func saveTime(time:Float){
        self.time.setFloat(time, forKey:"time")
    }
    func getTime() -> Float{
        return time.floatForKey("time")
    }
    
    func getAverageSpeed() -> Float {
        averageSpeed.setFloat(self.calculateAverageSpeed, forKey: "speed")
        return averageSpeed.floatForKey("speed")
    }
}