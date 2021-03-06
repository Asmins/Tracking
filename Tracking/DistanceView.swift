//
//  CounterView.swift
//  Tracking
//
//  Created by admin on 23.05.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

import CoreData

class DistanceView: UIView {
    
    var maxValue = 0
    
    func getData(){
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let managedContext = appDelegate!.managedObjectContext
        
        let fetchRequest =  NSFetchRequest(entityName: "Goals")
        
        do{
            let fetchedResult = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            
            if let result = fetchedResult{
                
                for value in result{
                    maxValue = value.valueForKey("distance") as! Int
                
                }
                
            }
        }
        catch{
            print("Error")
        }
       
    }
 
    
    @IBInspectable var counter: Float = 0
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
 
        override func drawRect(rect: CGRect) {
            getData()
            let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
            
            let radius: CGFloat = max(bounds.width, bounds.height)
            
            let arcWidth: CGFloat = 25
            
            let startAngle: CGFloat = (CGFloat(M_PI)*3) / 2
            let endAngle: CGFloat = 270
            
            let path = UIBezierPath(arcCenter: center, radius: radius / 2 - arcWidth, startAngle: startAngle,endAngle: endAngle,clockwise: true)
            
            path.lineWidth = arcWidth
            counterColor.setStroke()
            path.stroke()
            
            let angleDifference: CGFloat = 2 * 3.14
            
            let arcLengthPerGlass = angleDifference / CGFloat(maxValue)
            
            let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
            
            if counter == 0 {
                
                let outlinePath = UIBezierPath(arcCenter: center,radius: radius/2 - 12.0,startAngle: startAngle,endAngle:outlineEndAngle,clockwise: true)
                
                outlinePath.addArcWithCenter(center,radius: radius/2 - arcWidth - 12,startAngle: outlineEndAngle,endAngle: startAngle,clockwise: false)
                
                outlinePath.closePath()
                outlineColor.setStroke()
                outlinePath.lineWidth = 5.0
                
                outlinePath.stroke()
                
            } else {
                
                let outlinePath = UIBezierPath(arcCenter: center,radius: radius/2 - 20.0,startAngle: startAngle,endAngle:outlineEndAngle,clockwise: true)
                
                outlinePath.addArcWithCenter(center,radius: radius/2 - arcWidth - 5,startAngle: outlineEndAngle,endAngle: startAngle,clockwise: false)
                
                outlinePath.closePath()
                outlineColor.setStroke()
                outlinePath.lineWidth = 15.0
                
                outlinePath.stroke()
                
            }
        
            
        }

    }

