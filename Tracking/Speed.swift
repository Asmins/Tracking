
import Foundation

class Speed{
    
    var distance:Float = 0
    var time:Float = 0
    var speed:Float = 0
    
    
    func saveDistance(dis:Float){
        self.distance = dis
    }
    
    func getDistance() -> Float {
        return distance
    }
    
    func saveTime(time:Float){
        self.time = time
    }
    func getTime()->Float{
        return time
    }
    
    func calculateSpeed()-> Float{
        speed = distance / time
        return speed
    }
    
    
    
}
